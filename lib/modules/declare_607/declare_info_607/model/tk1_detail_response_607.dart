import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/hospital.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/model_src.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/receive_profile_result_enum.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class Tk1DetailResponse607 {
  final String id;
  final String kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? cmnd;
  final BirthTypeEnum chiCoNamSinh;
  final DateTime? ngaySinh;
  final Gender? gioiTinh;
  final EthnicModel? danToc;
  final NationModel? quocTich;
  final ProvinceModel? khaiSinhTinh;
  final DistrictModel? khaiSinhHuyen;
  final WardModel? khaiSinhXa;
  final String? diaChiKhaiSinh;
  final bool trungDiaChiKhaiSinh;
  final ProvinceModel? noiNhanTinh;
  final DistrictModel? noiNhanHuyen;
  final WardModel? noiNhanXa;
  final String? noiNhanDiaChiChiTiet;
  final ProvinceOldModel? benhVienTinh;
  final Hospital? benhVien;
  final String? dienThoaiLienHe;
  final String? noiDungThayDoi;
  final String? hoSoKemTheo;

  /// `DT` - Nhận kết quả bản điện tử
  ///
  /// `G` - Nhận kết quả bản giấy
  final ReceiveProfileResultEnum dangKyNhanKetQua;
  final ProvinceModel? nhanBanGiayTinh;
  final DistrictModel? nhanBanGiayHuyen;
  final WardModel? nhanBanGiayXa;
  final String? diaChiNhanBanGiay;

  final bool laChuHo;
  final String? hoTenChuHo;
  final String? chuHoSoCccd;
  final ProvinceModel? chuHoThuongTruTinh;
  final DistrictModel? chuHoThuongTruHuyen;
  final WardModel? chuHoThuongTruXa;
  final String? diaChiThuongTruChuHo;
  final bool xuatD01;

  const Tk1DetailResponse607({
    required this.id,
    required this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.cmnd,
    required this.chiCoNamSinh,
    this.ngaySinh,
    this.gioiTinh,
    this.danToc,
    this.quocTich,
    this.khaiSinhTinh,
    this.khaiSinhHuyen,
    this.khaiSinhXa,
    this.diaChiKhaiSinh,
    required this.trungDiaChiKhaiSinh,
    this.noiNhanTinh,
    this.noiNhanHuyen,
    this.noiNhanXa,
    this.noiNhanDiaChiChiTiet,
    this.benhVienTinh,
    this.benhVien,
    this.dienThoaiLienHe,
    this.noiDungThayDoi,
    this.hoSoKemTheo,
    required this.dangKyNhanKetQua,
    this.nhanBanGiayTinh,
    this.nhanBanGiayHuyen,
    this.nhanBanGiayXa,
    this.diaChiNhanBanGiay,
    required this.laChuHo,
    this.hoTenChuHo,
    this.chuHoSoCccd,
    this.chuHoThuongTruTinh,
    this.chuHoThuongTruHuyen,
    this.chuHoThuongTruXa,
    this.diaChiThuongTruChuHo,
    required this.xuatD01,
  });

  factory Tk1DetailResponse607.fromJson(Map<String, dynamic> json) {
    return Tk1DetailResponse607(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      cmnd: json['cmnd'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      gioiTinh: Gender.parse(json['gioiTinh']),
      danToc:
          json['danToc'] != null ? EthnicModel.fromJson(json['danToc']) : null,
      quocTich: json['quocTich'] != null
          ? NationModel.fromJson(json['quocTich'])
          : null,
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? ProvinceModel.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? DistrictModel.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa: json['khaiSinhXa'] != null
          ? WardModel.fromJson(json['khaiSinhXa'])
          : null,
      diaChiKhaiSinh: json['diaChiKhaiSinh'],
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
      noiDungThayDoi: json['noiDungThayDoi'],
      hoSoKemTheo: json['hoSoKemTheo'],
      dangKyNhanKetQua:
          ReceiveProfileResultEnum.fromCode(json['dangKyNhanKetQua']) ??
              ReceiveProfileResultEnum.defaultValue,
      nhanBanGiayTinh: json['nhanBanGiayTinh'] != null
          ? ProvinceModel.fromJson(json['nhanBanGiayTinh'])
          : null,
      nhanBanGiayHuyen: json['nhanBanGiayHuyen'] != null
          ? DistrictModel.fromJson(json['nhanBanGiayHuyen'])
          : null,
      nhanBanGiayXa: json['nhanBanGiayXa'] != null
          ? WardModel.fromJson(json['nhanBanGiayXa'])
          : null,
      diaChiNhanBanGiay: json['diaChiNhanBanGiay'],
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
      xuatD01: json['xuatD01'] ?? false,
    );
  }
}
