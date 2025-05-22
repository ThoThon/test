class Procedure {
  final String name;
  final String parentName;
  final int type;
  final String code;
  final String note;

  const Procedure({
    required this.name,
    required this.parentName,
    required this.type,
    required this.code,
    required this.note,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      name: json['ten'] ?? '',
      parentName: json['tenCha'] ?? '',
      type: json['loai'] ?? 0,
      code: json['ma'] ?? '',
      note: json['ghiChu'] ?? '',
    );
  }
}
