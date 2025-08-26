class LookupC12Data {
  final int year;
  final int month;
  final String c12FilePath;

  LookupC12Data({
    required this.year,
    required this.month,
    required this.c12FilePath,
  });

  factory LookupC12Data.fromJson(Map<String, dynamic> json) {
    return LookupC12Data(
      year: json['nam'],
      month: json['thang'],
      c12FilePath: json['c12FilePath'],
    );
  }
}
