import 'package:v_bhxh/clean/core/data/model/d02_categories_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/d02_categories_cl.dart';
import 'package:v_bhxh/shares/mapper/declaration_type_data_mapper.dart';
import 'base/base_data_mapper.dart';

class D02CategoriesDataMapper
    extends BaseDataMapper<D02CategoriesData, D02CategoriesCl> {
  final DeclarationTypeDataMapper _declarationTypeDataMapper;

  const D02CategoriesDataMapper(this._declarationTypeDataMapper);

  @override
  D02CategoriesCl mapToEntity(D02CategoriesData? data) {
    return D02CategoriesCl(
      declarationTypes:
          _declarationTypeDataMapper.mapToSetEntity(data?.declarationTypes),
    );
  }
}
