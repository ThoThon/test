class RegisterServiceInfoModel {
  final String idCongTy;
  final String tenCongTy;
  final String maSoThue;
  final String maDonVi;
  final String maCQQL;
  final String tenCQQL;
  final String tenChuTheCTS;
  final String tenToChucCKS;
  final DateTime? thoiHanTuNgay;
  final DateTime? thoiHanDenNgay;
  final String email;
  final String dienThoai;
  final String soSerialCTS;

  RegisterServiceInfoModel({
    required this.idCongTy,
    required this.tenCongTy,
    required this.maSoThue,
    required this.maDonVi,
    required this.maCQQL,
    required this.tenCQQL,
    required this.tenChuTheCTS,
    required this.tenToChucCKS,
    required this.thoiHanTuNgay,
    required this.thoiHanDenNgay,
    required this.email,
    required this.dienThoai,
    required this.soSerialCTS,
  });

  factory RegisterServiceInfoModel.fromJson(Map<String, dynamic> json) {
    return RegisterServiceInfoModel(
      idCongTy: json['idCongTy'] ?? '',
      tenCongTy: json['tenCongTy'] ?? '',
      maSoThue: json['maSoThue'] ?? '',
      maDonVi: json['maDonVi'] ?? '',
      maCQQL: json['maCQQL'] ?? '',
      tenCQQL: json['tenCQQL'] ?? '',
      tenChuTheCTS: json['tenChuTheCTS'] ?? '',
      tenToChucCKS: json['tenToChucCKS'] ?? '',
      thoiHanTuNgay: json['thoiHanTuNgay'] != null
          ? DateTime.tryParse(json['thoiHanTuNgay'])
          : null,
      thoiHanDenNgay: json['thoiHanDenNgay'] != null
          ? DateTime.tryParse(json['thoiHanDenNgay'])
          : null,
      email: json['email'] ?? '',
      dienThoai: json['dienThoai'] ?? '',
      soSerialCTS: json['soSerialCTS'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCongTy': idCongTy,
      'tenCongTy': tenCongTy,
      'maSoThue': maSoThue,
      'maDonVi': maDonVi,
      'maCQQL': maCQQL,
      'tenCQQL': tenCQQL,
      'tenChuTheCTS': tenChuTheCTS,
      'tenToChucCKS': tenToChucCKS,
      'thoiHanTuNgay': thoiHanTuNgay?.toIso8601String(),
      'thoiHanDenNgay': thoiHanDenNgay?.toIso8601String(),
      'email': email,
      'dienThoai': dienThoai,
      'soSerialCTS': soSerialCTS,
    };
  }
}
