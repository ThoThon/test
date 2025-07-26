import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/features/login/data/repository/login_repository_impl.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/get_account_info_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/get_d02_categories_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/login_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/save_auth_info_use_case.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller_cl.dart';

class LoginBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => LoginControllerCl(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => SaveAuthInfoUseCase(Get.find()));
    Get.lazyPut(() => GetAccountInfoUseCase(Get.find()));
    Get.lazyPut(() => GetD02CategoriesUseCase(Get.find()));
  }
}
