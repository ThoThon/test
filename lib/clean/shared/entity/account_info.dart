import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/login/model/account_info_model.dart';

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

  AccountInfoModel toOldModel() {
    return AccountInfoModel(
      toChucId: toChucId,
      tenToChuc: tenToChuc,
      taxCode: taxCode,
      maDonVi: maDonVi,
      maNganSach: maNganSach,
      diaChiDk: diaChiDk,
      diaChi: diaChi,
      maCoQuanQuanLy: maCoQuanQuanLy,
      tenCoQuanQuanLy: tenCoQuanQuanLy,
      dienThoai: dienThoai,
      mailLienLac: mailLienLac,
      tenNguoiKy: tenNguoiKy,
      telReceiver: telReceiver,
      serviceName: serviceName,
      serviceStartDate: serviceStartDate,
      serviceExpiredDate: serviceExpiredDate,
      bankAccount: bankAccount,
      jobTitle: jobTitle,
      loaiDoiTuong: loaiDoiTuong,
      ptNhanKq: ptNhanKq,
      packageInfo: packageInfo,
      tenNguoiKeKhai: tenNguoiKeKhai,
      luongCoSo: luongCoSo,
      phuongThucDong: phuongThucDong,
      maVung: maVung,
    );
  }

  factory AccountInfo.empty() {
    return const AccountInfo(
      toChucId: '',
      tenToChuc: '',
      taxCode: '',
      maDonVi: '',
      maNganSach: '',
      diaChiDk: '',
      diaChi: '',
      maCoQuanQuanLy: '',
      tenCoQuanQuanLy: '',
      dienThoai: '',
      mailLienLac: '',
      tenNguoiKy: '',
      telReceiver: '',
      serviceName: '',
      serviceStartDate: '',
      serviceExpiredDate: '',
      bankAccount: '',
      jobTitle: '',
      loaiDoiTuong: '',
      ptNhanKq: '',
      packageInfo: '',
      tenNguoiKeKhai: '',
      luongCoSo: 0,
      phuongThucDong: 0,
      maVung: 0,
    );
  }
}
