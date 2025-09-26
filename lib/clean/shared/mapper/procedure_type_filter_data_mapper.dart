import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/procedure_type_filter_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/procedure_type_filter.dart';

class ProcedureTypeFilterDataMapper
    extends BaseDataMapper<ProcedureTypeFilterData, ProcedureTypeFilter> {
  @override
  ProcedureTypeFilter mapToEntity(ProcedureTypeFilterData? data) {
    return ProcedureTypeFilter(
      ten: data?.ten ?? '',
      tenCha: data?.tenCha ?? '',
      loai: data?.loai.toString() ?? '',
      ma: data?.ma ?? '',
      ghiChu: data?.ghiChu ?? '',
    );
  }
}
