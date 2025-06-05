class ResultLookupHistoryModel {
  final Buoc? buoc1;
  final Buoc? buoc2;
  final Buoc? buoc3;
  final Buoc? buoc4;
  final String trangThai;

  ResultLookupHistoryModel({
    required this.buoc1,
    required this.buoc2,
    required this.buoc3,
    required this.buoc4,
    required this.trangThai,
  });

  factory ResultLookupHistoryModel.fromJson(Map<String, dynamic> json) {
    return ResultLookupHistoryModel(
      buoc1: Buoc.fromJson(json['buoc_1'] ?? {}),
      buoc2: Buoc.fromJson(json['buoc_2'] ?? {}),
      buoc3: Buoc.fromJson(json['buoc_3'] ?? {}),
      buoc4: Buoc.fromJson(json['buoc_4'] ?? {}),
      trangThai: json['trangThai'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buoc_1': buoc1?.toJson(),
      'buoc_2': buoc2?.toJson(),
      'buoc_3': buoc3?.toJson(),
      'buoc_4': buoc4?.toJson(),
    };
  }
}

class Buoc {
  final String ngayKetQua;
  final String maKetQua;
  final String moTaKetQua;
  final bool isFail;

  Buoc({
    required this.ngayKetQua,
    required this.maKetQua,
    required this.moTaKetQua,
    required this.isFail,
  });

  factory Buoc.fromJson(Map<String, dynamic> json) {
    return Buoc(
      ngayKetQua: json['ngay_ketqua'] ?? '',
      maKetQua: json['ma_ketqua'] ?? '',
      moTaKetQua: json['mota_ketqua'] ?? '',
      isFail: json['isFail'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ngay_ketqua': ngayKetQua,
      'ma_ketqua': maKetQua,
      'mota_ketqua': moTaKetQua,
      'isFail': isFail,
    };
  }
}
