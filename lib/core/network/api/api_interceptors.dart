import 'package:dio/dio.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add token to headers if available
    print('token----------: ${CacheHelper().getData(key: 'token')}');
    options.headers['token'] =
        CacheHelper().getData(key: 'token') ?? 'no Token';
    super.onRequest(options, handler);
  }
}
