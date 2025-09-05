import 'package:v_bhxh/clean/shared/mapper/categories_630/bank_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/categories_630/benefit_group_630_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/categories_630/long_diease_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/category_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../entity/categories_630/categories_630.dart';
import '../../model/categories_630/categories_630_data.dart';

class Categories630DataMapper
    extends BaseDataMapper<Categories630Data, Categories630> {
  final CategoryDataMapper _categoryDataMapper;
  final BenefitGroup630DataMapper _benefitGroup630DataMapper;
  final BankDataMapper _bankDataMapper;
  final LongDieaseDataMapper _longDieaseDataMapper;

  Categories630DataMapper(
    this._categoryDataMapper,
    this._benefitGroup630DataMapper,
    this._bankDataMapper,
    this._longDieaseDataMapper,
  );

  @override
  Categories630 mapToEntity(Categories630Data? data) {
    return Categories630(
      declareForm: _categoryDataMapper.toMapByValue(data?.declareForm),
      benefitGroup630a:
          _benefitGroup630DataMapper.mapToSetEntity(data?.benefitGroup630a),
      hospitalLine: _categoryDataMapper.mapToSetEntity(data?.hospitalLine),
      longDiease: _longDieaseDataMapper.mapToSetEntity(data?.longDiease),
      workCondition: _categoryDataMapper.mapToSetEntity(data?.workCondition),
      receiveForm: _categoryDataMapper.mapToSetEntity(data?.receiveForm),
      bank: _bankDataMapper.mapToSetEntity(data?.bank),
      benefitGroup630b:
          _benefitGroup630DataMapper.mapToSetEntity(data?.benefitGroup630b),
      pregnancyCondition:
          _categoryDataMapper.mapToSetEntity(data?.pregnancyCondition),
      childBirthCondition:
          _categoryDataMapper.mapToSetEntity(data?.childBirthCondition),
      maternityLeave: _categoryDataMapper.mapToSetEntity(data?.maternityLeave),
      parentalLeave: _categoryDataMapper.mapToSetEntity(data?.parentalLeave),
      surrogacy: _categoryDataMapper.mapToSetEntity(data?.surrogacy),
      surgeryPregnancy32w:
          _categoryDataMapper.mapToSetEntity(data?.surgeryPregnancy32w),
      contraception: _categoryDataMapper.mapToSetEntity(data?.contraception),
      benefitGroup630c:
          _benefitGroup630DataMapper.mapToSetEntity(data?.benefitGroup630c),
    );
  }
}
