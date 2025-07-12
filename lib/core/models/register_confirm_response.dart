class RegisterConfirmResponse {
  final String message;

  RegisterConfirmResponse({required this.message});

  factory RegisterConfirmResponse.fromJson(Map<String, dynamic> json) {
    return RegisterConfirmResponse(message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
