import 'package:v_bhxh/clean/shared/model/model_src.dart';

class D02CategoriesData {
  final Set<DeclarationTypeData>? declarationTypes;
  final Set<EthnicData>? ethnics;
  final Set<NationData>? nations;
  final Set<ProvinceData>? provinces;
  final Set<RelationshipData>? relationships;
  final Set<PositionData>? positions;
  final Set<BirthTypeData>? birthTypes;
  final Set<ReceiveResultData>? receiveResults;

  const D02CategoriesData({
    this.declarationTypes,
    this.ethnics,
    this.nations,
    this.provinces,
    this.relationships,
    this.positions,
    this.birthTypes,
    this.receiveResults,
  });

  factory D02CategoriesData.fromJson(Map<String, dynamic> json) {
    return D02CategoriesData(
      declarationTypes: (json['loaiKeKhai'] as List<dynamic>?)
          ?.map((e) => DeclarationTypeData.fromJson(e))
          .toSet(),
      ethnics: (json['danTocs'] as List<dynamic>?)
          ?.map((e) => EthnicData.fromJson(e))
          .toSet(),
      nations: (json['quocGias'] as List<dynamic>?)
          ?.map((e) => NationData.fromJson(e))
          .toSet(),
      provinces: (json['tinhs'] as List<dynamic>?)
          ?.map((e) => ProvinceData.fromJson(e))
          .toSet(),
      relationships: (json['moiQuanHes'] as List<dynamic>?)
          ?.map((e) => RelationshipData.fromJson(e))
          .toSet(),
      positions: (json['dmChucVu'] as List<dynamic>?)
          ?.map((e) => PositionData.fromJson(e))
          .toSet(),
      birthTypes: (json['chiCoNamSinhs'] as List<dynamic>?)
          ?.map((e) => BirthTypeData.fromJson(e))
          .toSet(),
      receiveResults: (json['dangKyNhanSoThes'] as List<dynamic>?)
          ?.map((e) => ReceiveResultData.fromJson(e))
          .toSet(),
    );
  }
}
