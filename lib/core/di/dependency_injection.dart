import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize CacheHelper
  await CacheHelper.init();

  // Register CacheHelper
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // Register Dio
  getIt.registerSingleton<Dio>(Dio());

  // Register ApiConsumer
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: getIt<Dio>()));

  // Register ApiService
  getIt.registerSingleton<ApiService>(
    ApiService(
      apiConsumer: getIt<ApiConsumer>(),
      cacheHelper: getIt<CacheHelper>(),
    ),
  );
}
