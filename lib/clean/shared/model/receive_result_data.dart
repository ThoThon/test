/// Nhận kết quả hồ sơ - Dùng cho tờ khai TK1 của thủ tục 607
class ReceiveResultData {
  final String? value;
  final String? text;

  const ReceiveResultData({
    this.value,
    this.text,
  });

  factory ReceiveResultData.fromJson(Map<String, dynamic> json) {
    return ReceiveResultData(
      value: json['value'],
      text: json['text'],
    );
  }
}
