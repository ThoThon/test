import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../entity/category.dart';
import '../model/category_data.dart';

class CategoryDataMapper extends BaseDataMapper<CategoryData, Category> {
  @override
  Category mapToEntity(CategoryData? data) {
    return Category(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }

  MapCategory toMapByValue(Iterable<CategoryData>? data) {
    final result = MapCategory();
    if (data == null) return result;
    for (final item in data) {
      final entity = mapToEntity(item);
      final key = entity.value;
      if (key.isNotEmpty) {
        result[key] = entity;
      }
    }
    return result;
  }
}
