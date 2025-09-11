import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

import '../../../src.dart';

class RegisterServiceBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => RegisterServiceController(
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
    Get.lazyPut<RegisterServiceRepository>(
      () => RegisterServiceRepositoryImpl(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => GetListCertificationUseCase(sl()));
    Get.lazyPut(() => GetTransactionInfoUseCase(sl()));
    Get.lazyPut(() => RegisterServiceUseCase(sl()));
    Get.lazyPut(() => UpdateTransactionInfoUseCase(sl()));
    Get.lazyPut(() => CancelRegisterUseCase(sl()));
  }
}
