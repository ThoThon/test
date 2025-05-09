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
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'to_chuc_id': toChucId,
  //     'ten_to_chuc': tenToChuc,
  //     'tax_code': taxCode,
  //     'ma_don_vi': maDonVi,
  //     'ma_ngan_sach': maNganSach,
  //     'dia_chi_dk': diaChiDk,
  //     'dia_chi': diaChi,
  //     'ma_co_quan_quan_ly': maCoQuanQuanLy,
  //     'ten_co_quan_quan_ly': tenCoQuanQuanLy,
  //     'dien_thoai': dienThoai,
  //     'mail_lien_lac': mailLienLac,
  //     'ten_nguoi_ky': tenNguoiKy,
  //     'tel_receiver': telReceiver,
  //     'service_name': serviceName,
  //     'service_start_date': serviceStartDate,
  //     'service_expired_date': serviceExpiredDate,
  //     'bank_account': bankAccount,
  //     'job_title': jobTitle,
  //     'loai_doi_tuong': loaiDoiTuong,
  //     'pt_nhan_kq': ptNhanKq,
  //     'packageInfo': packageInfo,
  //   };
  // }
}
