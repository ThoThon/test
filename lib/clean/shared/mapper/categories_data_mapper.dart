import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/register_code/data/model/categories_data.dart';
import '../../../modules/register_code/domain/entity/categories.dart';

class CategoriesDataMapper extends BaseDataMapper<CategoryData, Categories> {
  @override
  Categories mapToEntity(CategoryData? data) {
    return Categories(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
