/// Chỉ có năm sinh - Dùng cho tờ khai TK1 của thủ tục 607
class BirthTypeData {
  final String? value;
  final String? text;

  const BirthTypeData({
    this.value,
    this.text,
  });

  factory BirthTypeData.fromJson(Map<String, dynamic> json) {
    return BirthTypeData(
      value: json['value'],
      text: json['text'],
    );
  }
}
