import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/declare/procedure_list/data/repository/procedure_list_repository_impl.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/repository/procedure_list_repository.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/presentation/controller/procedure_list_controller.dart';

class ProcedureListBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => ProcedureListController(sl()),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<ProcedureListRepository>(
      () => ProcedureListRepositoryImpl(sl(), sl()),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(
      () => GetProceduresUseCase(sl()),
    );
  }
}
