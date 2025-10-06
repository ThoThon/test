import 'package:v_bhxh/clean/shared/mapper/categories_630/bank_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630a/data/model/declare_info_630a_response_data.dart';
import 'package:v_bhxh/modules/declare_info_630a/domain/entity/declare_info_630a.dart';

class DeclareInfo630aResponseDataMapper
    extends BaseDataMapper<DeclareInfo630aResponseData, DeclareInfo630a> {
  final BankDataMapper _bankDataMapper;
  DeclareInfo630aResponseDataMapper(this._bankDataMapper);
  @override
  DeclareInfo630a mapToEntity(DeclareInfo630aResponseData? data) {
    return DeclareInfo630a(
      id: data?.id,
      periodId: data?.kyKeKhaiId ?? '',
      adjustment: data?.phatSinhDieuChinh ?? '',
      fullName: data?.hoTen ?? '',
      bhxhNumber: data?.maSoBhxh ?? '',
      cccdNumber: data?.soCmnd ?? '',
      employeeId: data?.maNhanVien ?? '',
      groupCode: data?.maNhomHuong ?? '',
      seriNumber: data?.soSeriCT ?? '',
      fromDate: DateTime.tryParse(data?.tuNgay ?? ''),
      toDate: DateTime.tryParse(data?.denNgay ?? ''),
      totalDays: data?.tongSoNgay ?? 0,
      unitFromDate: DateTime.tryParse(data?.tuNgayDonVi ?? ''),
      unitToDate: DateTime.tryParse(data?.denNgayDonVi ?? ''),
      dayOff: data?.ngayNghiTuan ?? '',
      hospitalLevel: data?.tuyenBenhVien ?? '',
      childDob: DateTime.tryParse(data?.ngaySinhCon ?? ''),
      childBhyt: data?.theBhytCuaCon ?? '',
      childCount: data?.soCon ?? 0,
      chronicCode: data?.maBenhDaiNgay ?? '',
      diseaseName: data?.tenBenh ?? '',
      workCondition: data?.dieuKienLamViec ?? '',
      maternityLeave: data?.dangKyNghiDuongThai ?? false,
      extraBatch: data?.dotBoSung ?? '',
      dossierId: data?.maHoSo ?? '',
      receiveType: data?.hinhThucNhan ?? '',
      bankAccount: data?.soTaiKhoan ?? '',
      accountName: data?.tenChuTaiKhoan ?? '',
      bank: _bankDataMapper.mapToEntity(data?.nganHang),
      note: data?.ghiChu ?? '',
      resolvedBatch: data?.dotDaGiaiQuyet ?? '',
      prevApproveDate: DateTime.tryParse(data?.tuNgayDuyetTruoc ?? ''),
      adjustReason: data?.lyDoDieuChinh ?? '',
    );
  }
}
