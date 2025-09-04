class PositionData {
  final int? id;
  final String? name;

  const PositionData({
    this.id,
    this.name,
  });

  factory PositionData.fromJson(Map<String, dynamic> json) {
    return PositionData(
      id: json['id'],
      name: json['tenChucVu'],
    );
  }
}
