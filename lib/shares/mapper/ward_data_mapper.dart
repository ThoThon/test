import 'package:v_bhxh/clean/core/data/model/ward_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/ward.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

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
