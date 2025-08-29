import 'package:v_bhxh/modules/login/model/categories_630/bank_model.dart';

class DeclareInfo630cResponse {
  final String id;
  final String kyKeKhaiId;
  final String hoTen;
  final String maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String phatSinhDieuChinh;
  final String maNhomHuong;
  final DateTime? tuNgay;
  final DateTime? denNgay;
  final int tongSoNgay;
  final DateTime? tuNgayDonVi;
  final DateTime? denNgayDonVi;
  final DateTime? ngayTroLaiLamViec;
  final DateTime? ngayGiamDinh;
  final int? tyLeSuyGiam;
  final String? soSeriCT;
  final String? dotBoSung;
  final String? maHoSo;
  final String? ghiChu;
  final String? hinhThucNhan;
  final String? soTaiKhoan;
  final String? tenChuTaiKhoan;
  final BankModel? nganHang;
  final String? dotDaGiaiQuyet;
  final DateTime? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630cResponse({
    required this.id,
    required this.kyKeKhaiId,
    required this.hoTen,
    required this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    required this.phatSinhDieuChinh,
    required this.maNhomHuong,
    this.tuNgay,
    this.denNgay,
    required this.tongSoNgay,
    this.tuNgayDonVi,
    this.denNgayDonVi,
    this.ngayTroLaiLamViec,
    this.ngayGiamDinh,
    this.tyLeSuyGiam,
    this.soSeriCT,
    this.dotBoSung,
    this.maHoSo,
    this.ghiChu,
    this.hinhThucNhan,
    this.soTaiKhoan,
    this.tenChuTaiKhoan,
    this.nganHang,
    this.dotDaGiaiQuyet,
    this.tuNgayDuyetTruoc,
    this.lyDoDieuChinh,
  });

  factory DeclareInfo630cResponse.fromJson(Map<String, dynamic> json) {
    return DeclareInfo630cResponse(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      hoTen: json['hoTen'] ?? '',
      maSoBhxh: json['maSoBhxh'] ?? '',
      soCmnd: json['soCmnd'],
      maNhanVien: json['maNhanVien'],
      phatSinhDieuChinh: json['phatSinh_DieuChinh'],
      maNhomHuong: json['maNhomHuong'] ?? '',
      tuNgay: json['tuNgay'] != null ? DateTime.parse(json['tuNgay']) : null,
      denNgay: json['denNgay'] != null ? DateTime.parse(json['denNgay']) : null,
      tongSoNgay: json['tongSoNgay'] ?? 0,
      tuNgayDonVi: json['tuNgayDonVi'] != null
          ? DateTime.parse(json['tuNgayDonVi'])
          : null,
      denNgayDonVi: json['denNgayDonVi'] != null
          ? DateTime.parse(json['denNgayDonVi'])
          : null,
      ngayTroLaiLamViec: json['ngayTroLaiLamViec'] != null
          ? DateTime.parse(json['ngayTroLaiLamViec'])
          : null,
      ngayGiamDinh: json['ngayGiamDinh'] != null
          ? DateTime.parse(json['ngayGiamDinh'])
          : null,
      tyLeSuyGiam: json['tyLeSuyGiam'],
      soSeriCT: json['soSeriCT'],
      dotBoSung: json['dotBoSung'],
      maHoSo: json['maHoSo'],
      ghiChu: json['ghiChu'],
      hinhThucNhan: json['hinhThucNhan'],
      soTaiKhoan: json['soTaiKhoan'],
      tenChuTaiKhoan: json['tenChuTaiKhoan'],
      nganHang: json['nganHang'] != null
          ? BankModel.fromJson(json['nganHang'])
          : null,
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'] ?? '',
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'] != null
          ? DateTime.parse(json['tuNgayDuyetTruoc'])
          : null,
      lyDoDieuChinh: json['lyDoDieuChinh'] ?? '',
    );
  }
}
