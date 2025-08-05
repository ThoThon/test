import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/data/repository/ward_repository_impl.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/ward_repository.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/presentation/controller/select_ward_controller.dart';

class SelectWardBinding extends BaseBindingsFactory {
  @override
  void bindingsFactoryController() {
    Get.lazyPutFactory(
      () => SelectWardControllerCl(
        slF(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsFactoryRepository() {
    Get.lazyPutFactory<WardRepository>(
      () => WardRepositoryImpl(sl(), sl()),
    );
  }

  @override
  void bindingsFactoryUseCase() {
    Get.lazyPutFactory(
      () => GetWardsUseCase(slF()),
    );
  }
}
