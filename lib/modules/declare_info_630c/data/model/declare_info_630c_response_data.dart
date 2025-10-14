import '../../../../clean/shared/model/categories_630/bank_data.dart';

class DeclareInfo630cResponseData {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String? phatSinhDieuChinh;
  final String? maNhomHuong;
  final String? tuNgay;
  final String? denNgay;
  final double? tongSoNgay;
  final String? tuNgayDonVi;
  final String? denNgayDonVi;
  final String? ngayTroLaiLamViec;
  final String? ngayGiamDinh;
  final int? tyLeSuyGiam;
  final String? soSeriCT;
  final String? dotBoSung;
  final String? maHoSo;
  final String? ghiChu;
  final String? hinhThucNhan;
  final String? soTaiKhoan;
  final String? tenChuTaiKhoan;
  final BankData? nganHang;
  final String? dotDaGiaiQuyet;
  final String? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630cResponseData({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    this.phatSinhDieuChinh,
    this.maNhomHuong,
    this.tuNgay,
    this.denNgay,
    this.tongSoNgay,
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

  factory DeclareInfo630cResponseData.fromJson(Map<String, dynamic> json) {
    return DeclareInfo630cResponseData(
      id: json['id'],
      kyKeKhaiId: json['kyKeKhaiId'],
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      soCmnd: json['soCmnd'],
      maNhanVien: json['maNhanVien'],
      phatSinhDieuChinh: json['phatSinh_DieuChinh'],
      maNhomHuong: json['maNhomHuong'],
      tuNgay: json['tuNgay'],
      denNgay: json['denNgay'],
      tongSoNgay: json['tongSoNgay'],
      tuNgayDonVi: json['tuNgayDonVi'],
      denNgayDonVi: json['denNgayDonVi'],
      ngayTroLaiLamViec: json['ngayTroLaiLamViec'],
      ngayGiamDinh: json['ngayGiamDinh'],
      tyLeSuyGiam: json['tyLeSuyGiam'],
      soSeriCT: json['soSeriCT'],
      dotBoSung: json['dotBoSung'],
      maHoSo: json['maHoSo'],
      ghiChu: json['ghiChu'],
      hinhThucNhan: json['hinhThucNhan'],
      soTaiKhoan: json['soTaiKhoan'],
      tenChuTaiKhoan: json['tenChuTaiKhoan'],
      nganHang:
          json['nganHang'] != null ? BankData.fromJson(json['nganHang']) : null,
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'],
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'],
      lyDoDieuChinh: json['lyDoDieuChinh'],
    );
  }
}
