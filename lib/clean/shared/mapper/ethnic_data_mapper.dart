import 'package:v_bhxh/clean/shared/model/ethnic_data.dart';
import 'package:v_bhxh/clean/shared/entity/ethnic.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class EthnicDataMapper extends BaseDataMapper<EthnicData, Ethnic> {
  @override
  Ethnic mapToEntity(EthnicData? data) {
    return Ethnic(
      value: data?.value ?? 0,
      text: data?.text ?? '',
    );
  }
}
