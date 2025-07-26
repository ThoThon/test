import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class AccountInfo implements Entity {
  final String toChucId;
  final String tenToChuc;
  final String taxCode;
  final String maDonVi;
  final String maNganSach;
  final String diaChiDk;
  final String diaChi;
  final String maCoQuanQuanLy;
  final String tenCoQuanQuanLy;
  final String dienThoai;
  final String mailLienLac;
  final String tenNguoiKy;
  final String telReceiver;
  final String serviceName;
  final String serviceStartDate;
  final String serviceExpiredDate;
  final String bankAccount;
  final String jobTitle;
  final String loaiDoiTuong;
  final String ptNhanKq;
  final String packageInfo;
  final String tenNguoiKeKhai;
  final int luongCoSo;
  final int phuongThucDong;
  final int maVung;

  const AccountInfo({
    required this.toChucId,
    required this.tenToChuc,
    required this.taxCode,
    required this.maDonVi,
    required this.maNganSach,
    required this.diaChiDk,
    required this.diaChi,
    required this.maCoQuanQuanLy,
    required this.tenCoQuanQuanLy,
    required this.dienThoai,
    required this.mailLienLac,
    required this.tenNguoiKy,
    required this.telReceiver,
    required this.serviceName,
    required this.serviceStartDate,
    required this.serviceExpiredDate,
    required this.bankAccount,
    required this.jobTitle,
    required this.loaiDoiTuong,
    required this.ptNhanKq,
    required this.packageInfo,
    required this.tenNguoiKeKhai,
    required this.luongCoSo,
    required this.phuongThucDong,
    required this.maVung,
  });
}
