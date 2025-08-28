class CategoriesData {
  final String? value;
  final String? text;

  CategoriesData({
    this.value,
    this.text,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    return CategoriesData(
      value: json['value'],
      text: json['text'],
    );
  }
}
