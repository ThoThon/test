class StaffInfoData {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final String? chucVu;

  StaffInfoData({
    this.id,
    this.hoTen,
    this.maSoBHXH,
    this.soCCCD,
    this.chucVu,
  });

  factory StaffInfoData.fromJson(Map<String, dynamic> json) {
    return StaffInfoData(
      id: json['id'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
      soCCCD: json['soCCCD'],
      chucVu: json['chucVu'],
    );
  }
}
