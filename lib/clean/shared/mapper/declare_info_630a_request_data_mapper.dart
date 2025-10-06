import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630a/domain/entity/declare_info_630a.dart';

import '../../../modules/declare_info_630a/data/model/declare_info_630a_request_data.dart';

class DeclareInfo630aRequestDataMapper
    extends BaseEntityMapper<DeclareInfo630a, DeclareInfo630aRequestData> {
  @override
  DeclareInfo630aRequestData mapToData(DeclareInfo630a entity) {
    return DeclareInfo630aRequestData(
      id: entity.id,
      kyKeKhaiId: entity.periodId,
      phatSinhDieuChinh: entity.adjustment,
      hoTen: entity.fullName,
      maSoBhxh: entity.bhxhNumber,
      soCmnd: entity.cccdNumber,
      maNhanVien: entity.employeeId,
      maNhomHuong: entity.groupCode,
      soSeriCT: entity.seriNumber,
      tuNgay: entity.fromDate?.toIso8601String(),
      denNgay: entity.toDate?.toIso8601String(),
      tongSoNgay: entity.totalDays,
      tuNgayDonVi: entity.unitFromDate?.toIso8601String(),
      denNgayDonVi: entity.unitToDate?.toIso8601String(),
      ngayNghiTuan: entity.dayOff,
      tuyenBenhVien: entity.hospitalLevel,
      ngaySinhCon: entity.childDob?.toIso8601String(),
      theBhytCuaCon: entity.childBhyt,
      soCon: entity.childCount,
      maBenhDaiNgay: entity.chronicCode,
      tenBenh: entity.diseaseName,
      dieuKienLamViec: entity.workCondition,
      dangKyNghiDuongThai: entity.maternityLeave,
      dotBoSung: entity.extraBatch,
      maHoSo: entity.dossierId,
      hinhThucNhan: entity.receiveType,
      soTaiKhoan: entity.bankAccount,
      tenChuTaiKhoan: entity.accountName,
      maNganHang: entity.bank?.code ?? '',
      ghiChu: entity.note,
      dotDaGiaiQuyet: entity.resolvedBatch,
      tuNgayDuyetTruoc: entity.prevApproveDate?.toIso8601String(),
      lyDoDieuChinh: entity.adjustReason,
    );
  }
}
