class OtpRequest {
  final String email;
  final String otp;

  OtpRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }

  factory OtpRequest.fromJson(Map<String, dynamic> json) {
    return OtpRequest(email: json['email'], otp: json['otp']);
  }
}
