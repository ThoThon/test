import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/modules/forgot_password/data/repository/forgot_password_repository_impl.dart';
import 'package:v_bhxh/modules/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:v_bhxh/modules/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:v_bhxh/modules/forgot_password/presentation/controller/forgot_password_controller_cl.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';

class ForgotPasswordBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => ForgotPasswordControllerCl(
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(sl(), sl()),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => ForgotPasswordUseCase(sl()));
  }
}
