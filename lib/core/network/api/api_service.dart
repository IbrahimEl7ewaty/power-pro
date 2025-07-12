import 'package:dio/dio.dart';
import 'package:power_pro_app/core/models/blog_model.dart';
import 'package:power_pro_app/core/models/contact_request.dart';
import 'package:power_pro_app/core/models/forgot_password_request.dart';
import 'package:power_pro_app/core/models/forgot_password_response.dart';
import 'package:power_pro_app/core/models/login_request.dart';
import 'package:power_pro_app/core/models/login_response.dart';
import 'package:power_pro_app/core/models/otp_request.dart';
import 'package:power_pro_app/core/models/otp_response.dart';
import 'package:power_pro_app/core/models/register_confirm_request.dart';
import 'package:power_pro_app/core/models/register_confirm_response.dart';
import 'package:power_pro_app/core/models/register_request.dart';
import 'package:power_pro_app/core/models/register_response.dart';
import 'package:power_pro_app/core/models/reset_password_request.dart';
import 'package:power_pro_app/core/models/reset_password_response.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_end_point.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/presentation/screens/home/data/home_model.dart' show ResponseHomeData;
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/profile/data/profile_model.dart';
import 'package:power_pro_app/presentation/screens/more/videos/data/model.dart';

class ApiService {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  ApiService({required this.apiConsumer, required this.cacheHelper});

