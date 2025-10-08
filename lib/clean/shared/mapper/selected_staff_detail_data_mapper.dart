import 'package:v_bhxh/clean/shared/mapper/category_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/staff_family_response_data_mapper.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/entity_src.dart';
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
      fullName: data?.hoTen,
      bhxhNumber: data?.maSoBHXH,
      cccdNumber: data?.soCCCD,
      gender: Gender.parse(data?.gioiTinh),
      onlyYearOfBirth: BirthTypeEnum.parse(data?.chiCoNamSinh),
      dateOfBirth: data?.ngaySinh,
      ethnicity: _categoryDataMapper.mapToEntity(data?.danToc),
      nationality: _categoryDataMapper.mapToEntity(data?.quocTich),
      position: data?.chucVu,
      basedOnCoefficient: data?.dongTheoHeSo ?? false,
      baseSalaryCoefficient: data?.heSoLuongCoBan.toString() ?? '',
      salary: data?.tienLuong.toString() ?? '',
      positionAllowance: data?.phuCapChucVu.toString() ?? '',
      seniorityBeyondFrameAllowance:
          data?.phuCapThamNienVuotKhung.toString() ?? '',
      seniorityAllowance: data?.phuCapThamNienNghe.toString() ?? '',
      salaryAllowance: data?.phuCapLuong.toString() ?? '',
      additionalAllowance: data?.phuCapBoSung.toString() ?? '',
      hospitalProvince: _provinceDataMapper.mapToEntity(data?.benhVienTinh),
      hospital: data?.benhVien,
      birthProvince: _provinceDataMapper.mapToEntity(data?.khaiSinhTinh),
      birthWard: _wardDataMapper.mapToEntity(data?.khaiSinhXa),
      birthAddress: data?.diaChiKhaiSinh ?? '',
      receivingProvince: _provinceDataMapper.mapToEntity(data?.noiNhanTinh),
      receivingWard: _wardDataMapper.mapToEntity(data?.noiNhanXa),
      receivingAddress: data?.diaChiNoiNhan ?? '',
      contactPhone: data?.dienThoaiLienHe,
      householdHeadName: data?.hoTenChuHo,
      householdHeadIdentityCard: data?.chuHoSoCCCD,
      householdHeadPermanentProvince:
          _provinceDataMapper.mapToEntity(data?.chuHoThuongTruTinh),
      householdHeadPermanentWard:
          _wardDataMapper.mapToEntity(data?.chuHoThuongTruXa),
      householdHeadPermanentAddress: data?.diaChiKhaiSinh,
      sameAsBirthAddress: data?.trungDiaChiKhaiSinh ?? false,
      isHouseholdHead: data?.laChuHo ?? false,
      contributionRate: data?.tyLeDong.toString() ?? '',
      familyMembers: _staffFamilyResponseDataMapper
          .mapToListEntity(data?.danhSachThanhViens),
    );
  }
}
