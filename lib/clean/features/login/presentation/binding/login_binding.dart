import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/features/login/data/repository/login_repository_impl.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/login_use_case.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller.dart';

class LoginBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => LoginController(Get.find()));
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find()));
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => LoginUseCase(Get.find()));
  }
}
