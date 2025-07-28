import 'package:v_bhxh/clean/core/data/model/birth_type_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/birth_type.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class BirthTypeDataMapper extends BaseDataMapper<BirthTypeData, BirthType> {
  @override
  BirthType mapToEntity(BirthTypeData? data) {
    return BirthType(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
