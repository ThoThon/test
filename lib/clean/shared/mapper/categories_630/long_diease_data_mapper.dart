import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/model/categories_630/categories_630_src.dart';

class LongDieaseDataMapper extends BaseDataMapper<LongDieaseData, LongDiease> {
  @override
  LongDiease mapToEntity(LongDieaseData? data) {
    return LongDiease(
      id: data?.id ?? '',
      name: data?.name ?? '',
      code: data?.code ?? '',
    );
  }
}
