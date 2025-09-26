import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/data/repository/declare_info_630a_repository_impl.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/use_case/add_procedure_630a_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/presentation/controller/declare_info_630a_controller.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import '../../domain/repository/declare_info_630a_repository.dart';
import '../../domain/use_case/get_detail_procedure_630a_use_case.dart';
import '../../domain/use_case/update_procedure_630a_use_case.dart';

class DeclareInfo630aBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => DeclareInfo630aController(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<DeclareInfo630aRepository>(
      () => DeclareInfo630aRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    Get.lazyPut<StaffListRepository>(
      () => StaffListRepositoryImpl(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => AddProcedure630aUseCase(sl()));
    Get.lazyPut(() => GetDetailProcedure630aUseCase(sl()));
    Get.lazyPut(() => UpdateProcedure630aUseCase(sl()));
    Get.lazyPut(() => GetStaffDetailUseCase(sl()));
  }
}
