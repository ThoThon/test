import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/model/birth_type_data.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class BirthTypeDataMapper extends BaseDataMapper<BirthTypeData, BirthType> {
  @override
  BirthType mapToEntity(BirthTypeData? data) {
    return BirthType(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
