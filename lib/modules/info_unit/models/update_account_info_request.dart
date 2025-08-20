import 'package:equatable/equatable.dart';

class UpdateAccountInfoRequest extends Equatable {
  final String toChucId;
  final String tenToChuc;
  final String diaChiDangKy;
  final String diaChi;
  final String mailLienLac;
  final String tenNguoiKy;
  final String telReceiver;
  final String jobTitle;
  final String loaiDoiTuong;
  final String tenNguoiKeKhai;
  final int luongCoSo;
  final int? phuongThucDong;
  final String? ptNhanKq;

  const UpdateAccountInfoRequest({
    required this.toChucId,
    required this.tenToChuc,
    required this.diaChiDangKy,
    required this.diaChi,
    required this.mailLienLac,
    required this.tenNguoiKy,
    required this.telReceiver,
    required this.jobTitle,
    required this.loaiDoiTuong,
    required this.tenNguoiKeKhai,
    required this.luongCoSo,
    this.phuongThucDong,
    this.ptNhanKq,
  });

  Map<String, dynamic> toJson() {
    return {
      "to_chuc_id": toChucId,
      "ten_to_chuc": tenToChuc,
      "dia_chi_dk": diaChiDangKy,
      "dia_chi": diaChi,
      "mail_lien_lac": mailLienLac,
      "ten_nguoi_ky": tenNguoiKy,
      "tel_receiver": telReceiver,
      "job_title": jobTitle,
      "loai_doi_tuong": loaiDoiTuong,
      "ten_nguoi_ke_khai": tenNguoiKeKhai,
      "luong_co_so": luongCoSo,
      "phuong_thuc_dong": phuongThucDong,
      "pt_nhan_kq": ptNhanKq,
    };
  }

  @override
  List<Object?> get props => [
        toChucId,
        tenToChuc,
        diaChiDangKy,
        diaChi,
        mailLienLac,
        tenNguoiKy,
        telReceiver,
        jobTitle,
        loaiDoiTuong,
        tenNguoiKeKhai,
        luongCoSo,
        phuongThucDong,
        ptNhanKq,
      ];
}
