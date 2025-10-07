class StaffInfoData {
  final String? id;
  final int? stt;
  final String? hoTen;
  final String? maSoBHXH;

  StaffInfoData({
    this.id,
    this.stt,
    this.hoTen,
    this.maSoBHXH,
  });

  factory StaffInfoData.fromJson(Map<String, dynamic> json) {
    return StaffInfoData(
      id: json['id'],
      stt: json['stt'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
    );
  }
}
