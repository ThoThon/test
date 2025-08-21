/// Tuyến bệnh viện
class HospitalLineData {
  final String? value;
  final String? text;

  const HospitalLineData({
    this.value,
    this.text,
  });

  factory HospitalLineData.fromJson(Map<String, dynamic> json) {
    return HospitalLineData(
      value: json['value'],
      text: json['text'],
    );
  }
}
