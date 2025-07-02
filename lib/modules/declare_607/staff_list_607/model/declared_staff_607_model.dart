class DeclaredStaff607Model {
  final String id;
  final int index;
  final String name;
  final String bhxhNumber;

  const DeclaredStaff607Model({
    required this.id,
    required this.index,
    required this.name,
    required this.bhxhNumber,
  });

  factory DeclaredStaff607Model.fromJson(Map<String, dynamic> json) {
    return DeclaredStaff607Model(
      id: json['id'] ?? '',
      index: json['stt'] ?? 0,
      name: json['hoTen'] ?? '',
      bhxhNumber: json['maSoBHXH'] ?? '',
    );
  }
}
