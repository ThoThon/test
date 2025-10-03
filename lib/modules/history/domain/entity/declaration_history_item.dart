import '../../../../clean/core/domain/entity/entity.dart';

class DeclarationHistoryItem implements Entity {
  final String id;
  final String procedureCode;
  final String submissionTime;
  final String? dossierNumber;
  final String month;
  final String year;
  final String status;
  final String? step1ErrorCode;
  final String? step1Result;
  final String? step2ErrorCode;
  final String? step2Result;
  final String? step3ErrorCode;
  final String? step3Result;
  final String? step4ErrorCode;
  final String? step4Result;

  const DeclarationHistoryItem({
    required this.id,
    required this.procedureCode,
    required this.submissionTime,
    this.dossierNumber,
    required this.month,
    required this.year,
    required this.status,
    this.step1ErrorCode,
    this.step1Result,
    this.step2ErrorCode,
    this.step2Result,
    this.step3ErrorCode,
    this.step3Result,
    this.step4ErrorCode,
    this.step4Result,
  });

  DeclarationHistoryItem copyWith({
    String? id,
    String? procedureCode,
    String? submissionTime,
    String? dossierNumber,
    String? month,
    String? year,
    String? status,
    String? step1ErrorCode,
    String? step1Result,
    String? step2ErrorCode,
    String? step2Result,
    String? step3ErrorCode,
    String? step3Result,
    String? step4ErrorCode,
    String? step4Result,
  }) {
    return DeclarationHistoryItem(
      id: id ?? this.id,
      procedureCode: procedureCode ?? this.procedureCode,
      submissionTime: submissionTime ?? this.submissionTime,
      dossierNumber: dossierNumber ?? this.dossierNumber,
      month: month ?? this.month,
      year: year ?? this.year,
      status: status ?? this.status,
      step1ErrorCode: step1ErrorCode ?? this.step1ErrorCode,
      step1Result: step1Result ?? this.step1Result,
      step2ErrorCode: step2ErrorCode ?? this.step2ErrorCode,
      step2Result: step2Result ?? this.step2Result,
      step3ErrorCode: step3ErrorCode ?? this.step3ErrorCode,
      step3Result: step3Result ?? this.step3Result,
      step4ErrorCode: step4ErrorCode ?? this.step4ErrorCode,
      step4Result: step4Result ?? this.step4Result,
    );
  }
}
