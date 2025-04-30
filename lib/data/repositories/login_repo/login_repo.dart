import 'package:dio/dio.dart';

class LoginRepo {
  final Dio dio = Dio();
  static const String _baseUrl = 'https://68122dca3ac96f7119a72c38.mockapi.io';
  static const String _usersEndpoint = '$_baseUrl/users';
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await dio.get(
        _usersEndpoint,
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        final users = response.data as List;

        final user = users.firstWhere(
          (u) =>
              u['email'].toString().trim().toLowerCase() ==
                  email.trim().toLowerCase() &&
              u['password'].toString().trim() == password.trim(),
          orElse: () => null,
        );

        if (user == null) {
          throw Exception("Invalid email or password");
        }
      } else {
        throw Exception("Login failed. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
