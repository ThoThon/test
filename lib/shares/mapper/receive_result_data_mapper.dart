import 'package:v_bhxh/clean/core/data/model/receive_result_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/receive_result.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

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
