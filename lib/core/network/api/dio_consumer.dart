import 'package:dio/dio.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_end_point.dart';
import 'package:power_pro_app/core/network/api/api_interceptors.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
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
          headers: {
            
            'Content-Type':
                isFormData ? 'multipart/form-data' : 'application/json',
            "Authorization":
            
                "Bearer ${CacheHelper().getData(key: 'token') ?? ''}",
          },
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
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Content-Type':
                isFormData ? 'multipart/form-data' : 'application/json',
            "Authorization":
                "Bearer ${CacheHelper().getData(key: 'token') ?? ''}",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

    // Added PUT method
  @override
  Future put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) async {
    try {
      final response = await dio.put(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Content-Type':
                isFormData ? 'multipart/form-data' : 'application/json',
            "Authorization":
                "Bearer ${CacheHelper().getData(key: 'token') ?? ''}",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
