class HistoryResults {
  final String id;
  final String maThuTuc;
  final DateTime thoiGianGui;
  final String soHoSo;
  final String thang;
  final String nam;
  final String trangThai;

  HistoryResults({
    required this.id,
    required this.maThuTuc,
    required this.thoiGianGui,
    required this.soHoSo,
    required this.thang,
    required this.nam,
    required this.trangThai,
  });

  factory HistoryResults.fromJson(Map<String, dynamic> json) {
    return HistoryResults(
      id: json['id'] ?? '',
      maThuTuc: json['maThuTuc'] ?? '',
      thoiGianGui: DateTime.parse(json['thoiGianGui'] ?? ''),
      soHoSo: json['soHoSo'] ?? '',
      thang: json['thang'] ?? '',
      nam: json['nam'] ?? '',
      trangThai: json['trangThai'] ?? '',
    );
  }
}
