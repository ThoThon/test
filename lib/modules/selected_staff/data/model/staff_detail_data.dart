class StaffDetailData {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final String? chucVu;

  StaffDetailData({
    this.id,
    this.hoTen,
    this.maSoBHXH,
    this.soCCCD,
    this.chucVu,
  });

  factory StaffDetailData.fromJson(Map<String, dynamic> json) {
    return StaffDetailData(
      id: json['id'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
      soCCCD: json['soCCCD'],
      chucVu: json['chucVu'],
    );
  }
}
