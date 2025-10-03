import '../../../../clean/core/domain/entity/entity.dart';

class RegisterHistoryItem implements Entity {
  final String id;
  final String declaration;
  final String submissionTime;
  final String? step1Result;
  final String? step2Result;
  final String? step3Result;
  final String status;
  final String? dossierNumber;
  final String? receiver;
  final int year;
  final int month;
  final bool? step1Status;
  final bool? step2Status;
  final bool? step3Status;

  const RegisterHistoryItem({
    required this.id,
    required this.declaration,
    required this.submissionTime,
    this.step1Result,
    this.step2Result,
    this.step3Result,
    required this.status,
    this.dossierNumber,
    this.receiver,
    required this.year,
    required this.month,
    this.step1Status,
    this.step2Status,
    this.step3Status,
  });

  RegisterHistoryItem copyWith({
    String? id,
    String? declaration,
    String? submissionTime,
    String? step1Result,
    String? step2Result,
    String? step3Result,
    String? status,
    String? dossierNumber,
    String? receiver,
    int? year,
    int? month,
    bool? step1Status,
    bool? step2Status,
    bool? step3Status,
  }) {
    return RegisterHistoryItem(
      id: id ?? this.id,
      declaration: declaration ?? this.declaration,
      submissionTime: submissionTime ?? this.submissionTime,
      step1Result: step1Result ?? this.step1Result,
      step2Result: step2Result ?? this.step2Result,
      step3Result: step3Result ?? this.step3Result,
      status: status ?? this.status,
      dossierNumber: dossierNumber ?? this.dossierNumber,
      receiver: receiver ?? this.receiver,
      year: year ?? this.year,
      month: month ?? this.month,
      step1Status: step1Status ?? this.step1Status,
      step2Status: step2Status ?? this.step2Status,
      step3Status: step3Status ?? this.step3Status,
    );
  }
}
