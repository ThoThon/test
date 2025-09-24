import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class GetPreviewPdfRequest extends Equatable implements Entity {
  final String declarationPeriodId;
  final int previewDocumentType;
  final String? documentRecordId;

  const GetPreviewPdfRequest({
    required this.declarationPeriodId,
    required this.previewDocumentType,
    this.documentRecordId,
  });

  @override
  List<Object?> get props => [
        declarationPeriodId,
        previewDocumentType,
        documentRecordId,
      ];
}
