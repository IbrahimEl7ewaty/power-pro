import 'package:dio/dio.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] =
        CacheHelper().getData(key: 'token') != null
            ? CacheHelper().getData(key: 'token')
            : 'no Token';
    super.onRequest(options, handler);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
