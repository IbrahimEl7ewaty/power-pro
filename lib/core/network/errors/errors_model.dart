class ErrorsModel {
  final int status;
  final String errorMessage;

  ErrorsModel({
    required this.status,
    required this.errorMessage,
  });
  factory ErrorsModel.fromJson(Map<String, dynamic> json) {
    return ErrorsModel(
      status: json['status']??0,
      errorMessage: json['message']??'null',
    );
  }
}
