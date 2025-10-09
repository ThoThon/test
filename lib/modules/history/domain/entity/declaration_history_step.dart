import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class DeclarationHistoryStep implements Entity {
  final String result;
  final bool status;

  DeclarationHistoryStep({
    required this.result,
    required this.status,
  });
}
