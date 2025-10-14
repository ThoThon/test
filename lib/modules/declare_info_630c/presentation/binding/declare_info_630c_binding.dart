import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';

import '../../../selected_staff/data/repository/selected_staff_repository_impl.dart';
import '../../../selected_staff/domain/repository/selected_staff_repository.dart';
import '../../../selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import '../../../src.dart';
import '../../declare_info_630c_src.dart';

class DeclareInfo630cBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => DeclareInfo630cController(
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
    Get.lazyPut<DeclareInfo630cRepository>(
      () => DeclareInfo630cRepositoryImpl(
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
    Get.lazyPut(() => AddProcedure630cUseCase(sl()));
    Get.lazyPut(() => GetDetailProcedure630cUseCase(sl()));
    Get.lazyPut(() => UpdateProcedure630cUseCase(sl()));
    Get.lazyPut(() => GetStaffDetailUseCase(sl()));
  }
}
