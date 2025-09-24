import 'package:v_bhxh/clean/shared/model/category_data.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';

class SelectedStaffDetailData {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final Gender? gioiTinh;
  final BirthTypeEnum? chiCoNamSinh;
  final String? ngaySinh;
  final CategoryData? danToc;
  final CategoryData? quocTich;
  final String? chucVu;
  final bool? dongTheoHeSo;
  final String? heSoLuongCoBan;
  final String? tienLuong;
  final String? phuCapChucVu;
  final String? phuCapThamNienVuotKhung;
  final String? phuCapThamNienNghe;
  final String? phuCapLuong;
  final String? phuCapBoSung;
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
  final String? tyLeDong;
  final List<StaffFamilyResponse>? danhSachThanhViens;

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
      gioiTinh: Gender.parse(json['gioiTinh']),
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']),
      ngaySinh: json['ngaySinh'],
      danToc: CategoryData.fromJson(json['danToc']),
      quocTich: CategoryData.fromJson(json['quocTich']),
      chucVu: json['chucVu'],
      dongTheoHeSo: json['dongTheoHeSo'],
      heSoLuongCoBan: json['heSoLuongCoBan'],
      tienLuong: json['tienLuong'],
      phuCapChucVu: json['phuCapChucVu'],
      phuCapThamNienVuotKhung: json['phuCapThamNienVuotKhung']?.toDouble(),
      phuCapThamNienNghe: json['phuCapThamNienNghe']?.toDouble(),
      phuCapLuong: json['phuCapLuong'],
      phuCapBoSung: json['phuCapBoSung'],
      benhVienTinh: ProvinceData.fromJson(json['benhVienTinh']),
      benhVien: Hospital.fromJson(json['benhVien']),
      khaiSinhTinh: ProvinceData.fromJson(json['khaiSinhTinh']),
      khaiSinhXa: WardData.fromJson(json['khaiSinhXa']),
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
      noiNhanTinh: ProvinceData.fromJson(json['noiNhanTinh']),
      noiNhanXa: WardData.fromJson(json['noiNhanXa']),
      diaChiNoiNhan: json['diaChiNoiNhan'],
      dienThoaiLienHe: json['dienThoaiLienHe'],
      hoTenChuHo: json['hoTenChuHo'],
      chuHoSoCCCD: json['chuHoSoCCCD'],
      chuHoThuongTruTinh: ProvinceData.fromJson(json['chuHoThuongTruTinh']),
      chuHoThuongTruXa: WardData.fromJson(json['chuHoThuongTruXa']),
      diaChiThuongTruChuHo: json['diaChiThuongTruChuHo'],
      tyLeDong: json['tyLeDong'],
      trungDiaChiKhaiSinh: json['trungDiaChiKhaiSinh'],
      laChuHo: json['laChuHo'],
      danhSachThanhViens: (json['danhSachThanhViens'] as List?)
          ?.map((e) => StaffFamilyResponse.fromJson(e))
          .toList(),
    );
  }
}
