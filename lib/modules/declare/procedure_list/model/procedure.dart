class Procedure {
  final String ten;
  final String tenCha;
  final int loai;
  final String ma;
  final String ghiChu;

  const Procedure({
    required this.ten,
    required this.tenCha,
    required this.loai,
    required this.ma,
    required this.ghiChu,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      ten: json['ten'] ?? '',
      tenCha: json['tenCha'] ?? '',
      loai: json['loai'] ?? 0,
      ma: json['ma'] ?? '',
      ghiChu: json['ghiChu'] ?? '',
    );
  }
}
