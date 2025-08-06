class ProcedureData {
  final String? name;
  final String? parentName;
  final int? type;
  final String? code;
  final String? note;

  const ProcedureData({
    this.name,
    this.parentName,
    this.type,
    this.code,
    this.note,
  });

  factory ProcedureData.fromJson(Map<String, dynamic> json) {
    return ProcedureData(
      name: json['ten'],
      parentName: json['tenCha'],
      type: json['loai'],
      code: json['ma'],
      note: json['ghiChu'],
    );
  }
}
