import 'package:v_bhxh/clean/shared/mapper/category_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/staff_family_response_data_mapper.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_detail_data.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_detail.dart';

class SelectedStaffDetailDataMapper
    extends BaseDataMapper<SelectedStaffDetailData, SelectedStaffDetail> {
  final CategoryDataMapper _categoryDataMapper;
  final ProvinceDataMapper _provinceDataMapper;
  final WardDataMapper _wardDataMapper;
  final StaffFamilyResponseDataMapper _staffFamilyResponseDataMapper;

  SelectedStaffDetailDataMapper(
    this._categoryDataMapper,
    this._provinceDataMapper,
    this._wardDataMapper,
    this._staffFamilyResponseDataMapper,
  );
  @override
  SelectedStaffDetail mapToEntity(SelectedStaffDetailData? data) {
    return SelectedStaffDetail(
      id: data?.id,
      hoTen: data?.hoTen,
      maSoBHXH: data?.maSoBHXH,
      soCCCD: data?.soCCCD,
      gioiTinh: data?.gioiTinh?.rawValue,
      chiCoNamSinh: data?.chiCoNamSinh?.rawValue,
      ngaySinh: data?.ngaySinh,
      danToc: _categoryDataMapper.mapToEntity(data?.danToc),
      quocTich: _categoryDataMapper.mapToEntity(data?.quocTich),
      chucVu: data?.chucVu,
      dongTheoHeSo: data?.dongTheoHeSo ?? false,
      heSoLuongCoBan: int.tryParse(data?.heSoLuongCoBan ?? ''),
      tienLuong: int.tryParse(data?.tienLuong ?? ''),
      phuCapChucVu: int.tryParse(data?.phuCapChucVu ?? ''),
      phuCapThamNienVuotKhung:
          int.tryParse(data?.phuCapThamNienVuotKhung ?? ''),
      phuCapThamNienNghe: int.tryParse(data?.phuCapThamNienNghe ?? ''),
      phuCapLuong: int.tryParse(data?.phuCapLuong ?? ''),
      phuCapBoSung: int.tryParse(data?.phuCapBoSung ?? ''),
      benhVienTinh: _provinceDataMapper.mapToEntity(data?.benhVienTinh),
      benhVien: Hospital(
        id: data?.benhVien?.id ?? 0,
        code: data?.benhVien?.code ?? '',
        name: data?.benhVien?.name ?? '',
        provinceId: data?.benhVien?.provinceId ?? '',
      ),
      khaiSinhTinh: _provinceDataMapper.mapToEntity(data?.khaiSinhTinh),
      khaiSinhXa: _wardDataMapper.mapToEntity(data?.khaiSinhXa),
      diaChiKhaiSinh: data?.diaChiKhaiSinh ?? '',
      noiNhanTinh: _provinceDataMapper.mapToEntity(data?.noiNhanTinh),
      noiNhanXa: _wardDataMapper.mapToEntity(data?.noiNhanXa),
      diaChiNoiNhan: data?.diaChiNoiNhan ?? '',
      dienThoaiLienHe: data?.dienThoaiLienHe,
      hoTenChuHo: data?.hoTenChuHo,
      chuHoSoCCCD: data?.chuHoSoCCCD,
      chuHoThuongTruTinh:
          _provinceDataMapper.mapToEntity(data?.chuHoThuongTruTinh),
      chuHoThuongTruXa: _wardDataMapper.mapToEntity(data?.chuHoThuongTruXa),
      diaChiThuongTruChuHo: data?.diaChiKhaiSinh,
      trungDiaChiKhaiSinh: data?.trungDiaChiKhaiSinh ?? false,
      laChuHo: data?.laChuHo ?? false,
      tyLeDong: data?.tyLeDong,
      danhSachThanhViens: _staffFamilyResponseDataMapper
          .mapToListEntity(data?.danhSachThanhViens),
    );
  }
}
