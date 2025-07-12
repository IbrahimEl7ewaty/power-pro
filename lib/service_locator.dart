import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_end_point.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize cache helper
  await CacheHelper.init();

  // Cache
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = ApiEndPoint.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  });

  // API Consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));

  // API Service
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(apiConsumer: getIt(), cacheHelper: getIt()),
  );
}
