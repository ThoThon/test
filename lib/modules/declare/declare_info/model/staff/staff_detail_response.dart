import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class StaffDetailResponse {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final Gender? gioiTinh;
  final DateTime? ngaySinh;
  final EthnicModel? danToc;
  final NationModel? quocTich;
  final String? chucVu;
  final double? tienLuong;
  final double? phuCapChucVu;
  final double? phuCapThamNienVuotKhung;
  final double? phuCapThamNienNghe;
  final double? phuCapLuong;
  final double? phuCapBoSung;
  final ProvinceModel? benhVienTinh;
  final Hospital? benhVien;
  final ProvinceModel? khaiSinhTinh;
  final DistrictModel? khaiSinhHuyen;
  final WardModel? khaiSinhXa;
  final ProvinceModel? noiNhanTinh;
  final DistrictModel? noiNhanHuyen;
  final WardModel? noiNhanXa;
  final String? dienThoaiLienHe;
  final String? hoTenChuHo;
  final String? chuHoSoCCCD;
  final ProvinceModel? chuHoTinh;
  final DistrictModel? chuHoHuyen;
  final WardModel? chuHoXa;
  final List<StaffFamilyResponse> danhSachThanhViens;

  const StaffDetailResponse({
    this.id,
    this.hoTen,
    this.maSoBHXH,
    this.soCCCD,
    this.gioiTinh,
    this.ngaySinh,
    this.danToc,
    this.quocTich,
    this.chucVu,
    this.tienLuong,
    this.phuCapChucVu,
    this.phuCapThamNienVuotKhung,
    this.phuCapThamNienNghe,
    this.phuCapLuong,
    this.phuCapBoSung,
    this.benhVienTinh,
    this.benhVien,
    this.khaiSinhTinh,
    this.khaiSinhHuyen,
    this.khaiSinhXa,
    this.noiNhanTinh,
    this.noiNhanHuyen,
    this.noiNhanXa,
    this.dienThoaiLienHe,
    this.hoTenChuHo,
    this.chuHoSoCCCD,
    this.chuHoTinh,
    this.chuHoHuyen,
    this.chuHoXa,
    required this.danhSachThanhViens,
  });

  factory StaffDetailResponse.fromJson(Map<String, dynamic> json) {
    return StaffDetailResponse(
      id: json['id'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
      soCCCD: json['soCCCD'],
      gioiTinh: Gender.parse(json['gioiTinh']),
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      danToc:
          json['danToc'] != null ? EthnicModel.fromJson(json['danToc']) : null,
      quocTich: json['quocTich'] != null
          ? NationModel.fromJson(json['quocTich'])
          : null,
      chucVu: json['chucVu'],
      tienLuong: json['tienLuong'] != null
          ? double.tryParse(json['tienLuong'].toString())
          : null,
      phuCapChucVu: json['phuCapChucVu'] != null
          ? double.tryParse(json['phuCapChucVu'].toString())
          : null,
      phuCapThamNienVuotKhung: json['phuCapThamNienVuotKhung'] != null
          ? double.tryParse(json['phuCapThamNienVuotKhung'].toString())
          : null,
      phuCapThamNienNghe: json['phuCapThamNienNghe'] != null
          ? double.tryParse(json['phuCapThamNienNghe'].toString())
          : null,
      phuCapLuong: json['phuCapLuong'] != null
          ? double.tryParse(json['phuCapLuong'].toString())
          : null,
      phuCapBoSung: json['phuCapBoSung'] != null
          ? double.tryParse(json['phuCapBoSung'].toString())
          : null,
      benhVienTinh: json['benhVienTinh'] != null
          ? ProvinceModel.fromJson(json['benhVienTinh'])
          : null,
      benhVien:
          json['benhVien'] != null ? Hospital.fromJson(json['benhVien']) : null,
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? ProvinceModel.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? DistrictModel.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa: json['khaiSinhXa'] != null
          ? WardModel.fromJson(json['khaiSinhXa'])
          : null,
      noiNhanTinh: json['noiNhanTinh'] != null
          ? ProvinceModel.fromJson(json['noiNhanTinh'])
          : null,
      noiNhanHuyen: json['noiNhanHuyen'] != null
          ? DistrictModel.fromJson(json['noiNhanHuyen'])
          : null,
      noiNhanXa: json['noiNhanXa'] != null
          ? WardModel.fromJson(json['noiNhanXa'])
          : null,
      dienThoaiLienHe: json['dienThoaiLienHe'],
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCCCD: json['chuHoSoCCCD'],
      chuHoTinh: json['chuHoTinh'] != null
          ? ProvinceModel.fromJson(json['chuHoTinh'])
          : null,
      chuHoHuyen: json['chuHoHuyen'] != null
          ? DistrictModel.fromJson(json['chuHoHuyen'])
          : null,
      chuHoXa:
          json['chuHoXa'] != null ? WardModel.fromJson(json['chuHoXa']) : null,
      danhSachThanhViens: (json['danhSachThanhViens'] as List?)
              ?.map((e) => StaffFamilyResponse.fromJson(e))
              .toList() ??
          [],
    );
  }
}
