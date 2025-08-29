class DeclareInfo630bRequest {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String? phatSinhDieuChinh;
  final String? maNhomHuong;
  final String? maNhomHuong2;
  final DateTime? tuNgay;
  final DateTime? denNgay;
  final int? tongSoNgay;
  final DateTime? tuNgayDonVi;
  final DateTime? denNgayDonVi;
  final String? ngayNghiTuan;
  final String? soSeriCT;
  final DateTime? ngaySinhCon;
  final int? soCon;
  final int? soCCHoacThaiCL;
  final String? dieuKienKhamThai;
  final String? dieuKienSinhCon;
  final String? nghiDuongThai;
  final String? chaNghiChamCon;
  final String? bienPhapKHHGD;
  final DateTime? ngayNhanCon;
  final DateTime? ngayDiLamThucTe;
  final DateTime? ngayConChet;
  final DateTime? ngayMeChet;
  final String? mangThaiHo;
  final DateTime? ngayKetLuan;
  final String? maSoBHXHCuaCon;
  final String? theBhytCuaCon;
  final String? maSoBHXHCuaMe;
  final String? theBHYTCuaMe;
  final String? soCMNDCuaMe;
  final int? phiGiamDinhYKhoa;
  final String? soBHXHNND;
  final String? phauThuatThai32;
  final String? dotBoSung;
  final String? maHoSo;
  final String? ghiChu;
  final String? hinhThucNhan;
  final String? soTaiKhoan;
  final String? tenChuTaiKhoan;
  final String? maNganHang;
  final String? dotDaGiaiQuyet;
  final String? lyDoDieuChinh;
  final DateTime? tuNgayDuyetTruoc;
  final int? tuoiThai;

  DeclareInfo630bRequest({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    this.phatSinhDieuChinh,
    this.maNhomHuong,
    this.maNhomHuong2,
    this.tuNgay,
    this.denNgay,
    this.tongSoNgay,
    this.tuNgayDonVi,
    this.ngayNghiTuan,
    this.denNgayDonVi,
    this.soSeriCT,
    this.ngaySinhCon,
    this.soCon,
    this.soCCHoacThaiCL,
    this.dieuKienKhamThai,
    this.dieuKienSinhCon,
    this.nghiDuongThai,
    this.chaNghiChamCon,
    this.bienPhapKHHGD,
    this.ngayNhanCon,
    this.ngayDiLamThucTe,
    this.ngayConChet,
    this.ngayMeChet,
    this.mangThaiHo,
    this.ngayKetLuan,
    this.maSoBHXHCuaCon,
    this.theBhytCuaCon,
    this.maSoBHXHCuaMe,
    this.theBHYTCuaMe,
    this.soCMNDCuaMe,
    this.phiGiamDinhYKhoa,
    this.soBHXHNND,
    this.phauThuatThai32,
    this.dotBoSung,
    this.maHoSo,
    this.ghiChu,
    this.hinhThucNhan,
    this.soTaiKhoan,
    this.tenChuTaiKhoan,
    this.maNganHang,
    this.dotDaGiaiQuyet,
    this.lyDoDieuChinh,
    this.tuNgayDuyetTruoc,
    this.tuoiThai,
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
      'maNhomHuong2': maNhomHuong2,
      'tuNgay': tuNgay?.toIso8601String(),
      'denNgay': denNgay?.toIso8601String(),
      'tongSoNgay': tongSoNgay,
      'tuNgayDonVi': tuNgayDonVi?.toIso8601String(),
      'denNgayDonVi': denNgayDonVi?.toIso8601String(),
      'ngayNghiTuan': ngayNghiTuan,
      'soSeriCT': soSeriCT,
      'ngaySinhCon': ngaySinhCon?.toIso8601String(),
      'soCon': soCon,
      'soCCHoacThaiCL': soCCHoacThaiCL,
      'dieuKienKhamThai': dieuKienKhamThai,
      'dieuKienSinhCon': dieuKienSinhCon,
      'nghiDuongThai': nghiDuongThai,
      'chaNghiChamCon': chaNghiChamCon,
      'bienPhapKHHGD': bienPhapKHHGD,
      'ngayNhanCon': ngayNhanCon?.toIso8601String(),
      'ngayDiLamThucTe': ngayDiLamThucTe?.toIso8601String(),
      'ngayConChet': ngayConChet?.toIso8601String(),
      'ngayMeChet': ngayMeChet?.toIso8601String(),
      'mangThaiHo': mangThaiHo,
      'ngayKetLuan': ngayKetLuan?.toIso8601String(),
      'maSoBHXHCuaCon': maSoBHXHCuaCon,
      'theBhytCuaCon': theBhytCuaCon,
      'maSoBHXHCuaMe': maSoBHXHCuaMe,
      'theBHYTCuaMe': theBHYTCuaMe,
      'soCMNDCuaMe': soCMNDCuaMe,
      'phiGiamDinhYKhoa': phiGiamDinhYKhoa,
      'soBHXHNND': soBHXHNND,
      'phauThuatThai32': phauThuatThai32,
      'dotBoSung': dotBoSung,
      'maHoSo': maHoSo,
      'ghiChu': ghiChu,
      'hinhThucNhan': hinhThucNhan,
      'soTaiKhoan': soTaiKhoan,
      'tenChuTaiKhoan': tenChuTaiKhoan,
      'maNganHang': maNganHang,
      'tuNgayDuyetTruoc': tuNgayDuyetTruoc?.toIso8601String(),
      'dotDaGiaiQuyet': dotDaGiaiQuyet,
      'lyDoDieuChinh': lyDoDieuChinh,
      'tuoiThai': tuoiThai,
    };
  }
}
