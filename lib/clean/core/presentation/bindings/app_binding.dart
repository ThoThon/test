import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/app_controller.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/clean/shared/exceptions/exception_handler.dart';
import 'package:v_bhxh/clean/shared/mapper/forgot_password_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/lookup_c12_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/notification_item_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/notification_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/notification_list_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl_impl.dart';
import 'package:v_bhxh/shares/firebase/remote_config_storage.dart';

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
    Get.lazyPut(() => AccountInfoDataMapper(), fenix: true);
    Get.lazyPut(() => AdjustmentPlanDataMapper(), fenix: true);
    Get.lazyPut(() => DeclarationTypeDataMapper(sl()), fenix: true);
    Get.lazyPut(() => EthnicDataMapper(), fenix: true);
    Get.lazyPut(() => NationDataMapper(), fenix: true);
    Get.lazyPut(() => ProvinceDataMapper(), fenix: true);
    Get.lazyPut(() => RelationshipDataMapper(), fenix: true);
    Get.lazyPut(() => PositionDataMapper(), fenix: true);
    Get.lazyPut(() => BirthTypeDataMapper(), fenix: true);
    Get.lazyPut(() => ReceiveResultDataMapper(), fenix: true);
    Get.lazyPut(
      () => D02CategoriesDataMapper(
          sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
      fenix: true,
    );
    Get.lazyPut(() => ProcedureDataMapper(), fenix: true);
    Get.lazyPut(() => DeclarationPeriodDataMapper(), fenix: true);
    Get.lazyPut(() => DistrictDataMapper(), fenix: true);
    Get.lazyPut(() => WardDataMapper(), fenix: true);
    Get.lazyPut(() => ForgotPasswordRequestDataMapper(), fenix: true);
    Get.lazyPut(() => LookupC12DataMapper(), fenix: true);
    Get.lazyPut(() => NotificationItemDataMapper(), fenix: true);
    Get.lazyPut(() => NotificationListDataMapper(sl()), fenix: true);
    Get.lazyPut(() => NotificationListRequestDataMapper(), fenix: true);
  }

  Future<void> _bindingsCore(AppEnv env) async {
    Get.put<EnvConfig>(
      switch (env) {
        AppEnv.dev => EnvConfigDev(),
        AppEnv.uat => EnvConfigUat(),
        AppEnv.prod => EnvConfigProd(),
      },
      permanent: true,
    );
    await [
      Get.putAsync<AppHive>(AppHiveImpl.instance.init, permanent: true),
      Get.putAsync<RemoteConfigStorage>(
        RemoteConfigStorage().initialize,
        permanent: true,
      ),
      Get.putAsync(AppInfo().init, permanent: true)
    ].wait;
    Get.put<AppNavigator>(AppNavigatorImpl(), permanent: true);
    Get.put(ExceptionHandler(nav: sl()), permanent: true);
    Get.put<BaseUrlHelperCl>(
      BaseUrlHelperClImpl(sl(), sl(), sl()),
      permanent: true,
    );
    Get.put(HeaderInterceptor(sl()), permanent: true);
    Get.put(HeaderUploadInterceptor(sl()), permanent: true);
    Get.put(AccessTokenInterceptor(sl()), permanent: true);
    Get.put(
      AuthAppServerApiClient(sl(), sl(), sl()),
      permanent: true,
    );
    Get.put(
      AuthAppUploadApiClient(sl(), sl(), sl()),
      permanent: true,
    );
    Get.put(NonAuthAppServerApiClient(sl(), sl()), permanent: true);
  }

  @override
  void bindingsController() {
    Get.put(AppController(), permanent: true);
  }

  @override
  void bindingsRepository() {}

  @override
  void bindingsUseCase() {}
}
