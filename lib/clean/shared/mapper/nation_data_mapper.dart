import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/model/nation_data.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class NationDataMapper extends BaseDataMapper<NationData, Nation> {
  @override
  Nation mapToEntity(NationData? data) {
    return Nation(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
