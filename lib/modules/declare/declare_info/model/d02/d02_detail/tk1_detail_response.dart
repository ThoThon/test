import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/hospital.dart';

class Tk1DetailResponse {
  final Province? khaiSinhTinh;
  final District? khaiSinhHuyen;
  final Ward? khaiSinhXa;
  final bool trungDiaChiKhaiSinh;
  final Province? noiNhanTinh;
  final District? noiNhanHuyen;
  final Ward? noiNhanXa;
  final String? noiNhanDiaChiChiTiet;
  final Province? benhVienTinh;
  final Hospital? benhVien;
  final String? dienThoaiLienHe;
  final bool laChuHo;
  final String? hoTenChuHo;
  final String? chuHoSoCccd;
  final Province? chuHoThuongTruTinh;
  final District? chuHoThuongTruHuyen;
  final Ward? chuHoThuongTruXa;
  final String? diaChiThuongTruChuHo;
  final String? diaChiKhaiSinh;

  const Tk1DetailResponse({
    this.khaiSinhTinh,
    this.khaiSinhHuyen,
    this.khaiSinhXa,
    required this.trungDiaChiKhaiSinh,
    this.noiNhanTinh,
    this.noiNhanHuyen,
    this.noiNhanXa,
    this.noiNhanDiaChiChiTiet,
    this.benhVienTinh,
    this.benhVien,
    this.dienThoaiLienHe,
    required this.laChuHo,
    this.hoTenChuHo,
    this.chuHoSoCccd,
    this.chuHoThuongTruTinh,
    this.chuHoThuongTruHuyen,
    this.chuHoThuongTruXa,
    this.diaChiThuongTruChuHo,
    this.diaChiKhaiSinh,
  });

  factory Tk1DetailResponse.fromJson(Map<String, dynamic> json) {
    return Tk1DetailResponse(
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? Province.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? District.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa:
          json['khaiSinhXa'] != null ? Ward.fromJson(json['khaiSinhXa']) : null,
      trungDiaChiKhaiSinh: json['trungDiaChiKhaiSinh'] ?? false,
      noiNhanTinh: json['noiNhanTinh'] != null
          ? Province.fromJson(json['noiNhanTinh'])
          : null,
      noiNhanHuyen: json['noiNhanHuyen'] != null
          ? District.fromJson(json['noiNhanHuyen'])
          : null,
      noiNhanXa:
          json['noiNhanXa'] != null ? Ward.fromJson(json['noiNhanXa']) : null,
      noiNhanDiaChiChiTiet: json['noiNhanDiaChiChiTiet'],
      benhVienTinh: json['benhVienTinh'] != null
          ? Province.fromJson(json['benhVienTinh'])
          : null,
      benhVien:
          json['benhVien'] != null ? Hospital.fromJson(json['benhVien']) : null,
      dienThoaiLienHe: json['dienThoaiLienHe'],
      laChuHo: json['laChuHo'] ?? false,
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCccd: json['chuHoSoCCCD'],
      chuHoThuongTruTinh: json['chuHoThuongTruTinh'] != null
          ? Province.fromJson(json['chuHoThuongTruTinh'])
          : null,
      chuHoThuongTruHuyen: json['chuHoThuongTruHuyen'] != null
          ? District.fromJson(json['chuHoThuongTruHuyen'])
          : null,
      chuHoThuongTruXa: json['chuHoThuongTruXa'] != null
          ? Ward.fromJson(json['chuHoThuongTruXa'])
          : null,
      diaChiThuongTruChuHo: json['diaChiThuongTruChuHo'],
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
    );
  }
}
