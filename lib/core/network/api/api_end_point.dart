class ApiEndPoint {
  static String baseUrl =
      'https://121e41c5-2554-42c0-aa62-c32e7b2f1188-00-1u70yjdaemlnn.worf.replit.dev/';
  static String signIn = 'auth/login';
  static String register = 'auth/register/request';
  static String otpConfirm = 'auth/otp/confirm';
  static String otpResend = 'auth/otp/resend';
  static String registerConfirm = 'auth/register/confirm';
  static String forgotPassword = 'auth/forgot-password';
  static String resetPassword = 'auth/reset-password';
  static String otpResetPassword = 'auth/reset-password';
  static String homePage = 'api/home/';
  static String energySourcePage = 'energy/source';
  static String energytipsPage = 'api/energy/tips';
  static String videoPage = 'api/energy/videos/?page=1&limit=10';
  static String blogPage = 'api/energy/blogs';
  static String contactPage = 'api/contact';
  static String updateName = 'api/users/updated-name';
  static String updatedImage = 'api/users/updated-image';
}
