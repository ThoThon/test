class DeclaredStaffModel {
  final String id;
  final int index;
  final String name;
  final String bhxhNumber;

  const DeclaredStaffModel({
    required this.id,
    required this.index,
    required this.name,
    required this.bhxhNumber,
  });

  factory DeclaredStaffModel.fromJson(Map<String, dynamic> json) {
    return DeclaredStaffModel(
      id: json['id'] ?? '',
      index: json['stt'] ?? 0,
      name: json['hoTen'] ?? '',
      bhxhNumber: json['maSoBHXH'] ?? '',
    );
  }
}
