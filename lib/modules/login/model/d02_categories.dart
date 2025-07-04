import 'model_src.dart';

class D02Categories {
  final Set<DeclarationTypeModel> declarationTypes;
  final Set<EthnicModel> ethnics;
  final Set<NationModel> nations;
  final Set<ProvinceModel> provinces;
  final Set<RelationshipModel> relationships;
  final Set<PositionModel> positions;
  final Set<BirthTypeModel> birthTypes;
  final Set<ReceiveResultModel> receiveResults;

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
              ?.map((e) => DeclarationTypeModel.fromJson(e))
              .toSet() ??
          <DeclarationTypeModel>{},
      ethnics: (json['danTocs'] as List?)
              ?.map((e) => EthnicModel.fromJson(e))
              .toSet() ??
          <EthnicModel>{},
      nations: (json['quocGias'] as List?)
              ?.map((e) => NationModel.fromJson(e))
              .toSet() ??
          <NationModel>{},
      provinces: (json['tinhs'] as List?)
              ?.map((e) => ProvinceModel.fromJson(e))
              .toSet() ??
          <ProvinceModel>{},
      relationships: (json['moiQuanHes'] as List?)
              ?.map((e) => RelationshipModel.fromJson(e))
              .toSet() ??
          <RelationshipModel>{},
      positions: (json['dmChucVu'] as List?)
              ?.map((e) => PositionModel.fromJson(e))
              .toSet() ??
          <PositionModel>{},
      birthTypes: (json['chiCoNamSinhs'] as List?)
              ?.map((e) => BirthTypeModel.fromJson(e))
              .toSet() ??
          <BirthTypeModel>{},
      receiveResults: (json['dangKyNhanSoThes'] as List?)
              ?.map((e) => ReceiveResultModel.fromJson(e))
              .toSet() ??
          <ReceiveResultModel>{},
    );
  }
}
