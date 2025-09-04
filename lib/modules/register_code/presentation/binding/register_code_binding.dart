import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';

import '../../../src.dart';
import '../../data/repository/register_code_repository_impl.dart';
import '../../domain/repository/register_code_repository.dart';
import '../../domain/usecase/first_time_register_use_case.dart';
import '../../domain/usecase/get_categories_use_case.dart';
import '../../domain/usecase/get_certificate_use_case.dart';
import '../controller/register_code_controller.dart';

class RegisterCodeBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => RegisterCodeController(
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<RegisterCodeRepository>(
      () => RegisterCodeRepositoryImpl(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => GetCategoriesUseCase(sl()));
    Get.lazyPut(() => GetCertificateUseCase(sl()));
    Get.lazyPut(() => FirstTimeRegisterUseCase(sl()));
  }
}
