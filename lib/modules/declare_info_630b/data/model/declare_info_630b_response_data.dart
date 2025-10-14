import 'package:collection/collection.dart';

import '../../../../base_app/model/app_data.dart';
import '../../../../clean/shared/model/categories_630/categories_630_src.dart';

/// Dữ liệu phản hồi từ API - Tờ khai 630b (Chế độ thai sản)
class DeclareInfo630bResponseData {
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
  final double? tongSoNgay;

  /// Từ ngày đơn vị
  final String? tuNgayDonVi;

  /// Đến ngày đơn vị
  final String? denNgayDonVi;

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

  /// Ngân hàng
  final BankData? nganHang;

  /// Đợt đã giải quyết (nếu có)
  final String? dotDaGiaiQuyet;

  /// Lý do điều chỉnh
  final String? lyDoDieuChinh;

  /// Từ ngày duyệt trước
  final String? tuNgayDuyetTruoc;

  DeclareInfo630bResponseData({
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
    this.denNgayDonVi,
    this.ngayNghiTuan,
    this.soSeriCT,
    this.ngaySinhCon,
    this.soCon,
    this.soCCHoacThaiCL,
    this.dieuKienKhamThai,
    this.dieuKienSinhCon,
    this.nghiDuongThai,
    this.chaNghiChamCon,
    this.bienPhapKhhgd,
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
    this.nganHang,
    this.dotDaGiaiQuyet,
    this.lyDoDieuChinh,
    this.tuNgayDuyetTruoc,
    this.tuoiThai,
  });

  factory DeclareInfo630bResponseData.fromJson(Map<String, dynamic> json) {
    final String? maNhomHuong = json['maNhomHuong'];
    final benefitGroup = AppData.instance.benefitGroup630b
        .firstWhereOrNull((item) => item.value == maNhomHuong);
    final String? maNhomHuong2 = json['maNhomHuong2'];
    final benefitGroupLv2 = benefitGroup?.benefitGroupLv2.firstWhereOrNull(
      (itemLv2) => itemLv2.maNhomHuongC2 == maNhomHuong2,
    );

    return DeclareInfo630bResponseData(
      id: json['id'],
      kyKeKhaiId: json['kyKeKhaiId'],
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      soCmnd: json['soCmnd'],
      maNhanVien: json['maNhanVien'],
      phatSinhDieuChinh: json['phatSinh_DieuChinh'],
      maNhomHuong: benefitGroup?.value,
      maNhomHuong2: benefitGroupLv2?.maNhomHuongC2,
      tuNgay: json['tuNgay'],
      denNgay: json['denNgay'],
      tongSoNgay: json['tongSoNgay'],
      tuNgayDonVi: json['tuNgayDonVi'],
      denNgayDonVi: json['denNgayDonVi'],
      ngayNghiTuan: json['ngayNghiTuan'],
      soSeriCT: json['soSeriCT'],
      ngaySinhCon: json['ngaySinhCon'],
      soCon: json['soCon'],
      soCCHoacThaiCL: json['soCCHoacThaiCL'],
      dieuKienKhamThai: json['dieuKienKhamThai'],
      dieuKienSinhCon: json['dieuKienSinhCon'],
      nghiDuongThai: json['nghiDuongThai'],
      chaNghiChamCon: json['chaNghiChamCon'],
      bienPhapKhhgd: json['bienPhapKHHGD'],
      ngayNhanCon: json['ngayNhanCon'],
      ngayDiLamThucTe: json['ngayDiLamThucTe'],
      ngayConChet: json['ngayConChet'],
      ngayMeChet: json['ngayMeChet'],
      mangThaiHo: json['mangThaiHo'],
      ngayKetLuan: json['ngayKetLuan'],
      maSoBHXHCuaCon: json['maSoBHXHCuaCon'],
      theBhytCuaCon: json['theBhytCuaCon'],
      maSoBHXHCuaMe: json['maSoBHXHCuaMe'],
      theBHYTCuaMe: json['theBHYTCuaMe'],
      soCMNDCuaMe: json['soCMNDCuaMe'],
      phiGiamDinhYKhoa: json['phiGiamDinhYKhoa'],
      soBHXHNND: json['soBHXHNND'],
      phauThuatThai32: json['phauThuatThai32'],
      dotBoSung: json['dotBoSung'],
      maHoSo: json['maHoSo'],
      ghiChu: json['ghiChu'],
      hinhThucNhan: json['hinhThucNhan'],
      soTaiKhoan: json['soTaiKhoan'],
      tenChuTaiKhoan: json['tenChuTaiKhoan'],
      nganHang:
          json['nganHang'] != null ? BankData.fromJson(json['nganHang']) : null,
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'],
      lyDoDieuChinh: json['lyDoDieuChinh'],
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'],
      tuoiThai: json['tuoiThai'],
    );
  }
}
