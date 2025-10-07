import '../../../../clean/core/domain/entity/entity.dart';

class DeclarationHistoryItem implements Entity {
  final String id;
  final String procedureCode;
  final String submissionTime;
  final String? dossierNumber;
  final String month;
  final String year;
  final String status;
  final bool? step1Status;
  final String? step1Result;
  final bool? step2Status;
  final String? step2Result;
  final bool? step3Status;
  final String? step3Result;
  final bool? step4Status;
  final String? step4Result;

  const DeclarationHistoryItem({
    required this.id,
    required this.procedureCode,
    required this.submissionTime,
    this.dossierNumber,
    required this.month,
    required this.year,
    required this.status,
    this.step1Status,
    this.step1Result,
    this.step2Status,
    this.step2Result,
    this.step3Status,
    this.step3Result,
    this.step4Status,
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
    bool? step1Status,
    String? step1Result,
    bool? step2Status,
    String? step2Result,
    bool? step3Status,
    String? step3Result,
    bool? step4Status,
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
      step1Status: step1Status ?? this.step1Status,
      step1Result: step1Result ?? this.step1Result,
      step2Status: step2Status ?? this.step2Status,
      step2Result: step2Result ?? this.step2Result,
      step3Status: step3Status ?? this.step3Status,
      step3Result: step3Result ?? this.step3Result,
      step4Status: step4Status ?? this.step4Status,
      step4Result: step4Result ?? this.step4Result,
    );
  }
}
