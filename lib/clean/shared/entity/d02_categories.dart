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

  const D02Categories({
    required this.declarationTypes,
    required this.ethnics,
    required this.nations,
    required this.provinces,
    required this.relationships,
    required this.positions,
    required this.birthTypes,
    required this.receiveResults,
  });

  factory D02Categories.fromJson(Map<String, dynamic> json) {
    return D02Categories(
      declarationTypes: (json['loaiKeKhai'] as List?)
              ?.map((e) => DeclarationType.fromJson(e))
              .toSet() ??
          <DeclarationType>{},
      ethnics:
          (json['danTocs'] as List?)?.map((e) => Ethnic.fromJson(e)).toSet() ??
              <Ethnic>{},
      nations:
          (json['quocGias'] as List?)?.map((e) => Nation.fromJson(e)).toSet() ??
              <Nation>{},
      provinces:
          (json['tinhs'] as List?)?.map((e) => Province.fromJson(e)).toSet() ??
              <Province>{},
      relationships: (json['moiQuanHes'] as List?)
              ?.map((e) => Relationship.fromJson(e))
              .toSet() ??
          <Relationship>{},
      positions: (json['dmChucVu'] as List?)
              ?.map((e) => Position.fromJson(e))
              .toSet() ??
          <Position>{},
      birthTypes: (json['chiCoNamSinhs'] as List?)
              ?.map((e) => BirthType.fromJson(e))
              .toSet() ??
          <BirthType>{},
      receiveResults: (json['dangKyNhanSoThes'] as List?)
              ?.map((e) => ReceiveResult.fromJson(e))
              .toSet() ??
          <ReceiveResult>{},
    );
  }

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
    );
  }
}
