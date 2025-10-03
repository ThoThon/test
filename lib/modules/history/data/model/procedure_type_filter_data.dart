class ProcedureTypeFilterData {
  final String? ten;
  final String? tenCha;
  final int? loai;
  final String? ma;
  final String? ghiChu;

  ProcedureTypeFilterData({
    this.ten,
    this.tenCha,
    this.loai,
    this.ma,
    this.ghiChu,
  });

  factory ProcedureTypeFilterData.fromJson(Map<String, dynamic> json) {
    return ProcedureTypeFilterData(
      ten: json['ten'],
      tenCha: json['tenCha'],
      loai: json['loai'],
      ma: json['ma'],
      ghiChu: json['ghiChu'],
    );
  }
}
