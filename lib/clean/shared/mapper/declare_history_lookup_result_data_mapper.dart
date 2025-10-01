import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/step_data_mapper.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/data/model/declare_history_lookup_result_data.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/entity/declare_history_lookup_result.dart';

class DeclareHistoryLookupResultDataMapper extends BaseDataMapper<
    DeclareHistoryLookupResultData, DeclareHistoryLookupResult> {
  final StepDataMapper _stepDataMapper;
  DeclareHistoryLookupResultDataMapper(this._stepDataMapper);
  @override
  DeclareHistoryLookupResult mapToEntity(DeclareHistoryLookupResultData? data) {
    return DeclareHistoryLookupResult(
      step1: _stepDataMapper.mapToEntity(data?.buoc1),
      step2: _stepDataMapper.mapToEntity(data?.buoc2),
      step3: _stepDataMapper.mapToEntity(data?.buoc3),
      step4: _stepDataMapper.mapToEntity(data?.buoc4),
      status: data?.trangThai ?? '',
    );
  }
}
