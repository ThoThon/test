import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/procedure.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/repository/procedure_list_repository.dart';

class GetProceduresUseCase extends NoInputUseCase<List<Procedure>> {
  final ProcedureListRepository _procedureListRepository;

  GetProceduresUseCase(this._procedureListRepository);

  @override
  Future<List<Procedure>> execute() {
    return _procedureListRepository.getProcedures();
  }
}
