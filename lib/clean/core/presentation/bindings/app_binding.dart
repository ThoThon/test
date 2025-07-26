import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/app_controller_cl.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/app_navigator.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/clean/shared/exceptions/exception_handler.dart';
import 'package:v_bhxh/clean/shared/utils/app_info.dart';
import 'package:v_bhxh/shares/mapper/mapper_src.dart';

import 'base_bindings.dart';

class AppBinding extends BaseBindings {
  Future<void> bind({
    required AppEnv env,
  }) async {
    await _bindingsCore(env);
    _bindingMappers();
    dependencies();
  }

  void _bindingMappers() {
    Get.lazyPut(() => LoginRequestDataMapper(), fenix: true);
  }

  Future<void> _bindingsCore(AppEnv env) async {
    Get.put<EnvConfig>(
      switch (env) {
        AppEnv.dev => EnvConfigDev(),
        AppEnv.prod => EnvConfigProd(),
      },
      permanent: true,
    );
    await [
      Get.putAsync(AppHive.instance.init, permanent: true),
      Get.putAsync(AppInfo().init, permanent: true)
    ].wait;
    Get.put(AppNavigator(), permanent: true);
    Get.put(ExceptionHandler(appNavigator: Get.find()), permanent: true);

    Get.put(HeaderInterceptor(Get.find()), permanent: true);
    Get.put(AccessTokenInterceptor(Get.find()), permanent: true);
    Get.put(
      AuthAppServerApiClient(Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
    Get.put(NonAuthAppServerApiClient(Get.find(), Get.find()), permanent: true);
  }

  @override
  void bindingsController() {
    Get.put(AppControllerCl(), permanent: true);
  }

  @override
  void bindingsRepository() {}

  @override
  void bindingsUseCase() {}
}
