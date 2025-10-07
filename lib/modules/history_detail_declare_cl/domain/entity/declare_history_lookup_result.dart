import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'step.dart';

class DeclareHistoryLookupResult implements Entity {
  final Step? step1;
  final Step? step2;
  final Step? step3;
  final Step? step4;
  final String status;

  DeclareHistoryLookupResult({
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    required this.status,
  });

  
}
