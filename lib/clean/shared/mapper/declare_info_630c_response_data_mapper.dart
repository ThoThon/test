import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630c/data/model/declare_info_630c_response_data.dart';
import 'package:v_bhxh/modules/declare_info_630c/domain/entity/declare_info_630c.dart';

import 'categories_630/bank_data_mapper.dart';

class DeclareInfo630cResponseDataMapper
    extends BaseDataMapper<DeclareInfo630cResponseData, DeclareInfo630c> {
  final BankDataMapper _bankDataMapper;

  DeclareInfo630cResponseDataMapper(this._bankDataMapper);

  @override
  DeclareInfo630c mapToEntity(DeclareInfo630cResponseData? data) {
    return DeclareInfo630c(
      id: data?.id,
      periodId: data?.kyKeKhaiId ?? '',
      adjustment: data?.phatSinhDieuChinh ?? '',
      fullName: data?.hoTen ?? '',
      bhxhNumber: data?.maSoBhxh ?? '',
      cccdNumber: data?.soCmnd,
      employeeId: data?.maNhanVien,
      groupCode: data?.maNhomHuong ?? '',
      fromDate: DateTime.tryParse(data?.tuNgay ?? ''),
      toDate: DateTime.tryParse(data?.denNgay ?? ''),
      totalDays: data?.tongSoNgay,
      unitFromDate: DateTime.tryParse(data?.tuNgayDonVi ?? ''),
      seriNumber: data?.soSeriCT,
      appraisalDate: DateTime.tryParse(data?.ngayGiamDinh ?? ''),
      returnToWorkDate: DateTime.tryParse(data?.ngayTroLaiLamViec ?? ''),
      rateToDecline: data?.tyLeSuyGiam,
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
