import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class OtherInfo implements Entity {
  final String id;
  final String periodId;
  final String approvalRound;
  final String phoneNumber;
  final String bankAccount;
  final String bankName;
  final String branchName;
  final String unitHead;
  final String lateSubmissionReason;
  final bool attachedPaperDocuments;

  OtherInfo({
    required this.id,
    required this.periodId,
    required this.approvalRound,
    required this.phoneNumber,
    required this.bankAccount,
    required this.bankName,
    required this.branchName,
    required this.unitHead,
    required this.lateSubmissionReason,
    required this.attachedPaperDocuments,
  });
}
