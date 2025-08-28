class DeclareInfo630cRequest {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String? phatSinhDieuChinh;
  final String? maNhomHuong;
  final DateTime? tuNgay;
  final DateTime? denNgay;
  final int? tongSoNgay;
  final DateTime? tuNgayDonVi;
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
  final String? maNganHang;
  final String? dotDaGiaiQuyet;
  final DateTime? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630cRequest({
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
      'tuNgay': tuNgay?.toIso8601String(),
      'denNgay': denNgay?.toIso8601String(),
      'tongSoNgay': tongSoNgay,
      'tuNgayDonVi': tuNgayDonVi?.toIso8601String(),
      'ngayTroLaiLamViec': ngayTroLaiLamViec?.toIso8601String(),
      'ngayGiamDinh': ngayGiamDinh?.toIso8601String(),
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
      'tuNgayDuyetTruoc': tuNgayDuyetTruoc?.toIso8601String(),
      'lyDoDieuChinh': lyDoDieuChinh,
    };
  }
}
