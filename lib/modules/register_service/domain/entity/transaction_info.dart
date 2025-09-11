class TransactionInfo {
  final String idCongTy;
  final String tenCongTy;
  final String maSoThue;
  final String maDonVi;
  final String maCQQL;
  final String tenCQQL;
  final String tenChuTheCTS;
  final String tenToChucCKS;
  final DateTime thoiHanTuNgay;
  final DateTime thoiHanDenNgay;
  final String email;
  final String dienThoai;
  final String soSerialCTS;
  final String userId; // Mã người dùng trong hệ thống MySign

  TransactionInfo({
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
    required this.userId, // Mã người dùng trong hệ thống MySign
  });
}
