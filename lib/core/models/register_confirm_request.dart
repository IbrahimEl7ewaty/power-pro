class RegisterConfirmRequest {
  final String email;
  final String otp;

  RegisterConfirmRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }

  factory RegisterConfirmRequest.fromJson(Map<String, dynamic> json) {
    return RegisterConfirmRequest(email: json['email'], otp: json['otp']);
  }
}
