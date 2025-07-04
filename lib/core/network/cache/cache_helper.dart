import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static bool _isInitialized = false;

  //! Here The Initialize of cache.
  static Future<void> init() async {
    if (!_isInitialized) {
      sharedPreferences = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
  }

  //! this method to get data in string format from local storage
  String? getDataString({required String key}) {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! this method to get data already saved in local database
  dynamic getData({required String key}) {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');
    return sharedPreferences.get(key);
  }

  //! remove data using specific key
  Future<bool> removeData({required String key}) async {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');
    return sharedPreferences.containsKey(key);
  }

  //! clear all data from shared preferences
  Future<bool> clearData() async {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');
    return await sharedPreferences.clear();
  }

  //! this method to put data in local data base using key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (!_isInitialized) throw Exception('CacheHelper is not initialized');

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
