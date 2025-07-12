import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize cache helper
  await CacheHelper.init();

  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Register CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Register ApiConsumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));

  // Register ApiService
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(apiConsumer: getIt(), cacheHelper: getIt()),
  );
}
