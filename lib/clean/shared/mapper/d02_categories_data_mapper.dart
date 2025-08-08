import 'package:v_bhxh/clean/shared/model/d02_categories_data.dart';
import 'package:v_bhxh/clean/shared/entity/d02_categories_cl.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

class D02CategoriesDataMapper
    extends BaseDataMapper<D02CategoriesData, D02CategoriesCl> {
  final DeclarationTypeDataMapper _declarationTypeDataMapper;
  final EthnicDataMapper _ethnicDataMapper;
  final NationDataMapper _nationDataMapper;
  final ProvinceDataMapper _provinceDataMapper;
  final RelationshipDataMapper _relationshipDataMapper;
  final PositionDataMapper _positionDataMapper;
  final BirthTypeDataMapper _birthTypeDataMapper;
  final ReceiveResultDataMapper _receiveResultDataMapper;

  D02CategoriesDataMapper(
    this._declarationTypeDataMapper,
    this._ethnicDataMapper,
    this._nationDataMapper,
    this._provinceDataMapper,
    this._relationshipDataMapper,
    this._positionDataMapper,
    this._birthTypeDataMapper,
    this._receiveResultDataMapper,
  );

  @override
  D02CategoriesCl mapToEntity(D02CategoriesData? data) {
    return D02CategoriesCl(
      declarationTypes:
          _declarationTypeDataMapper.mapToSetEntity(data?.declarationTypes),
      ethnics: _ethnicDataMapper.mapToSetEntity(data?.ethnics),
      nations: _nationDataMapper.mapToSetEntity(data?.nations),
      provinces: _provinceDataMapper.mapToSetEntity(data?.provinces),
      relationships:
          _relationshipDataMapper.mapToSetEntity(data?.relationships),
      positions: _positionDataMapper.mapToSetEntity(data?.positions),
      birthTypes: _birthTypeDataMapper.mapToSetEntity(data?.birthTypes),
      receiveResults:
          _receiveResultDataMapper.mapToSetEntity(data?.receiveResults),
    );
  }
}
