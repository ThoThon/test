import 'package:v_bhxh/clean/shared/model/category_data.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/data/model/staff_family_response_data.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';

class SelectedStaffDetailData {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final int? gioiTinh;
  final int? chiCoNamSinh;
  final String? ngaySinh;
  final CategoryData? danToc;
  final CategoryData? quocTich;
  final String? chucVu;
  final bool? dongTheoHeSo;
  final double? heSoLuongCoBan;
  final double? tienLuong;
  final double? phuCapChucVu;
  final double? phuCapThamNienVuotKhung;
  final double? phuCapThamNienNghe;
  final double? phuCapLuong;
  final double? phuCapBoSung;
  final ProvinceData? benhVienTinh;
  final Hospital? benhVien;
  final ProvinceData? khaiSinhTinh;
  final WardData? khaiSinhXa;
  final String? diaChiKhaiSinh;
  final ProvinceData? noiNhanTinh;
  final WardData? noiNhanXa;
  final String? diaChiNoiNhan;
  final String? dienThoaiLienHe;
  final String? hoTenChuHo;
  final String? chuHoSoCCCD;
  final ProvinceData? chuHoThuongTruTinh;
  final WardData? chuHoThuongTruXa;
  final String? diaChiThuongTruChuHo;
  final bool? trungDiaChiKhaiSinh;
  final bool? laChuHo;
  final double? tyLeDong;
  final List<StaffFamilyResponseDataCl>? danhSachThanhViens;

  const SelectedStaffDetailData({
    this.id,
    this.hoTen,
    this.maSoBHXH,
    this.soCCCD,
    this.gioiTinh,
    this.chiCoNamSinh,
    this.ngaySinh,
    this.danToc,
    this.quocTich,
    this.chucVu,
    this.dongTheoHeSo,
    this.heSoLuongCoBan,
    this.tienLuong,
    this.phuCapChucVu,
    this.phuCapThamNienVuotKhung,
    this.phuCapThamNienNghe,
    this.phuCapLuong,
    this.phuCapBoSung,
    this.benhVienTinh,
    this.benhVien,
    this.khaiSinhTinh,
    this.khaiSinhXa,
    this.diaChiKhaiSinh,
    this.noiNhanTinh,
    this.noiNhanXa,
    this.diaChiNoiNhan,
    this.dienThoaiLienHe,
    this.hoTenChuHo,
    this.chuHoSoCCCD,
    this.chuHoThuongTruTinh,
    this.chuHoThuongTruXa,
    this.diaChiThuongTruChuHo,
    this.trungDiaChiKhaiSinh,
    this.laChuHo,
    this.tyLeDong,
    this.danhSachThanhViens,
  });

  factory SelectedStaffDetailData.fromJson(Map<String, dynamic> json) {
    return SelectedStaffDetailData(
      id: json['id'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
      soCCCD: json['soCCCD'],
      gioiTinh: json['gioiTinh'],
      chiCoNamSinh: json['chiCoNamSinh'],
      ngaySinh: json['ngaySinh'],
      danToc:
          json['danToc'] != null ? CategoryData.fromJson(json['danToc']) : null,
      quocTich: json['quocTich'] != null
          ? CategoryData.fromJson(json['quocTich'])
          : null,
      chucVu: json['chucVu'],
      dongTheoHeSo: json['dongTheoHeSo'],
      heSoLuongCoBan: json['heSoLuongCoBan']?.toDouble(),
      tienLuong: json['tienLuong']?.toDouble(),
      phuCapChucVu: json['phuCapChucVu']?.toDouble(),
      phuCapThamNienVuotKhung: json['phuCapThamNienVuotKhung']?.toDouble(),
      phuCapThamNienNghe: json['phuCapThamNienNghe']?.toDouble(),
      phuCapLuong: json['phuCapLuong']?.toDouble(),
      phuCapBoSung: json['phuCapBoSung']?.toDouble(),
      benhVienTinh: json['benhVienTinh'] != null
          ? ProvinceData.fromJson(json['benhVienTinh'])
          : null,
      benhVien:
          json['benhVien'] != null ? Hospital.fromJson(json['benhVien']) : null,
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? ProvinceData.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhXa: json['khaiSinhXa'] != null
          ? WardData.fromJson(json['khaiSinhXa'])
          : null,
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
      noiNhanTinh: json['noiNhanTinh'] != null
          ? ProvinceData.fromJson(json['noiNhanTinh'])
          : null,
      noiNhanXa: json['noiNhanXa'] != null
          ? WardData.fromJson(json['noiNhanXa'])
          : null,
      diaChiNoiNhan: json['diaChiNoiNhan'],
      dienThoaiLienHe: json['dienThoaiLienHe'],
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCCCD: json['chuHoSoCCCD'],
      chuHoThuongTruTinh: json['chuHoThuongTruTinh'] != null
          ? ProvinceData.fromJson(json['chuHoThuongTruTinh'])
          : null,
      chuHoThuongTruXa: json['chuHoThuongTruXa'] != null
          ? WardData.fromJson(json['chuHoThuongTruXa'])
          : null,
      diaChiThuongTruChuHo: json['diaChiThuongTruChuHo'],
      trungDiaChiKhaiSinh: json['trungDiaChiKhaiSinh'],
      laChuHo: json['laChuHo'],
      tyLeDong: json['tyLeDong']?.toDouble(),
      danhSachThanhViens: (json['danhSachThanhViens'] as List?)
          ?.map((e) => StaffFamilyResponseDataCl.fromJson(e))
          .toList(),
    );
  }
}
