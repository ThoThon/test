class StepData {
  final String? ngayKetQua;
  final String? maKetQua;
  final String? moTaKetQua;
  final bool? isFail;

  StepData({
    this.ngayKetQua,
    this.maKetQua,
    this.moTaKetQua,
    this.isFail,
  });

  factory StepData.fromJson(Map<String, dynamic> json) {
    return StepData(
      ngayKetQua: json['ngay_ketqua'],
      maKetQua: json['ma_ketqua'],
      moTaKetQua: json['mota_ketqua'],
      isFail: json['isFail'],
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
