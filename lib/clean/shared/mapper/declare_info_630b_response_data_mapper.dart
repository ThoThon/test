import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630b/data/model/declare_info_630b_response_data.dart';
import 'package:v_bhxh/modules/declare_info_630b/domain/entity/declare_info_630b.dart';

import 'categories_630/bank_data_mapper.dart';

class DeclareInfo630bResponseDataMapper
    extends BaseDataMapper<DeclareInfo630bResponseData, DeclareInfo630b> {
  final BankDataMapper _bankDataMapper;

  DeclareInfo630bResponseDataMapper(this._bankDataMapper);
  @override
  DeclareInfo630b mapToEntity(DeclareInfo630bResponseData? data) {
    return DeclareInfo630b(
      id: data?.id,
      periodId: data?.kyKeKhaiId ?? '',
      adjustment: data?.phatSinhDieuChinh ?? '',
      fullName: data?.hoTen ?? '',
      bhxhNumber: data?.maSoBhxh ?? '',
      cccdNumber: data?.soCmnd,
      employeeId: data?.maNhanVien,
      groupCode: data?.maNhomHuong ?? '',
      groupCodeLv2: data?.maNhomHuong2,
      fromDate: DateTime.tryParse(data?.tuNgay ?? ''),
      toDate: DateTime.tryParse(data?.denNgay ?? ''),
      totalDays: data?.tongSoNgay,
      unitFromDate: DateTime.tryParse(data?.tuNgayDonVi ?? ''),
      unitToDate: DateTime.tryParse(data?.denNgayDonVi ?? ''),
      dayOff: data?.ngayNghiTuan ?? '',
      seriNumber: data?.soSeriCT,
      antenatalCondition: data?.dieuKienKhamThai,
      pregnancyAge: data?.tuoiThai,
      contraceptiveMethod: data?.bienPhapKhhgd,
      childbirthCondition: data?.dieuKienSinhCon,
      childDob: DateTime.tryParse(data?.ngaySinhCon ?? ''),
      childCount: data?.soCon,
      childBhxhNumber: data?.maSoBHXHCuaCon,
      childBhyt: data?.theBhytCuaCon,
      childDeathCount: data?.soCCHoacThaiCL,
      childDeathDate: DateTime.tryParse(data?.ngayConChet ?? ''),
      adoptionDate: DateTime.tryParse(data?.ngayNhanCon ?? ''),
      actualWorkDate: DateTime.tryParse(data?.ngayDiLamThucTe ?? ''),
      motherBhxhNumber: data?.maSoBHXHCuaMe,
      motherBhyt: data?.theBHYTCuaMe,
      motherCccd: data?.soCMNDCuaMe,
      surgery32Weeks: data?.phauThuatThai32,
      motherDeathDate: DateTime.tryParse(data?.ngayMeChet ?? ''),
      conclusionDate: DateTime.tryParse(data?.ngayKetLuan ?? ''),
      medicalAssessmentFee: data?.phiGiamDinhYKhoa,
      bhxhNND: data?.soBHXHNND,
      maternityLeave: data?.nghiDuongThai,
      fatherLeave: data?.chaNghiChamCon,
      surrogatePregnancy: data?.mangThaiHo,
      extraBatch: data?.dotBoSung,
      dossierId: data?.maHoSo ?? '',
      note: data?.ghiChu,
      receiveType: data?.hinhThucNhan ?? '',
      bankAccount: data?.soTaiKhoan,
      accountName: data?.tenChuTaiKhoan,
      bank: _bankDataMapper.mapToEntity(data?.nganHang),
      resolvedBatch: data?.dotDaGiaiQuyet,
      adjustReason: data?.lyDoDieuChinh,
      prevApproveDate: DateTime.tryParse(data?.tuNgayDuyetTruoc ?? ''),
    );
  }
}
