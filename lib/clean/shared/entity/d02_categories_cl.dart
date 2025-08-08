import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

class D02CategoriesCl implements Entity {
  final Set<DeclarationType> declarationTypes;
  final Set<Ethnic> ethnics;
  final Set<Nation> nations;
  final Set<Province> provinces;
  final Set<Relationship> relationships;
  final Set<Position> positions;
  final Set<BirthType> birthTypes;
  final Set<ReceiveResult> receiveResults;

  const D02CategoriesCl({
    required this.declarationTypes,
    required this.ethnics,
    required this.nations,
    required this.provinces,
    required this.relationships,
    required this.positions,
    required this.birthTypes,
    required this.receiveResults,
  });

  factory D02CategoriesCl.empty() {
    return const D02CategoriesCl(
      declarationTypes: {},
      ethnics: {},
      nations: {},
      provinces: {},
      relationships: {},
      positions: {},
      birthTypes: {},
      receiveResults: {},
    );
  }
}
