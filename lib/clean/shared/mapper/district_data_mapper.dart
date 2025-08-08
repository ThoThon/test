import 'package:v_bhxh/clean/shared/model/district_data.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class DistrictDataMapper extends BaseDataMapper<DistrictData, District> {
  @override
  District mapToEntity(DistrictData? data) {
    return District(
      id: data?.id ?? '',
      provinceId: data?.provinceId ?? '',
      name: data?.name ?? '',
    );
  }
}
