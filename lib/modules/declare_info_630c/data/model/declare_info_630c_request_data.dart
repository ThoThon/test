class DeclareInfo630cRequestData {
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
  final String? maNganHang;
  final String? dotDaGiaiQuyet;
  final String? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630cRequestData({
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
    this.maNganHang,
    this.dotDaGiaiQuyet,
    this.tuNgayDuyetTruoc,
    this.lyDoDieuChinh,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'soCmnd': soCmnd,
      'maNhanVien': maNhanVien,
      'phatSinh_DieuChinh': phatSinhDieuChinh,
      'maNhomHuong': maNhomHuong,
      'tuNgay': tuNgay,
      'denNgay': denNgay,
      'tongSoNgay': tongSoNgay,
      'tuNgayDonVi': tuNgayDonVi,
      'denNgayDonVi': denNgayDonVi,
      'ngayTroLaiLamViec': ngayTroLaiLamViec,
      'ngayGiamDinh': ngayGiamDinh,
      'tyLeSuyGiam': tyLeSuyGiam,
      'soSeriCT': soSeriCT,
      'dotBoSung': dotBoSung,
      'maHoSo': maHoSo,
      'ghiChu': ghiChu,
      'hinhThucNhan': hinhThucNhan,
      'soTaiKhoan': soTaiKhoan,
      'tenChuTaiKhoan': tenChuTaiKhoan,
      'maNganHang': maNganHang,
      'dotDaGiaiQuyet': dotDaGiaiQuyet,
      'tuNgayDuyetTruoc': tuNgayDuyetTruoc,
      'lyDoDieuChinh': lyDoDieuChinh,
    };
  }
}
