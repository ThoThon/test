class ListProcedureFilterModel {
  final String ten;
  final String tenCha;
  final String loai;
  final String ma;
  final String ghiChu;

  ListProcedureFilterModel({
    required this.ten,
    required this.tenCha,
    required this.loai,
    required this.ma,
    required this.ghiChu,
  });

  factory ListProcedureFilterModel.fromJson(Map<String, dynamic> json) {
    return ListProcedureFilterModel(
      ten: json['ten'] ?? '',
      tenCha: json['tenCha'] ?? '',
      loai: json['loai']?.toString() ?? '',
      ma: json['ma'] ?? '',
      ghiChu: json['ghiChu'] ?? '',
    );
  }
}
