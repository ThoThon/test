import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/clean/shared/mapper/categories_630/benefit_group_lv2_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/model/categories_630/categories_630_src.dart';

class BenefitGroup630DataMapper
    extends BaseDataMapper<BenefitGroup630Data, BenefitGroup630> {
  final BenefitGroupLv2DataMapper _benefitGroupLv2DataMapper;

  BenefitGroup630DataMapper(this._benefitGroupLv2DataMapper);
  @override
  BenefitGroup630 mapToEntity(BenefitGroup630Data? data) {
    return BenefitGroup630(
      value: data?.value ?? '',
      text: data?.text ?? '',
      benefitGroupLv2: data?.benefitGroupLv2
              ?.map((plan) => _benefitGroupLv2DataMapper.mapToEntity(plan))
              .toSet() ??
          <BenefitGroupLv2>{},
    );
  }
}
