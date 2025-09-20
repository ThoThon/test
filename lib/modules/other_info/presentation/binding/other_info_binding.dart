import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';
import 'package:v_bhxh/modules/other_info/data/repository/other_info_repository_impl.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';
import 'package:v_bhxh/modules/other_info/presentation/controller/other_info_controller.dart';

import '../../domain/use_case/use_case_src.dart';

class OtherInfoBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => OtherInfoController(
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
    Get.lazyPut<OtherInfoRepository>(
      () => OtherInfoRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => AddOtherInfoUseCase(sl()));
    Get.lazyPut(() => GetDetailOtherInfoUseCase(sl()));
    Get.lazyPut(() => UpdateOtherInfoUseCase(sl()));
    Get.lazyPut(() => SaveXmlResult630aUseCase(sl()));
    Get.lazyPut(() => SaveXmlResult630bUseCase(sl()));
    Get.lazyPut(() => SaveXmlResult630cUseCase(sl()));
  }
}
