import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';

import 'declaration_type.dart';

class D02CategoriesCl implements Entity {
  final Set<DeclarationType> declarationTypes;

  const D02CategoriesCl({
    required this.declarationTypes,
  });
}
