import 'package:v_bhxh/clean/core/data/model/declaration_type_data.dart';

class D02CategoriesData {
  final Set<DeclarationTypeData>? declarationTypes;

  const D02CategoriesData({
    this.declarationTypes,
  });

  factory D02CategoriesData.fromJson(Map<String, dynamic> json) {
    return D02CategoriesData(
      declarationTypes: (json['loaiKeKhai'] as List<dynamic>?)
          ?.map((e) => DeclarationTypeData.fromJson(e))
          .toSet(),
    );
  }
}
