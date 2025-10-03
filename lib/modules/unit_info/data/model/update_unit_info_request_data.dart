class UpdateUnitInfoRequestData {
  final String toChucId;
  final String tenToChuc;
  final String diaChiDk;
  final String diaChi;
  final String mailLienLac;
  final String tenNguoiKy;
  final String telReceiver;
  final String jobTitle;
  final String loaiDoiTuong;
  final String tenNguoiKeKhai;
  final int luongCoSo;
  final int phuongThucDong;
  final String ptNhanKq;

  UpdateUnitInfoRequestData({
    required this.toChucId,
    required this.tenToChuc,
    required this.diaChiDk,
    required this.diaChi,
    required this.mailLienLac,
    required this.tenNguoiKy,
    required this.telReceiver,
    required this.jobTitle,
    required this.loaiDoiTuong,
    required this.tenNguoiKeKhai,
    required this.luongCoSo,
    required this.phuongThucDong,
    required this.ptNhanKq,
  });

  Map<String, dynamic> toJson() {
    return {
      'to_chuc_id': toChucId,
      'ten_to_chuc': tenToChuc,
      'dia_chi_dk': diaChiDk,
      'dia_chi': diaChi,
      'mail_lien_lac': mailLienLac,
      'ten_nguoi_ky': tenNguoiKy,
      'tel_receiver': telReceiver,
      'job_title': jobTitle,
      'loai_doi_tuong': loaiDoiTuong,
      'ten_nguoi_ke_khai': tenNguoiKeKhai,
      'luong_co_so': luongCoSo,
      'phuong_thuc_dong': phuongThucDong,
      'pt_nhan_kq': ptNhanKq,
    };
  }
}
