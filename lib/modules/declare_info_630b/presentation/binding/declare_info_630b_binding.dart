import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

import '../../../selected_staff/data/repository/selected_staff_repository_impl.dart';
import '../../../selected_staff/domain/repository/selected_staff_repository.dart';
import '../../../selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import '../../../src.dart';

class DeclareInfo630bBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => DeclareInfo630bController(
        sl(),
        sl(),
        sl(),
        sl(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<DeclareInfo630bRepository>(
      () => DeclareInfo630bRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );

    Get.lazyPut<SelectStaffRepository>(
      () => SelectStaffRepositoryImpl(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => AddProcedure630bUseCase(sl()));
    Get.lazyPut(() => GetDetailProcedure630bUseCase(sl()));
    Get.lazyPut(() => UpdateProcedure630bUseCase(sl()));
    Get.lazyPut(() => GetStaffDetailUseCase(sl()));
  }
}
