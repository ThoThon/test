import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';

class StaffDetailResponse {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final Gender? gioiTinh;
  final BirthTypeEnum? chiCoNamSinh;
  final DateTime? ngaySinh;
  final Ethnic? danToc;
  final Nation? quocTich;
  final String? chucVu;
  final bool dongTheoHeSo;
  final double? heSoLuongCoBan;
  final double? tienLuong;
  final double? phuCapChucVu;
  final double? phuCapThamNienVuotKhung;
  final double? phuCapThamNienNghe;
  final double? phuCapLuong;
  final double? phuCapBoSung;
  final Province? benhVienTinh;
  final Hospital? benhVien;
  final Province? khaiSinhTinh;
  final District? khaiSinhHuyen;
  final Ward? khaiSinhXa;
  final String? diaChiKhaiSinh;
  final Province? noiNhanTinh;
  final District? noiNhanHuyen;
  final Ward? noiNhanXa;
  final String? diaChiNoiNhan;
  final String? dienThoaiLienHe;
  final String? hoTenChuHo;
  final String? chuHoSoCCCD;
  final Province? chuHoThuongTruTinh;
  final District? chuHoThuongTruHuyen;
  final Ward? chuHoThuongTruXa;
  final String? diaChiThuongTruChuHo;
  final bool trungDiaChiKhaiSinh;
  final bool laChuHo;
  final double? tyLeDong;
  final List<StaffFamilyResponse> danhSachThanhViens;

  const StaffDetailResponse({
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
    required this.dongTheoHeSo,
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
    this.khaiSinhHuyen,
    this.khaiSinhXa,
    this.diaChiKhaiSinh,
    this.noiNhanTinh,
    this.noiNhanHuyen,
    this.noiNhanXa,
    this.diaChiNoiNhan,
    this.dienThoaiLienHe,
    this.hoTenChuHo,
    this.chuHoSoCCCD,
    this.chuHoThuongTruTinh,
    this.chuHoThuongTruHuyen,
    this.chuHoThuongTruXa,
    this.diaChiThuongTruChuHo,
    required this.trungDiaChiKhaiSinh,
    required this.laChuHo,
    this.tyLeDong,
    required this.danhSachThanhViens,
  });

  factory StaffDetailResponse.fromJson(Map<String, dynamic> json) {
    return StaffDetailResponse(
      id: json['id'],
      hoTen: json['hoTen'],
      maSoBHXH: json['maSoBHXH'],
      soCCCD: json['soCCCD'],
      gioiTinh: Gender.parse(json['gioiTinh']),
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']),
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      danToc: json['danToc'] != null ? Ethnic.fromJson(json['danToc']) : null,
      quocTich:
          json['quocTich'] != null ? Nation.fromJson(json['quocTich']) : null,
      chucVu: json['chucVu'],
      dongTheoHeSo: json['dongTheoHeSo'] ?? false,
      heSoLuongCoBan: json['heSoLuongCoBan']?.toDouble(),
      tienLuong: json['tienLuong']?.toDouble(),
      phuCapChucVu: json['phuCapChucVu']?.toDouble(),
      phuCapThamNienVuotKhung: json['phuCapThamNienVuotKhung']?.toDouble(),
      phuCapThamNienNghe: json['phuCapThamNienNghe']?.toDouble(),
      phuCapLuong: json['phuCapLuong']?.toDouble(),
      phuCapBoSung: json['phuCapBoSung']?.toDouble(),
      benhVienTinh: json['benhVienTinh'] != null
          ? Province.fromJson(json['benhVienTinh'])
          : null,
      benhVien:
          json['benhVien'] != null ? Hospital.fromJson(json['benhVien']) : null,
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? Province.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? District.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa:
          json['khaiSinhXa'] != null ? Ward.fromJson(json['khaiSinhXa']) : null,
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
      noiNhanTinh: json['noiNhanTinh'] != null
          ? Province.fromJson(json['noiNhanTinh'])
          : null,
      noiNhanHuyen: json['noiNhanHuyen'] != null
          ? District.fromJson(json['noiNhanHuyen'])
          : null,
      noiNhanXa:
          json['noiNhanXa'] != null ? Ward.fromJson(json['noiNhanXa']) : null,
      diaChiNoiNhan: json['diaChiNoiNhan'],
      dienThoaiLienHe: json['dienThoaiLienHe'],
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCCCD: json['chuHoSoCCCD'],
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
      tyLeDong: json['tyLeDong']?.toDouble(),
      trungDiaChiKhaiSinh: json['trungDiaChiKhaiSinh'] ?? false,
      laChuHo: json['laChuHo'] ?? false,
      danhSachThanhViens: (json['danhSachThanhViens'] as List?)
              ?.map((e) => StaffFamilyResponse.fromJson(e))
              .toList() ??
          [],
    );
  }
}
