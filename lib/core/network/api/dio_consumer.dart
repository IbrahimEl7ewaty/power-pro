import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_end_point.dart';
import 'package:power_pro_app/core/network/api/api_interceptors.dart';
import 'package:power_pro_app/core/network/errors/exceptions.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        request: true,
        error: true,
      ),
    );
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        options: Options(
          headers:
              isFormData
                  ? {'Content-Type': 'multipart/form-data'}
                  : {'Content-Type': 'application/json'},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.signIn,

        data: jsonEncode(data),
        queryParameters: queryParameters,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
