class AccountInfoModel {
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

  AccountInfoModel({
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

  factory AccountInfoModel.fromJson(Map<String, dynamic> json) {
    return AccountInfoModel(
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

  AccountInfoModel copyWith({
    String? tenToChuc,
  }) {
    return AccountInfoModel(
      toChucId: toChucId,
      tenToChuc: tenToChuc ?? this.tenToChuc,
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
}
