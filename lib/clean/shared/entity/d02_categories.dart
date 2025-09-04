import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'entity_src.dart';

class D02Categories implements Entity {
  final Set<DeclarationType> declarationTypes;
  final Set<Ethnic> ethnics;
  final Set<Nation> nations;
  final Set<Province> provinces;
  final Set<Relationship> relationships;
  final Set<Position> positions;
  final Set<BirthType> birthTypes;
  final Set<ReceiveResult> receiveResults;
  final Set<Province> oldProvinces;

  const D02Categories({
    required this.declarationTypes,
    required this.ethnics,
    required this.nations,
    required this.provinces,
    required this.relationships,
    required this.positions,
    required this.birthTypes,
    required this.receiveResults,
    required this.oldProvinces,
  });

  factory D02Categories.empty() {
    return const D02Categories(
      declarationTypes: {},
      ethnics: {},
      nations: {},
      provinces: {},
      relationships: {},
      positions: {},
      birthTypes: {},
      receiveResults: {},
      oldProvinces: {},
    );
  }
}
