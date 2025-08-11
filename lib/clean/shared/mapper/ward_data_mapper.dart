import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/model/ward_data.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class WardDataMapper extends BaseDataMapper<WardData, Ward> {
  @override
  Ward mapToEntity(WardData? data) {
    return Ward(
      id: data?.id ?? '',
      provinceId: data?.provinceId ?? '',
      districtId: data?.districtId ?? '',
      name: data?.name ?? '',
    );
  }
}
