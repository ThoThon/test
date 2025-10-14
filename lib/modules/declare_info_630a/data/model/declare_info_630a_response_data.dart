import 'package:v_bhxh/clean/shared/model/categories_630/categories_630_src.dart';

class DeclareInfo630aResponseData {
  final String? id;
  final String? kyKeKhaiId;
  final String? phatSinhDieuChinh;
  final String? hoTen;
  final String? maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String? maNhomHuong;
  final String? soSeriCT;
  final String? tuNgay;
  final String? denNgay;
  final double? tongSoNgay;
  final String? tuNgayDonVi;
  final String? denNgayDonVi;
  final String? ngayNghiTuan;
  final String? tuyenBenhVien;
  final String? ngaySinhCon;
  final String? theBhytCuaCon;
  final int? soCon;
  final String? maBenhDaiNgay;
  final String? tenBenh;
  final String? dieuKienLamViec;
  final bool? dangKyNghiDuongThai;
  final String? dotBoSung;
  final String? maHoSo;
  final String? hinhThucNhan;
  final String? soTaiKhoan;
  final String? tenChuTaiKhoan;
  final BankData? nganHang;
  final String? ghiChu;
  final String? dotDaGiaiQuyet;
  final String? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630aResponseData({
    this.id,
    this.kyKeKhaiId,
    this.phatSinhDieuChinh,
    this.hoTen,
    this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    this.maNhomHuong,
    this.soSeriCT,
    this.tuNgay,
    this.denNgay,
    this.tongSoNgay,
    this.tuNgayDonVi,
    this.denNgayDonVi,
    this.ngayNghiTuan,
    this.tuyenBenhVien,
    this.ngaySinhCon,
    this.theBhytCuaCon,
    this.soCon,
    this.maBenhDaiNgay,
    this.tenBenh,
    this.dieuKienLamViec,
    this.dangKyNghiDuongThai,
    this.dotBoSung,
    this.maHoSo,
    this.hinhThucNhan,
    this.soTaiKhoan,
    this.tenChuTaiKhoan,
    this.nganHang,
    this.ghiChu,
    this.dotDaGiaiQuyet,
    this.tuNgayDuyetTruoc,
    this.lyDoDieuChinh,
  });

  factory DeclareInfo630aResponseData.fromJson(Map<String, dynamic> json) {
    return DeclareInfo630aResponseData(
      id: json['id'],
      kyKeKhaiId: json['kyKeKhaiId'],
      phatSinhDieuChinh: json['phatSinh_DieuChinh'],
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      soCmnd: json['soCmnd'],
      maNhanVien: json['maNhanVien'],
      maNhomHuong: json['maNhomHuong'],
      soSeriCT: json['soSeriCT'],
      tuNgay: json['tuNgay'],
      denNgay: json['denNgay'],
      tongSoNgay: json['tongSoNgay'],
      tuNgayDonVi: json['tuNgayDonVi'],
      ngayNghiTuan: json['ngayNghiTuan'],
      tuyenBenhVien: json['tuyenBenhVien'],
      ngaySinhCon: json['ngaySinhCon'],
      theBhytCuaCon: json['theBhytCuaCon'],
      soCon: json['soCon'],
      maBenhDaiNgay: json['maBenhDaiNgay'],
      tenBenh: json['tenBenh'],
      dieuKienLamViec: json['dieuKienLamViec'],
      dangKyNghiDuongThai: json['dangKyNghiDuongThai'],
      dotBoSung: json['dotBoSung'],
      maHoSo: json['maHoSo'],
      hinhThucNhan: json['hinhThucNhan'],
      soTaiKhoan: json['soTaiKhoan'],
      tenChuTaiKhoan: json['tenChuTaiKhoan'],
      nganHang:
          json['nganHang'] != null ? BankData.fromJson(json['nganHang']) : null,
      ghiChu: json['ghiChu'],
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'],
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'],
      lyDoDieuChinh: json['lyDoDieuChinh'],
      denNgayDonVi: json['denNgayDonVi'],
    );
  }
}
