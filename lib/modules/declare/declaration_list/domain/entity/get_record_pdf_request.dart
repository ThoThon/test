import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class GetRecordPdfRequest extends Equatable implements Entity {
  final String id;
  final String? staffId;

  const GetRecordPdfRequest({
    required this.id,
    this.staffId,
  });

  @override
  List<Object?> get props => [
        id,
        staffId,
      ];
}