  /// Register new user
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.register,
        data: registerRequest.toJson(),
      );

      final registerResponse = RegisterResponse.fromJson(response);
      return registerResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Confirm registration with OTP
  Future<RegisterConfirmResponse> confirmRegistration(
    RegisterConfirmRequest registerConfirmRequest,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.registerConfirm,
        data: registerConfirmRequest.toJson(),
      );

      final registerConfirmResponse = RegisterConfirmResponse.fromJson(
        response,
      );
      return registerConfirmResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Login user with email and password
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.signIn,
        data: loginRequest.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(response);

      // Save token to cache
      await cacheHelper.saveData(key: 'token', value: loginResponse.data.token);

      // Save user data to cache
      await cacheHelper.saveData(
        key: 'user_data',
        value: loginResponse.data.user.toJson().toString(),
      );

      // Save login status
      await cacheHelper.saveData(key: 'is_logged_in', value: true);

      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Forgot password
  Future<ForgotPasswordResponse> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.forgotPassword,
        data: forgotPasswordRequest.toJson(),
      );

      final forgotPasswordResponse = ForgotPasswordResponse.fromJson(response);
      return forgotPasswordResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Reset password
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.resetPassword,
        data: resetPasswordRequest.toJson(),
      );

      final resetPasswordResponse = ResetPasswordResponse.fromJson(response);
      return resetPasswordResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await cacheHelper.removeData(key: 'token');
      await cacheHelper.removeData(key: 'user_data');
      await cacheHelper.removeData(key: 'is_logged_in');
    } catch (e) {
      rethrow;
    }
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    try {
      final bool? isLoggedIn = await cacheHelper.getData(key: 'is_logged_in');
      return isLoggedIn ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get saved token
  String? getToken() {
    try {
      return cacheHelper.getDataString(key: 'token');
    } catch (e) {
      return null;
    }
  }

  /// Confirm OTP
  Future<OtpResponse> confirmOtp(OtpRequest otpRequest) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.otpConfirm,
        data: otpRequest.toJson(),
      );

      final otpResponse = OtpResponse.fromJson(response);
      return otpResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Register confirm
  Future<RegisterConfirmResponse> registerConfirm(
    RegisterConfirmRequest registerConfirmRequest,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.registerConfirm,
        data: registerConfirmRequest.toJson(),
      );

      final registerConfirmResponse = RegisterConfirmResponse.fromJson(
        response,
      );
      return registerConfirmResponse;
    } catch (e) {
      rethrow;
    }
  }

  // blog
  Future<List<Blog>> getBlogData() async {
    try {
      final response = await apiConsumer.get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.blogPage}',
        queryParameters: {'page': 1, 'limit': 10},
      );

      // Assuming your BlogResponse and Blog model are already set
      final blogResponse = BlogResponse.fromJson(response);

      return blogResponse.data.blogs ?? [];
    } catch (e) {
      rethrow;
    }
  }

  //videos
  Future<List<Video>> getVideoData() async {
    try {
      final response = await apiConsumer.get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.videoPage}?page=1&limit=3',
      );

      // Parse the response into VideoResponse
      final videoResponse = VideoResponse.fromJson(response);

      return videoResponse.data.allVideos;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch video details by ID
  Future<Video> getVideoDetails(String videoId) async {
    try {
      final response = await apiConsumer.get(
        '${ApiEndPoint.baseUrl}/api/energy/videos/$videoId',
      );
      print(response);
      final videoData = response['data']['video'];
      return Video.fromJson(videoData);
    } catch (e) {
      rethrow;
    }
  }

  /// Send contact request
  Future<Map<String, dynamic>> sendContactMessage(
    String subject,
    String message,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoint.contactPage,
        data: {"subject": subject, "message": message},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send message');
    }
  }

  /// Fetch energy sources data
  Future<List<EnergySource>> getEnergySourcesData() async {
    try {
      final response = await apiConsumer.get(
        'https://121e41c5-2554-42c0-aa62-c32e7b2f1188-00-1u70yjdaemlnn.worf.replit.dev/api/energy/source/?page=1&limit=10',
      );
      if (response != null && response['data'] != null) {
        List<dynamic> data = response['data'];
        return data.map((e) => EnergySource.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load energy sources: $e');
    }
  }

  // Fetch the EnergySavingTips data
  Future<List<EnergyTips>> getEnergyTipsData() async {
    try {
      final response = await apiConsumer.get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.energytipsPage}',
        queryParameters: {'page': 1, 'limit': 10},
      );

      // التحقق من حالة الاستجابة
      if (response['status'] == 'success' && response['data'] != null) {
        return (response['data']['allTips'] as List<dynamic>)
            .map((data) => EnergyTips.fromJson(data))
            .toList();
      } else {
        // في حال كانت الاستجابة غير صحيحة أو فارغة
        throw Exception('Failed to load energy tips: ${response['message']}');
      }
    } catch (e) {
      rethrow; // إعادة الرمي لإظهار الخطأ
    }
  }

  /// Update User Name (First Name and Last Name)
  Future<Map<String, dynamic>> updateUserName(
    String firstName,
    String lastName,
  ) async {
    try {
      final response = await apiConsumer.put(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.updateName}',
        data: {'firstName': firstName, 'lastName': lastName},
      );

      return response; // Return the response
    } catch (e) {
      rethrow; // Rethrow any errors for higher level handling
    }
  }

  Future<UserModelProfile> getUserProfile() async {
    try {
      final response = await apiConsumer.get(
        ApiEndPoint.updatedImage,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CacheHelper().getData(key: 'token') ?? ''}',
          },
        ),
      );

      return UserModelProfile.fromJson(response); // استخدام الكلاس المعدل
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }

  // دالة لرفع صورة الملف الشخصي
  Future<Map<String, dynamic>> updateProfileImage(String imagePath) async {
    try {
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(imagePath),
      });

      final response = await apiConsumer.put(
        ApiEndPoint.updatedImage,
        data: formData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CacheHelper().getData(key: 'token') ?? ''}',
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to update profile image');
    }
  }


  /// Fetch home data from the API
  Future<ResponseHomeData> getHomeData() async {
    try {
      final response = await apiConsumer.get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.homePage}',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CacheHelper().getData(key: 'token') ?? ''}',
          },)
      );

      // Parse the response and return a ResponseHomeData object
      return ResponseHomeData.fromJson(response);
    } catch (e) {
      rethrow;  // Rethrow the error if it occurs
    }
  }

}
