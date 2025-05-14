import 'model_src.dart';

class DeclarationPeriodModel {
  final int id;
  final String title;
  final DateTime updateDate;
  final String? fileNumber;
  final DeclarationStatus status;
  final DeclarationTypeEnum type;

  const DeclarationPeriodModel({
    required this.id,
    required this.title,
    required this.updateDate,
    this.fileNumber,
    required this.status,
    required this.type,
  });
}
