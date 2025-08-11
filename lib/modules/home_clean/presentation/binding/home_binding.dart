import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/modules/home_clean/data/repository/home_repository_impl.dart';
import 'package:v_bhxh/modules/home_clean/domain/repository/home_repository.dart';
import 'package:v_bhxh/modules/home_clean/domain/usecase/read_all_notification_use_case.dart';
import 'package:v_bhxh/modules/home_clean/presentation/controller/home_controller_cl.dart';

import '../../../../clean/shared/utils/get_finder.dart';
import '../../../src.dart';

class HomeBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => HomeControllerCl(
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => ReadAllNotificationUseCase(sl()));
  }
}
