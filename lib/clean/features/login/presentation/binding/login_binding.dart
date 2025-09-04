import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/features/login/data/repository/login_repository_impl.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller_cl.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

class LoginBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => LoginControllerCl(
        // Get.arguments,
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(sl(), sl(), sl(), sl(), sl()),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => LoginUseCase(sl()));
    Get.lazyPut(() => SaveAuthInfoUseCase(sl()));
    Get.lazyPut(() => GetAccountInfoUseCase(sl()));
    Get.lazyPut(() => GetD02CategoriesUseCase(sl()));
    Get.lazyPut(() => GetUnreadNotificationCountUseCase(sl()));
    Get.lazyPut(() => GetLastUsernameUseCase(sl()));
    Get.lazyPut(() => SaveCompanyNameUseCase(sl()));
  }
}
