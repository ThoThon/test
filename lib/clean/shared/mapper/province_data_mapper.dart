import 'package:v_bhxh/clean/shared/model/province_data.dart';
import 'package:v_bhxh/clean/shared/entity/province.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class ProvinceDataMapper extends BaseDataMapper<ProvinceData, Province> {
  @override
  Province mapToEntity(ProvinceData? data) {
    return Province(
      id: data?.id ?? '',
      name: data?.name ?? '',
      code: data?.code ?? '',
    );
  }
}
