class FileC12Model {
  final int nam;
  final int thang;
  final String c12FilePath;

  FileC12Model({
    required this.nam,
    required this.thang,
    required this.c12FilePath,
  });

  factory FileC12Model.fromJson(Map<String, dynamic> json) {
    return FileC12Model(
      nam: json['nam'] ?? 0,
      thang: json['thang'] ?? 0,
      c12FilePath: json['c12FilePath'] ?? '',
    );
  }
}
