import 'package:v_bhxh/modules/declare/declare_info/model/hospital.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class Tk1DetailResponse {
  final ProvinceModel? khaiSinhTinh;
  final DistrictModel? khaiSinhHuyen;
  final WardModel? khaiSinhXa;
  final bool trungDiaChiKhaiSinh;
  final ProvinceModel? noiNhanTinh;
  final DistrictModel? noiNhanHuyen;
  final WardModel? noiNhanXa;
  final String? noiNhanDiaChiChiTiet;
  final ProvinceOldModel? benhVienTinh;
  final Hospital? benhVien;
  final String? dienThoaiLienHe;
  final bool laChuHo;
  final String? hoTenChuHo;
  final String? chuHoSoCccd;
  final ProvinceModel? chuHoThuongTruTinh;
  final DistrictModel? chuHoThuongTruHuyen;
  final WardModel? chuHoThuongTruXa;
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
          ? ProvinceModel.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? DistrictModel.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa: json['khaiSinhXa'] != null
          ? WardModel.fromJson(json['khaiSinhXa'])
          : null,
      trungDiaChiKhaiSinh: json['trungDiaChiKhaiSinh'] ?? false,
      noiNhanTinh: json['noiNhanTinh'] != null
          ? ProvinceModel.fromJson(json['noiNhanTinh'])
          : null,
      noiNhanHuyen: json['noiNhanHuyen'] != null
          ? DistrictModel.fromJson(json['noiNhanHuyen'])
          : null,
      noiNhanXa: json['noiNhanXa'] != null
          ? WardModel.fromJson(json['noiNhanXa'])
          : null,
      noiNhanDiaChiChiTiet: json['noiNhanDiaChiChiTiet'],
      benhVienTinh: json['benhVienTinh'] != null
          ? ProvinceOldModel.fromJson(json['benhVienTinh'])
          : null,
      benhVien:
          json['benhVien'] != null ? Hospital.fromJson(json['benhVien']) : null,
      dienThoaiLienHe: json['dienThoaiLienHe'],
      laChuHo: json['laChuHo'] ?? false,
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCccd: json['chuHoSoCCCD'],
      chuHoThuongTruTinh: json['chuHoThuongTruTinh'] != null
          ? ProvinceModel.fromJson(json['chuHoThuongTruTinh'])
          : null,
      chuHoThuongTruHuyen: json['chuHoThuongTruHuyen'] != null
          ? DistrictModel.fromJson(json['chuHoThuongTruHuyen'])
          : null,
      chuHoThuongTruXa: json['chuHoThuongTruXa'] != null
          ? WardModel.fromJson(json['chuHoThuongTruXa'])
          : null,
      diaChiThuongTruChuHo: json['diaChiThuongTruChuHo'],
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
    );
  }
}
