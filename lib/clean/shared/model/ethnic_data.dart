/// Dân tộc
class EthnicData {
  final int? value;
  final String? text;

  const EthnicData({
    this.value,
    this.text,
  });

  factory EthnicData.fromJson(Map<String, dynamic> json) {
    return EthnicData(
      value: int.tryParse(json['value'].toString()),
      text: json['text'],
    );
  }
}
