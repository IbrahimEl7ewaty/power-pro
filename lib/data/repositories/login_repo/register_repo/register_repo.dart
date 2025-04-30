import 'package:dio/dio.dart';

class AuthRepository {
  final Dio dio = Dio();
  static const String _baseUrl = 'https://68122dca3ac96f7119a72c38.mockapi.io';
  static const String _usersEndpoint = '$_baseUrl/users';

  // Register User
  Future<void> register(String username, String email, String password) async {
    try {
      final response = await dio.post(
        _usersEndpoint,
        data: {'username': username, 'email': email, 'password': password},
      );

      if (response.statusCode != 201) {
        throw Exception(
          "Failed to register user. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Register failed: $e");
    }
  }

  // Login User
}
