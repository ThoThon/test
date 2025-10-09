import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare_info_630b/data/model/declare_info_630b_request_data.dart';
import 'package:v_bhxh/modules/declare_info_630b/domain/entity/declare_info_630b.dart';

class DeclareInfo630bRequestDataMapper
    extends BaseEntityMapper<DeclareInfo630b, DeclareInfo630bRequestData> {
  @override
  DeclareInfo630bRequestData mapToData(DeclareInfo630b entity) {
    return DeclareInfo630bRequestData(
      id: entity.id,
      kyKeKhaiId: entity.periodId,
      phatSinhDieuChinh: entity.adjustment,
      hoTen: entity.fullName,
      maSoBhxh: entity.bhxhNumber,
      soCmnd: entity.cccdNumber,
      maNhanVien: entity.employeeId,
      maNhomHuong: entity.groupCode,
      maNhomHuong2: entity.groupCodeLv2,
      tuNgay: entity.fromDate?.toIso8601String(),
      denNgay: entity.toDate?.toIso8601String(),
      tongSoNgay: entity.totalDays,
      tuNgayDonVi: entity.unitFromDate?.toIso8601String(),
      ngayNghiTuan: entity.dayOff,
      soSeriCT: entity.seriNumber,
      dieuKienKhamThai: entity.antenatalCondition,
      tuoiThai: entity.pregnancyAge,
      bienPhapKhhgd: entity.contraceptiveMethod,
      dieuKienSinhCon: entity.childbirthCondition,
      ngaySinhCon: entity.childDob?.toIso8601String(),
      soCon: entity.childCount,
      maSoBHXHCuaCon: entity.childBhxhNumber,
      theBhytCuaCon: entity.childBhyt,
      soCCHoacThaiCL: entity.childDeathCount,
      ngayConChet: entity.childDeathDate?.toIso8601String(),
      ngayNhanCon: entity.adoptionDate?.toIso8601String(),
      ngayDiLamThucTe: entity.actualWorkDate?.toIso8601String(),
      maSoBHXHCuaMe: entity.motherBhxhNumber,
      theBHYTCuaMe: entity.motherBhyt,
      soCMNDCuaMe: entity.motherCccd,
      phauThuatThai32: entity.surgery32Weeks,
      ngayMeChet: entity.motherDeathDate?.toIso8601String(),
      ngayKetLuan: entity.conclusionDate?.toIso8601String(),
      phiGiamDinhYKhoa: entity.medicalAssessmentFee,
      soBHXHNND: entity.bhxhNND,
      nghiDuongThai: entity.maternityLeave,
      chaNghiChamCon: entity.fatherLeave,
      mangThaiHo: entity.surrogatePregnancy,
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
