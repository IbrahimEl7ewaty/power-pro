import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:power_pro_app/core/network/errors/errors_model.dart';


class ServerException implements Exception {
  final ErrorsModel errorsModel;
  ServerException({required this.errorsModel});
}

Map<String, dynamic> _parseErrorData(dynamic data) {
  try {
    if (data is String) {
      return jsonDecode(data);
    } else if (data is Map<String, dynamic>) {
      return data;
    } else {
      return {"message": "Unknown error format"};
    }
  } catch (_) {
    return {"message": data.toString()};
  }
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );

    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );

    case DioExceptionType.badCertificate:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
        case 401:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData("${e.response!.data} nooooo"),
            ),
          );
        case 403:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
        case 404:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
        case 409:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
        case 422:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
        case 504:
          throw ServerException(
            errorsModel: ErrorsModel.fromJson(
              _parseErrorData(e.response!.data),
            ),
          );
      }
      break;
    case DioExceptionType.cancel:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );

    case DioExceptionType.unknown:
      throw ServerException(
        errorsModel: ErrorsModel.fromJson(_parseErrorData(e.response!.data)),
      );
  }
}
