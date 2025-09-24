import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/selected_staff/data/repository/selected_staff_repository_impl.dart';
import 'package:v_bhxh/modules/selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import 'package:v_bhxh/modules/selected_staff/domain/use_case/get_staff_list_selected_use_case.dart';
import 'package:v_bhxh/modules/selected_staff/presentation/controller/selected_staff_controller.dart';

import '../../../src.dart';
import '../../domain/repository/selected_staff_repository.dart';

class SelectStaffBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => SelectStaffController(
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
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
    Get.lazyPut(
      () => GetStaffListSelectUseCase(
        sl(),
      ),
    );
    Get.lazyPut(
      () => GetStaffDetailUseCase(sl()),
    );
  }
}
