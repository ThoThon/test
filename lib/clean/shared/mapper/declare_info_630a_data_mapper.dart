import 'package:v_bhxh/clean/shared/mapper/categories_630/bank_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/data/model/declare_info_630a_data.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/entity/declare_info_630a.dart';

class DeclareInfo630aDataMapper
    extends BaseDataMapper<DeclareInfo630aData, DeclareInfo630a>
    with DataMapperMixin {
  final BankDataMapper _bankDataMapper;
  DeclareInfo630aDataMapper(this._bankDataMapper);
  @override
  DeclareInfo630a mapToEntity(DeclareInfo630aData? data) {
    return DeclareInfo630a(
      id: data?.id,
      kyKeKhaiId: data?.kyKeKhaiId ?? '',
      phatSinhDieuChinh: data?.phatSinhDieuChinh ?? '',
      hoTen: data?.hoTen ?? '',
      maSoBhxh: data?.maSoBhxh ?? '',
      soCmnd: data?.soCmnd ?? '',
      maNhanVien: data?.maNhanVien ?? '',
      maNhomHuong: data?.maNhomHuong ?? '',
      soSeriCT: data?.soSeriCT ?? '',
      tuNgay: data?.tuNgay ?? '',
      denNgay: data?.denNgay ?? '',
      tongSoNgay: data?.tongSoNgay ?? 0,
      tuNgayDonVi: data?.tuNgayDonVi ?? '',
      ngayNghiTuan: data?.ngayNghiTuan ?? '',
      tuyenBenhVien: data?.tuyenBenhVien ?? '',
      ngaySinhCon: data?.ngaySinhCon ?? '',
      theBhytCuaCon: data?.theBhytCuaCon ?? '',
      soCon: data?.soCon ?? 0,
      maBenhDaiNgay: data?.maBenhDaiNgay ?? '',
      tenBenh: data?.tenBenh ?? '',
      dieuKienLamViec: data?.dieuKienLamViec ?? '',
      dangKyNghiDuongThai: data?.dangKyNghiDuongThai ?? false,
      dotBoSung: data?.dotBoSung ?? '',
      maHoSo: data?.maHoSo ?? '',
      hinhThucNhan: data?.hinhThucNhan ?? '',
      soTaiKhoan: data?.soTaiKhoan ?? '',
      tenChuTaiKhoan: data?.tenChuTaiKhoan ?? '',
      nganHang: _bankDataMapper.mapToEntity(data?.nganHang),
      ghiChu: data?.ghiChu ?? '',
      dotDaGiaiQuyet: data?.dotDaGiaiQuyet ?? '',
      tuNgayDuyetTruoc: data?.tuNgayDuyetTruoc ?? '',
      lyDoDieuChinh: data?.lyDoDieuChinh ?? '',
    );
  }

  @override
  DeclareInfo630aData mapToData(DeclareInfo630a entity) {
    return DeclareInfo630aData(
      id: entity.id,
      kyKeKhaiId: entity.kyKeKhaiId,
      phatSinhDieuChinh: entity.phatSinhDieuChinh,
      hoTen: entity.hoTen,
      maSoBhxh: entity.maSoBhxh,
      soCmnd: entity.soCmnd,
      maNhanVien: entity.maNhanVien,
      maNhomHuong: entity.maNhomHuong,
      soSeriCT: entity.soSeriCT,
      tuNgay: entity.tuNgay,
      denNgay: entity.denNgay,
      tongSoNgay: entity.tongSoNgay,
      tuNgayDonVi: entity.tuNgayDonVi,
      ngayNghiTuan: entity.ngayNghiTuan,
      tuyenBenhVien: entity.tuyenBenhVien,
      ngaySinhCon: entity.ngaySinhCon,
      theBhytCuaCon: entity.theBhytCuaCon,
      soCon: entity.soCon,
      maBenhDaiNgay: entity.maBenhDaiNgay,
      tenBenh: entity.tenBenh,
      dieuKienLamViec: entity.dieuKienLamViec,
      dangKyNghiDuongThai: entity.dangKyNghiDuongThai,
      dotBoSung: entity.dotBoSung,
      maHoSo: entity.maHoSo,
      hinhThucNhan: entity.hinhThucNhan,
      soTaiKhoan: entity.soTaiKhoan,
      tenChuTaiKhoan: entity.tenChuTaiKhoan,
      nganHang: _bankDataMapper.mapToData(entity.nganHang),
      ghiChu: entity.ghiChu,
      dotDaGiaiQuyet: entity.dotDaGiaiQuyet,
      tuNgayDuyetTruoc: entity.tuNgayDuyetTruoc,
      lyDoDieuChinh: entity.lyDoDieuChinh,
    );
  }
}
