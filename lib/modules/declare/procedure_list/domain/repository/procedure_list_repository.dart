import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';

abstract class ProcedureListRepository extends BaseRepositoryCl {
  Future<List<Procedure>> getProcedures();
}
