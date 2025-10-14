import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import '../../../../clean/shared/entity/categories_630/categories_630_src.dart';

/// Thông tin tờ khai 630b - Chế độ thai sản
class DeclareInfo630b implements Entity {
  /// ID bản ghi (nếu có)
  final String? id;

  /// Kỳ kê khai (ID kỳ)
  final String periodId;

  /// Hình thức kê khai
  final String adjustment;

  /// Họ và tên
  final String fullName;

  /// Mã số BHXH
  final String bhxhNumber;

  /// Số CCCD
  final String? cccdNumber;

  /// Mã nhân viên
  final String? employeeId;

  /// Mã nhóm hưởng
  final String groupCode;

  /// Mã nhóm hưởng cấp 2
  final String? groupCodeLv2;

  /// Từ ngày
  final DateTime? fromDate;

  /// Đến ngày
  final DateTime? toDate;

  /// Tổng số ngày
  final double? totalDays;

  /// Từ ngày đơn vị
  final DateTime? unitFromDate;

  /// Đến ngày đơn vị
  final DateTime? unitToDate;

  /// Ngày nghỉ hàng tuần
  final String? dayOff;

  /// Số seri
  final String? seriNumber;

  /// Điều kiện khám thai
  final String? antenatalCondition;

  /// Tuổi thai
  final int? pregnancyAge;

  /// Biện pháp tránh thai
  final String? contraceptiveMethod;

  /// Điều kiện sinh con
  final String? childbirthCondition;

  /// Ngày sinh con
  final DateTime? childDob;

  /// Số con
  final int? childCount;

  /// Mã số BHXH của con
  final String? childBhxhNumber;

  /// Mã thẻ BHYT của con
  final String? childBhyt;

  /// Số con chết
  final int? childDeathCount;

  /// Ngày con chết
  final DateTime? childDeathDate;

  /// Ngày nhận con
  final DateTime? adoptionDate;

  /// Ngày đi làm thực tế
  final DateTime? actualWorkDate;

  /// Mã số BHXH của mẹ
  final String? motherBhxhNumber;

  /// Mã thẻ BHYT của mẹ
  final String? motherBhyt;

  /// Số CMND/CCCD của mẹ
  final String? motherCccd;

  /// Phẫu thuật khi thai ≥ 32 tuần
  final String? surgery32Weeks;

  /// Ngày mẹ chết
  final DateTime? motherDeathDate;

  /// Ngày kết luận
  final DateTime? conclusionDate;

  /// Phí giám định y khoa
  final int? medicalAssessmentFee;

  /// Số BHXH người nhận nuôi dưỡng (nếu có)
  final String? bhxhNND;

  /// Nghỉ dưỡng thai
  final String? maternityLeave;

  /// Cha nghỉ chăm con
  final String? fatherLeave;

  /// Mang thai hộ
  final String? surrogatePregnancy;

  /// Đợt bổ sung
  final String? extraBatch;

  /// Mã hồ sơ
  final String dossierId;

  /// Ghi chú
  final String? note;

  /// Hình thức nhận (chuyển khoản, tiền mặt...)
  final String receiveType;

  /// Số tài khoản nhận tiền
  final String? bankAccount;

  /// Tên chủ tài khoản
  final String? accountName;

  /// Thông tin ngân hàng (object Bank)
  final Bank? bank;

  /// Đợt đã giải quyết (nếu có)
  final String? resolvedBatch;

  /// Lý do điều chỉnh
  final String? adjustReason;

  /// Từ ngày duyệt trước
  final DateTime? prevApproveDate;

  DeclareInfo630b({
    this.id,
    required this.periodId,
    required this.adjustment,
    required this.fullName,
    required this.bhxhNumber,
    this.cccdNumber,
    this.employeeId,
    required this.groupCode,
    this.groupCodeLv2,
    this.fromDate,
    this.toDate,
    this.totalDays,
    this.unitFromDate,
    this.unitToDate,
    this.dayOff,
    this.seriNumber,
    this.childDob,
    this.childCount,
    this.childDeathCount,
    this.antenatalCondition,
    this.childbirthCondition,
    this.maternityLeave,
    this.fatherLeave,
    this.contraceptiveMethod,
    this.adoptionDate,
    this.actualWorkDate,
    this.childDeathDate,
    this.motherDeathDate,
    this.surrogatePregnancy,
    this.conclusionDate,
    this.childBhxhNumber,
    this.childBhyt,
    this.motherBhxhNumber,
    this.motherBhyt,
    this.motherCccd,
    this.medicalAssessmentFee,
    this.bhxhNND,
    this.surgery32Weeks,
    this.extraBatch,
    required this.dossierId,
    this.note,
    required this.receiveType,
    this.bankAccount,
    this.accountName,
    this.bank,
    this.resolvedBatch,
    this.adjustReason,
    this.prevApproveDate,
    this.pregnancyAge,
  });
}
