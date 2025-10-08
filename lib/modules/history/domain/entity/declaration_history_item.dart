import '../../../../clean/core/domain/entity/entity.dart';
import 'declaration_history_step.dart';

class DeclarationHistoryItem implements Entity {
  final String id;
  final String procedureCode;
  final String submissionTime;
  final String? dossierNumber;
  final String month;
  final String year;
  final String status;
  final List<DeclarationHistoryStep>? steps;

  const DeclarationHistoryItem({
    required this.id,
    required this.procedureCode,
    required this.submissionTime,
    this.dossierNumber,
    required this.month,
    required this.year,
    required this.status,
    this.steps,
  });

  DeclarationHistoryItem copyWith({
    String? id,
    String? procedureCode,
    String? submissionTime,
    String? dossierNumber,
    String? month,
    String? year,
    String? status,
    List<DeclarationHistoryStep>? steps,
  }) {
    return DeclarationHistoryItem(
      id: id ?? this.id,
      procedureCode: procedureCode ?? this.procedureCode,
      submissionTime: submissionTime ?? this.submissionTime,
      dossierNumber: dossierNumber ?? this.dossierNumber,
      month: month ?? this.month,
      year: year ?? this.year,
      status: status ?? this.status,
      steps: steps ?? this.steps,
    );
  }
}
