import 'package:v_bhxh/clean/core/data/model/nation_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/nation.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class NationDataMapper extends BaseDataMapper<NationData, Nation> {
  @override
  Nation mapToEntity(NationData? data) {
    return Nation(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
