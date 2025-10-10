import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import '../../../../clean/shared/entity/categories_630/bank.dart';

class DeclareInfo630c implements Entity {
  /// ID bản ghi (nếu có)
  final String? id;

  /// Kỳ kê khai (ID kỳ)
  final String periodId;

  /// Họ và tên
  final String fullName;

  /// Mã số BHXH
  final String bhxhNumber;

  /// Số CCCD
  final String? cccdNumber;

  /// Mã nhân viên
  final String? employeeId;

  /// Hình thức kê khai
  final String adjustment;

  /// Mã nhóm hưởng
  final String groupCode;

  /// Từ ngày
  final DateTime? fromDate;

  /// Đến ngày
  final DateTime? toDate;

  /// Tổng số ngày
  final int? totalDays;

  /// Từ ngày đơn vị
  final DateTime? unitFromDate;

  /// Ngày trở lại làm việc
  final DateTime? returnToWorkDate;

  /// Ngày giám định
  final DateTime? appraisalDate;

  /// Tỷ lệ suy giảm
  final int? rateToDecline;

  /// Số seri
  final String? seriNumber;

  /// Đợt bổ sung
  final String? extraBatch;

  /// Mã hồ sơ
  final String dossierId;

  /// Ghi chú
  final String? note;

  /// Hình thức nhận
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

  DeclareInfo630c({
    this.id,
    required this.periodId,
    required this.adjustment,
    required this.fullName,
    required this.bhxhNumber,
    this.cccdNumber,
    this.employeeId,
    required this.groupCode,
    this.fromDate,
    this.toDate,
    this.totalDays,
    this.unitFromDate,
    this.returnToWorkDate,
    this.appraisalDate,
    this.rateToDecline,
    this.seriNumber,
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
  });
}
