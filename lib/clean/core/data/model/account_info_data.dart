class AccountInfoData {
  final String? toChucId;
  final String? tenToChuc;
  final String? taxCode;
  final String? maDonVi;
  final String? maNganSach;
  final String? diaChiDk;
  final String? diaChi;
  final String? maCoQuanQuanLy;
  final String? tenCoQuanQuanLy;
  final String? dienThoai;
  final String? mailLienLac;
  final String? tenNguoiKy;
  final String? telReceiver;
  final String? serviceName;
  final String? serviceStartDate;
  final String? serviceExpiredDate;
  final String? bankAccount;
  final String? jobTitle;
  final String? loaiDoiTuong;
  final String? ptNhanKq;
  final String? packageInfo;
  final String? tenNguoiKeKhai;
  final int? luongCoSo;
  final int? phuongThucDong;
  final int? maVung;

  const AccountInfoData({
    this.toChucId,
    this.tenToChuc,
    this.taxCode,
    this.maDonVi,
    this.maNganSach,
    this.diaChiDk,
    this.diaChi,
    this.maCoQuanQuanLy,
    this.tenCoQuanQuanLy,
    this.dienThoai,
    this.mailLienLac,
    this.tenNguoiKy,
    this.telReceiver,
    this.serviceName,
    this.serviceStartDate,
    this.serviceExpiredDate,
    this.bankAccount,
    this.jobTitle,
    this.loaiDoiTuong,
    this.ptNhanKq,
    this.packageInfo,
    this.tenNguoiKeKhai,
    this.luongCoSo,
    this.phuongThucDong,
    this.maVung,
  });

  factory AccountInfoData.fromJson(Map<String, dynamic> json) {
    return AccountInfoData(
      toChucId: json['to_chuc_id'],
      tenToChuc: json['ten_to_chuc'],
      taxCode: json['tax_code'],
      maDonVi: json['ma_don_vi'],
      maNganSach: json['ma_ngan_sach'],
      diaChiDk: json['dia_chi_dk'],
      diaChi: json['dia_chi'],
      maCoQuanQuanLy: json['ma_co_quan_quan_ly'],
      tenCoQuanQuanLy: json['ten_co_quan_quan_ly'],
      dienThoai: json['dien_thoai'],
      mailLienLac: json['mail_lien_lac'],
      tenNguoiKy: json['ten_nguoi_ky'],
      telReceiver: json['tel_receiver'],
      serviceName: json['service_name'],
      serviceStartDate: json['service_start_date'],
      serviceExpiredDate: json['service_expired_date'],
      bankAccount: json['bank_account'],
      jobTitle: json['job_title'],
      loaiDoiTuong: json['loai_doi_tuong'],
      ptNhanKq: json['pt_nhan_kq'],
      packageInfo: json['packageInfo'],
      tenNguoiKeKhai: json['ten_nguoi_ke_khai'],
      luongCoSo: json['luong_co_so'],
      phuongThucDong: json['phuong_thuc_dong'],
      maVung: json['ma_vung'],
    );
  }
}
