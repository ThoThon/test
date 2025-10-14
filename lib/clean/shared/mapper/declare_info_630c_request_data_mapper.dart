import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630c/data/model/declare_info_630c_request_data.dart';
import 'package:v_bhxh/modules/declare_info_630c/domain/entity/declare_info_630c.dart';

class DeclareInfo630cRequestDataMapper
    extends BaseEntityMapper<DeclareInfo630c, DeclareInfo630cRequestData> {
  @override
  DeclareInfo630cRequestData mapToData(DeclareInfo630c entity) {
    return DeclareInfo630cRequestData(
      id: entity.id,
      kyKeKhaiId: entity.periodId,
      phatSinhDieuChinh: entity.adjustment,
      hoTen: entity.fullName,
      maSoBhxh: entity.bhxhNumber,
      soCmnd: entity.cccdNumber,
      maNhanVien: entity.employeeId,
      maNhomHuong: entity.groupCode,
      tuNgay: entity.fromDate?.toIso8601String(),
      denNgay: entity.toDate?.toIso8601String(),
      tongSoNgay: entity.totalDays,
      tuNgayDonVi: entity.unitFromDate?.toIso8601String(),
      denNgayDonVi: entity.unitToDate?.toIso8601String(),
      soSeriCT: entity.seriNumber,
      ngayTroLaiLamViec: entity.returnToWorkDate?.toIso8601String(),
      ngayGiamDinh: entity.appraisalDate?.toIso8601String(),
      tyLeSuyGiam: entity.rateToDecline,
      dotBoSung: entity.extraBatch,
      maHoSo: entity.dossierId,
      ghiChu: entity.note,
      hinhThucNhan: entity.receiveType,
      soTaiKhoan: entity.bankAccount,
      tenChuTaiKhoan: entity.accountName,
      maNganHang: entity.bank?.code,
      dotDaGiaiQuyet: entity.resolvedBatch,
      lyDoDieuChinh: entity.adjustReason,
      tuNgayDuyetTruoc: entity.prevApproveDate?.toIso8601String(),
    );
  }
}
