/// Phẫu thuật hoặc thai dưới 32 tuần
class SurgeryPregnancy32wData {
  final String? value;
  final String? text;

  const SurgeryPregnancy32wData({
    this.value,
    this.text,
  });

  factory SurgeryPregnancy32wData.fromJson(Map<String, dynamic> json) {
    return SurgeryPregnancy32wData(
      value: json['value'],
      text: json['text'],
    );
  }
}
