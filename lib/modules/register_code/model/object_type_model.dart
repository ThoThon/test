class ObjectTypeModel {
  final String value;
  final String text;

  const ObjectTypeModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ObjectTypeData để parse Json')
  factory ObjectTypeModel.fromJson(Map<String, dynamic> json) {
    return ObjectTypeModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
