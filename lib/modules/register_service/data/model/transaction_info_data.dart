class TransactionInfoData {
  final String? idCongTy;
  final String? tenCongTy;
  final String? maSoThue;
  final String? maDonVi;
  final String? maCQQL;
  final String? tenCQQL;
  final String? tenChuTheCTS;
  final String? tenToChucCKS;
  final DateTime? thoiHanTuNgay;
  final DateTime? thoiHanDenNgay;
  final String? email;
  final String? dienThoai;
  final String? soSerialCTS;
  final String? userId; // Mã người dùng trong hệ thống MySign

  TransactionInfoData({
    this.idCongTy,
    this.tenCongTy,
    this.maSoThue,
    this.maDonVi,
    this.maCQQL,
    this.tenCQQL,
    this.tenChuTheCTS,
    this.tenToChucCKS,
    this.thoiHanTuNgay,
    this.thoiHanDenNgay,
    this.email,
    this.dienThoai,
    this.soSerialCTS,
    this.userId, // Mã người dùng trong hệ thống MySign
  });

  factory TransactionInfoData.fromJson(Map<String, dynamic> json) {
    return TransactionInfoData(
      idCongTy: json['idCongTy'],
      tenCongTy: json['tenCongTy'],
      maSoThue: json['maSoThue'],
      maDonVi: json['maDonVi'],
      maCQQL: json['maCQQL'],
      tenCQQL: json['tenCQQL'],
      tenChuTheCTS: json['tenChuTheCTS'],
      tenToChucCKS: json['tenToChucCKS'],
      thoiHanTuNgay: json['thoiHanTuNgay'] != null
          ? DateTime.tryParse(json['thoiHanTuNgay'])
          : null,
      thoiHanDenNgay: json['thoiHanDenNgay'] != null
          ? DateTime.tryParse(json['thoiHanDenNgay'])
          : null,
      email: json['email'],
      dienThoai: json['dienThoai'],
      soSerialCTS: json['soSerialCTS'],
      userId: json['userId'],
    );
  }
}
