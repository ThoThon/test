class RegisterReceiveResultModel {
  final String value;
  final String text;

  const RegisterReceiveResultModel({
    required this.value,
    required this.text,
  });

  factory RegisterReceiveResultModel.fromJson(Map<String, dynamic> json) {
    return RegisterReceiveResultModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
