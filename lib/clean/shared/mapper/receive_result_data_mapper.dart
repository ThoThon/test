import 'package:v_bhxh/clean/shared/model/receive_result_data.dart';
import 'package:v_bhxh/clean/shared/entity/receive_result.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class ReceiveResultDataMapper
    extends BaseDataMapper<ReceiveResultData, ReceiveResult> {
  @override
  ReceiveResult mapToEntity(ReceiveResultData? data) {
    return ReceiveResult(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
