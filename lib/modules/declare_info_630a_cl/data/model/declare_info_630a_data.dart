import 'package:v_bhxh/clean/shared/model/categories_630/categories_630_src.dart';

class DeclareInfo630aData {
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
  final int? tongSoNgay;
  final String? tuNgayDonVi;
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

  DeclareInfo630aData({
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

  factory DeclareInfo630aData.fromJson(Map<String, dynamic> json) {
    return DeclareInfo630aData(
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
      nganHang: BankData.fromJson(json['nganHang']),
      ghiChu: json['ghiChu'],
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'],
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'],
      lyDoDieuChinh: json['lyDoDieuChinh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'phatSinh_DieuChinh': phatSinhDieuChinh,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'soCmnd': soCmnd,
      'maNhanVien': maNhanVien,
      'maNhomHuong': maNhomHuong,
      'soSeriCT': soSeriCT,
      'tuNgay': tuNgay,
      'denNgay': denNgay,
      'tongSoNgay': tongSoNgay,
      'tuNgayDonVi': tuNgayDonVi,
      'ngayNghiTuan': ngayNghiTuan,
      'tuyenBenhVien': tuyenBenhVien,
      'ngaySinhCon': ngaySinhCon,
      'theBhytCuaCon': theBhytCuaCon,
      'soCon': soCon,
      'maBenhDaiNgay': maBenhDaiNgay,
      'tenBenh': tenBenh,
      'dieuKienLamViec': dieuKienLamViec,
      'dangKyNghiDuongThai': dangKyNghiDuongThai,
      'dotBoSung': dotBoSung,
      'maHoSo': maHoSo,
      'hinhThucNhan': hinhThucNhan,
      'soTaiKhoan': soTaiKhoan,
      'tenChuTaiKhoan': tenChuTaiKhoan,
      // Chỉ gửi mã ngân hàng
      'nganHang': nganHang?.code,
      'ghiChu': ghiChu,
      'dotDaGiaiQuyet': dotDaGiaiQuyet,
      'tuNgayDuyetTruoc': tuNgayDuyetTruoc,
      'lyDoDieuChinh': lyDoDieuChinh,
    };
  }
}
