class RelationshipData {
  final String? value;
  final String? text;

  const RelationshipData({
    required this.value,
    required this.text,
  });

  factory RelationshipData.fromJson(Map<String, dynamic> json) {
    return RelationshipData(
      value: json['value'],
      text: json['text'],
    );
  }
}
