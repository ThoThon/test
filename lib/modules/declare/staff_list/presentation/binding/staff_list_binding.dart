import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/repository/staff_list_repository_impl.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_630_repository.dart';
import 'package:v_bhxh/modules/declare/staff_list/presentation/controller/staff_list_controller.dart';

import '../../data/repository/staff_list_607_repository_impl.dart';
import '../../data/repository/staff_list_630_repository_impl.dart';
import '../../domain/repository/staff_list_607_repository.dart';
import '../../domain/repository/staff_list_repository.dart';
import '../../domain/use_case/use_case_src.dart';

class StaffListBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => StaffListController(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          argument: Get.arguments,
        ));
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<StaffListRepository>(
      () => StaffListRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    Get.lazyPut<StaffList607Repository>(
      () => StaffList607RepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    Get.lazyPut<StaffList630Repository>(
      () => StaffList630RepositoryImpl(
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => Delete630aUseCase(sl()));
    Get.lazyPut(() => Delete630bUseCase(sl()));
    Get.lazyPut(() => Delete630cUseCase(sl()));
    Get.lazyPut(() => DeleteAttachImageUseCase(sl()));
    Get.lazyPut(() => DeleteStaff600UseCase(sl()));
    Get.lazyPut(() => DeleteTk01UseCase(sl()));
    Get.lazyPut(() => GetStaffList600UseCase(sl()));
    Get.lazyPut(() => GetStaffList607UseCase(sl()));
    Get.lazyPut(() => GetStaffList630aUseCase(sl()));
    Get.lazyPut(() => GetStaffList630bUseCase(sl()));
    Get.lazyPut(() => GetStaffList630cUseCase(sl()));
    Get.lazyPut(() => SaveXmlResult600UseCase(sl()));
    Get.lazyPut(() => SaveXmlResult607UseCase(sl()));
    Get.lazyPut(() => UploadAttachImageUseCase(sl()));
  }
}
