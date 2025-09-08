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

  AccountInfo({
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

  @Deprecated('Sử dụng AccountInfoData để parse Json')
  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      toChucId: json['to_chuc_id'] ?? '',
      tenToChuc: json['ten_to_chuc'] ?? '',
      taxCode: json['tax_code'] ?? '',
      maDonVi: json['ma_don_vi'] ?? '',
      maNganSach: json['ma_ngan_sach'] ?? '',
      diaChiDk: json['dia_chi_dk'] ?? '',
      diaChi: json['dia_chi'] ?? '',
      maCoQuanQuanLy: json['ma_co_quan_quan_ly'] ?? '',
      tenCoQuanQuanLy: json['ten_co_quan_quan_ly'] ?? '',
      dienThoai: json['dien_thoai'] ?? '',
      mailLienLac: json['mail_lien_lac'] ?? '',
      tenNguoiKy: json['ten_nguoi_ky'] ?? '',
      telReceiver: json['tel_receiver'] ?? '',
      serviceName: json['service_name'] ?? '',
      serviceStartDate: json['service_start_date'] ?? '',
      serviceExpiredDate: json['service_expired_date'] ?? '',
      bankAccount: json['bank_account'] ?? '',
      jobTitle: json['job_title'] ?? '',
      loaiDoiTuong: json['loai_doi_tuong'] ?? '',
      ptNhanKq: json['pt_nhan_kq'] ?? '',
      packageInfo: json['packageInfo'] ?? '',
      tenNguoiKeKhai: json['ten_nguoi_ke_khai'] ?? '',
      luongCoSo: json['luong_co_so'] ?? 0,
      phuongThucDong: json['phuong_thuc_dong'] ?? 1,
      maVung: json['ma_vung'] ?? 0,
    );
  }

  factory AccountInfo.empty() {
    return AccountInfo(
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
      phuongThucDong: 1,
      maVung: 0,
    );
  }
}
