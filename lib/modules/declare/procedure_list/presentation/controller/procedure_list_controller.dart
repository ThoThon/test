import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/usecase/use_case_src.dart';

class ProcedureListController extends BaseGetClController {
  final GetProceduresUseCase _getProceduresUseCase;

  final procedures = <Procedure>[].obs;

  ProcedureListController(
    this._getProceduresUseCase,
  );

  @override
  void onReady() {
    super.onReady();
    _getProcedures();
  }

  Future<void> _getProcedures() {
    return buildState(
      showLoading: true,
      action: () async {
        procedures.value = await _getProceduresUseCase.execute();
      },
    );
  }
}
