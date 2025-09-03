import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../entity/category.dart';
import '../model/category_data.dart';

class CategoriesDataMapper extends BaseDataMapper<CategoryData, Category> {
  @override
  Category mapToEntity(CategoryData? data) {
    return Category(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
