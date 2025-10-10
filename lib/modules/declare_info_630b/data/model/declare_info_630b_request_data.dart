/// Dữ liệu gửi lên API - Tờ khai 630b (Chế độ thai sản)
class DeclareInfo630bRequestData {
  /// ID bản ghi (nếu có)
  final String? id;

  /// Kỳ kê khai (ID kỳ)
  final String? kyKeKhaiId;

  /// Hình thức kê khai
  final String? phatSinhDieuChinh;

  /// Họ và tên
  final String? hoTen;

  /// Mã số BHXH
  final String? maSoBhxh;

  /// Số CCCD
  final String? soCmnd;

  /// Mã nhân viên
  final String? maNhanVien;

  /// Mã nhóm hưởng
  final String? maNhomHuong;

  /// Mã nhóm hưởng cấp 2
  final String? maNhomHuong2;

  /// Từ ngày
  final String? tuNgay;

  /// Đến ngày
  final String? denNgay;

  /// Tổng số ngày
  final int? tongSoNgay;

  /// Từ ngày đơn vị
  final String? tuNgayDonVi;

  /// Ngày nghỉ hàng tuần
  final String? ngayNghiTuan;

  /// Số seri
  final String? soSeriCT;

  /// Điều kiện khám thai
  final String? dieuKienKhamThai;

  /// Tuổi thai
  final int? tuoiThai;

  /// Biện pháp tránh thai
  final String? bienPhapKhhgd;

  /// Điều kiện sinh con
  final String? dieuKienSinhCon;

  /// Ngày sinh con
  final String? ngaySinhCon;

  /// Số con
  final int? soCon;

  /// Mã số BHXH của con
  final String? maSoBHXHCuaCon;

  /// Mã thẻ BHYT của con
  final String? theBhytCuaCon;

  /// Số con chết (hoặc thai chết lưu)
  final int? soCCHoacThaiCL;

  /// Ngày con chết
  final String? ngayConChet;

  /// Ngày nhận con
  final String? ngayNhanCon;

  /// Ngày đi làm thực tế
  final String? ngayDiLamThucTe;

  /// Mã số BHXH của mẹ
  final String? maSoBHXHCuaMe;

  /// Mã thẻ BHYT của mẹ
  final String? theBHYTCuaMe;

  /// Số CMND/CCCD của mẹ
  final String? soCMNDCuaMe;

  /// Phẫu thuật khi thai ≥ 32 tuần
  final String? phauThuatThai32;

  /// Ngày mẹ chết
  final String? ngayMeChet;

  /// Ngày kết luận
  final String? ngayKetLuan;

  /// Phí giám định y khoa
  final int? phiGiamDinhYKhoa;

  /// Số BHXH người nuôi dưỡng (nếu có)
  final String? soBHXHNND;

  /// Nghỉ dưỡng thai
  final String? nghiDuongThai;

  /// Cha nghỉ chăm con
  final String? chaNghiChamCon;

  /// Mang thai hộ
  final String? mangThaiHo;

  /// Đợt bổ sung
  final String? dotBoSung;

  /// Mã hồ sơ
  final String? maHoSo;

  /// Ghi chú
  final String? ghiChu;

  /// Hình thức nhận
  final String? hinhThucNhan;

  /// Số tài khoản nhận tiền
  final String? soTaiKhoan;

  /// Tên chủ tài khoản
  final String? tenChuTaiKhoan;

  /// Mã ngân hàng
  final String? maNganHang;

  /// Đợt đã giải quyết (nếu có)
  final String? dotDaGiaiQuyet;

  /// Lý do điều chỉnh
  final String? lyDoDieuChinh;

  /// Từ ngày duyệt trước
  final String? tuNgayDuyetTruoc;

  DeclareInfo630bRequestData({
    this.id,
    this.kyKeKhaiId,
    this.phatSinhDieuChinh,
    this.hoTen,
    this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    this.maNhomHuong,
    this.maNhomHuong2,
    this.tuNgay,
    this.denNgay,
    this.tongSoNgay,
    this.tuNgayDonVi,
    this.ngayNghiTuan,
    this.soSeriCT,
    this.dieuKienKhamThai,
    this.tuoiThai,
    this.bienPhapKhhgd,
    this.dieuKienSinhCon,
    this.ngaySinhCon,
    this.soCon,
    this.maSoBHXHCuaCon,
    this.theBhytCuaCon,
    this.soCCHoacThaiCL,
    this.ngayConChet,
    this.ngayNhanCon,
    this.ngayDiLamThucTe,
    this.maSoBHXHCuaMe,
    this.theBHYTCuaMe,
    this.soCMNDCuaMe,
    this.phauThuatThai32,
    this.ngayMeChet,
    this.ngayKetLuan,
    this.phiGiamDinhYKhoa,
    this.soBHXHNND,
    this.nghiDuongThai,
    this.chaNghiChamCon,
    this.mangThaiHo,
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
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'kyKeKhaiId': kyKeKhaiId,
        'phatSinh_DieuChinh': phatSinhDieuChinh,
        'hoTen': hoTen,
        'maSoBhxh': maSoBhxh,
        'soCmnd': soCmnd,
        'maNhanVien': maNhanVien,
        'maNhomHuong': maNhomHuong,
        'maNhomHuong2': maNhomHuong2,
        'tuNgay': tuNgay,
        'denNgay': denNgay,
        'tongSoNgay': tongSoNgay,
        'tuNgayDonVi': tuNgayDonVi,
        'ngayNghiTuan': ngayNghiTuan,
        'soSeriCT': soSeriCT,
        'dieuKienKhamThai': dieuKienKhamThai,
        'tuoiThai': tuoiThai,
        'bienPhapKhhgd': bienPhapKhhgd,
        'dieuKienSinhCon': dieuKienSinhCon,
        'ngaySinhCon': ngaySinhCon,
        'soCon': soCon,
        'maSoBHXHCuaCon': maSoBHXHCuaCon,
        'theBhytCuaCon': theBhytCuaCon,
        'soCCHoacThaiCL': soCCHoacThaiCL,
        'ngayConChet': ngayConChet,
        'ngayNhanCon': ngayNhanCon,
        'ngayDiLamThucTe': ngayDiLamThucTe,
        'maSoBHXHCuaMe': maSoBHXHCuaMe,
        'theBHYTCuaMe': theBHYTCuaMe,
        'soCMNDCuaMe': soCMNDCuaMe,
        'phauThuatThai32': phauThuatThai32,
        'ngayMeChet': ngayMeChet,
        'ngayKetLuan': ngayKetLuan,
        'phiGiamDinhYKhoa': phiGiamDinhYKhoa,
        'soBHXHNND': soBHXHNND,
        'nghiDuongThai': nghiDuongThai,
        'chaNghiChamCon': chaNghiChamCon,
        'mangThaiHo': mangThaiHo,
        'dotBoSung': dotBoSung,
        'maHoSo': maHoSo,
        'ghiChu': ghiChu,
        'hinhThucNhan': hinhThucNhan,
        'soTaiKhoan': soTaiKhoan,
        'tenChuTaiKhoan': tenChuTaiKhoan,
        'maNganHang': maNganHang,
        'dotDaGiaiQuyet': dotDaGiaiQuyet,
        'lyDoDieuChinh': lyDoDieuChinh,
        'tuNgayDuyetTruoc': tuNgayDuyetTruoc,
      };
}
