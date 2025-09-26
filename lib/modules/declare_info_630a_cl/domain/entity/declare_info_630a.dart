import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import '../../../../clean/shared/entity/categories_630/categories_630_src.dart';

class DeclareInfo630a implements Entity {
  final String? id;
  final String periodId;
  final String adjustment;
  final String fullName;
  final String bhxhNumber;
  final String cccdNumber;
  final String employeeId;
  final String groupCode;
  final String seriNumber;
  final String fromDate;
  final String toDate;
  final int totalDays;
  final String unitFromDate;
  final String dayOff;
  final String hospitalLevel;
  final String childDob;
  final String childBhyt;
  final int childCount;
  final String chronicCode;
  final String diseaseName;
  final String workCondition;
  final bool maternityLeave;
  final String extraBatch;
  final String dossierId;
  final String receiveType;
  final String bankAccount;
  final String accountName;
  final Bank? bank;
  final String note;
  final String resolvedBatch;
  final String prevApproveDate;
  final String adjustReason;

  DeclareInfo630a({
    this.id,
    required this.periodId,
    required this.adjustment,
    required this.fullName,
    required this.bhxhNumber,
    required this.cccdNumber,
    required this.employeeId,
    required this.groupCode,
    required this.seriNumber,
    required this.fromDate,
    required this.toDate,
    required this.totalDays,
    required this.unitFromDate,
    required this.dayOff,
    required this.hospitalLevel,
    required this.childDob,
    required this.childBhyt,
    required this.childCount,
    required this.chronicCode,
    required this.diseaseName,
    required this.workCondition,
    required this.maternityLeave,
    required this.extraBatch,
    required this.dossierId,
    required this.receiveType,
    required this.bankAccount,
    required this.accountName,
    this.bank,
    required this.note,
    required this.resolvedBatch,
    required this.prevApproveDate,
    required this.adjustReason,
  });
}
