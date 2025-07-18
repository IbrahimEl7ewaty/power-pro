class OtpResponse {
  final String message;

  OtpResponse({required this.message});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
