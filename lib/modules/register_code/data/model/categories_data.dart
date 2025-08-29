class CategoryData {
  final String? value;
  final String? text;

  CategoryData({
    this.value,
    this.text,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      value: json['value'],
      text: json['text'],
    );
  }
}
