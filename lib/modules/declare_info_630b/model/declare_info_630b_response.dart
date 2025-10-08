import 'package:collection/collection.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

class DeclareInfo630bResponse {
  final String id;
  final String kyKeKhaiId;
  final String hoTen;
  final String maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String phatSinhDieuChinh;
  final BenefitGroup630? maNhomHuong;
  final BenefitGroupLv2? maNhomHuong2;
  final DateTime tuNgay;
  final DateTime denNgay;
  final double tongSoNgay;
  final DateTime tuNgayDonVi;
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
  final Bank? nganHang;
  final String? dotDaGiaiQuyet;
  final String? lyDoDieuChinh;
  final DateTime? tuNgayDuyetTruoc;
  final int? tuoiThai;

  DeclareInfo630bResponse({
    required this.id,
    required this.kyKeKhaiId,
    required this.hoTen,
    required this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    required this.phatSinhDieuChinh,
    required this.maNhomHuong,
    required this.maNhomHuong2,
    required this.tuNgay,
    required this.denNgay,
    required this.tongSoNgay,
    required this.tuNgayDonVi,
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
    this.nganHang,
    this.dotDaGiaiQuyet,
    this.lyDoDieuChinh,
    this.tuNgayDuyetTruoc,
    this.tuoiThai,
  });

  factory DeclareInfo630bResponse.fromJson(Map<String, dynamic> json) {
    final String? maNhomHuong = json['maNhomHuong'];
    final benefitGroup = AppData.instance.benefitGroup630b
        .firstWhereOrNull((item) => item.value == maNhomHuong);
    final String? maNhomHuong2 = json['maNhomHuong2'];
    final benefitGroupLv2 = benefitGroup?.benefitGroupLv2.firstWhereOrNull(
      (itemLv2) => itemLv2.maNhomHuongC2 == maNhomHuong2,
    );
    return DeclareInfo630bResponse(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      hoTen: json['hoTen'] ?? '',
      maSoBhxh: json['maSoBhxh'] ?? '',
      soCmnd: json['soCmnd'] ?? '',
      maNhanVien: json['maNhanVien'] ?? '',
      phatSinhDieuChinh: json['phatSinh_DieuChinh'] ?? '',
      maNhomHuong: benefitGroup,
      maNhomHuong2: benefitGroupLv2,
      tuNgay: DateTime.tryParse(json['tuNgay'] ?? '') ?? DateTime.now(),
      denNgay: DateTime.tryParse(json['denNgay'] ?? '') ?? DateTime.now(),
      tongSoNgay: json['tongSoNgay']?.toDouble() ?? 0,
      tuNgayDonVi:
          DateTime.tryParse(json['tuNgayDonVi'] ?? '') ?? DateTime.now(),
      denNgayDonVi: DateTime.tryParse(json['denNgayDonVi'] ?? ''),
      ngayNghiTuan: json['ngayNghiTuan'] ?? '',
      soSeriCT: json['soSeriCT'] ?? '',
      ngaySinhCon: DateTime.tryParse(json['ngaySinhCon'] ?? ''),
      soCon: json['soCon'],
      soCCHoacThaiCL: json['soCCHoacThaiCL'],
      dieuKienKhamThai: json['dieuKienKhamThai'] ?? '',
      dieuKienSinhCon: json['dieuKienSinhCon'] ?? '',
      nghiDuongThai: json['nghiDuongThai'] ?? '',
      chaNghiChamCon: json['chaNghiChamCon'] ?? '',
      bienPhapKHHGD: json['bienPhapKHHGD'] ?? '',
      ngayNhanCon: DateTime.tryParse(json['ngayNhanCon'] ?? ''),
      ngayDiLamThucTe: DateTime.tryParse(json['ngayDiLamThucTe'] ?? ''),
      ngayConChet: DateTime.tryParse(json['ngayConChet'] ?? ''),
      ngayMeChet: DateTime.tryParse(json['ngayMeChet'] ?? ''),
      mangThaiHo: json['mangThaiHo'] ?? '',
      ngayKetLuan: DateTime.tryParse(json['ngayKetLuan'] ?? ''),
      maSoBHXHCuaCon: json['maSoBHXHCuaCon'] ?? '',
      theBhytCuaCon: json['theBhytCuaCon'] ?? '',
      maSoBHXHCuaMe: json['maSoBHXHCuaMe'] ?? '',
      theBHYTCuaMe: json['theBHYTCuaMe'],
      soCMNDCuaMe: json['soCMNDCuaMe'] ?? '',
      phiGiamDinhYKhoa: json['phiGiamDinhYKhoa'],
      soBHXHNND: json['soBHXHNND'] ?? '',
      phauThuatThai32: json['phauThuatThai32'] ?? '',
      dotBoSung: json['dotBoSung'] ?? '',
      maHoSo: json['maHoSo'] ?? '',
      ghiChu: json['ghiChu'] ?? '',
      hinhThucNhan: json['hinhThucNhan'] ?? '',
      soTaiKhoan: json['soTaiKhoan'] ?? '',
      tenChuTaiKhoan: json['tenChuTaiKhoan'] ?? '',
      nganHang:
          json['nganHang'] != null ? Bank.fromJson(json['nganHang']) : null,
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'] ?? '',
      lyDoDieuChinh: json['lyDoDieuChinh'] ?? '',
      tuoiThai: json['tuoiThai'],
      tuNgayDuyetTruoc: DateTime.tryParse(json['tuNgayDuyetTruoc'] ?? ''),
    );
  }
}
