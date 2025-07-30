import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/declare/procedure_list/data/model/procedure_data.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/procedure.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class ProcedureDataMapper extends BaseDataMapper<ProcedureData, Procedure> {
  @override
  Procedure mapToEntity(ProcedureData? data) {
    return Procedure(
      name: data?.name ?? '',
      parentName: data?.parentName ?? '',
      code: data?.code ?? '',
      note: data?.note ?? '',
      type: ProcedureType.fromInt(data?.type) ?? ProcedureType.procedure600,
    );
  }
}
