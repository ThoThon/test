import 'package:v_bhxh/clean/shared/mapper/categories_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/register_code_categories.dart';

import '../../../modules/register_code/clean/data/model/register_code_categories_data.dart';

class RegisterCodeCategoriesDataMapper
    extends BaseDataMapper<RegisterCodeCategoriesData, RegisterCodeCategories> {
  final ProvinceDataMapper _provinceDataMapper;
  final CategoriesDataMapper _categoriesDataMapper;
  RegisterCodeCategoriesDataMapper(
    this._provinceDataMapper,
    this._categoriesDataMapper,
  );

  @override
  RegisterCodeCategories mapToEntity(RegisterCodeCategoriesData? data) {
    return RegisterCodeCategories(
      provinces: _provinceDataMapper.mapToSetEntity(data?.provinces),
      agencies: _categoriesDataMapper.mapToSetEntity(data?.agencies),
      receiveMethods: _categoriesDataMapper.mapToSetEntity(data?.receiveMethods),
      paymentMethods: _categoriesDataMapper.mapToSetEntity(data?.paymentMethods),
      resultReceivingOptions:
          _categoriesDataMapper.mapToSetEntity(data?.resultReceivingOptions),
      objectType: _categoriesDataMapper.mapToSetEntity(data?.objectType),
    );
  }
}
