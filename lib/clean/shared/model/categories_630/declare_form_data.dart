/// Hình thức kê khai
class DeclareForm630Data {
  final String? value;
  final String? text;

  const DeclareForm630Data({
    this.value,
    this.text,
  });

  factory DeclareForm630Data.fromJson(Map<String, dynamic> json) {
    return DeclareForm630Data(
      value: json['value'],
      text: json['text'],
    );
  }
}
