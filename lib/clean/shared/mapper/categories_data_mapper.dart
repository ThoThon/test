import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_code/clean/data/model/categories_data.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/categories.dart';

class CategoriesDataMapper extends BaseDataMapper<CategoriesData, Categories> {
  @override
  Categories mapToEntity(CategoriesData? data) {
    return Categories(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
