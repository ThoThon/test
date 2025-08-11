import 'package:v_bhxh/modules/declare/declaration_period/data/model/declaration_period_data.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class DeclarationPeriodDataMapper
    extends BaseDataMapper<DeclarationPeriodData, DeclarationPeriod> {
  @override
  DeclarationPeriod mapToEntity(DeclarationPeriodData? data) {
    return DeclarationPeriod(
      id: data?.id ?? '',
      companyId: data?.companyId ?? '',
      procedureId: data?.procedureId ?? 0,
      fileStatus: DeclarationPeriodStatus.fromInt(data?.status),
      year: data?.year ?? 0,
      month: data?.month ?? 0,
      period: data?.period ?? 0,
      selected: data?.selected ?? false,
      createTime: DateTime.tryParse(data?.createTime ?? ''),
      updateDate: DateTime.tryParse(data?.updateDate ?? ''),
      fileNumber: data?.fileNumber,
      procedureType: ProcedureType.fromInt(data?.procedureId) ??
          ProcedureType.procedure600,
    );
  }
}
