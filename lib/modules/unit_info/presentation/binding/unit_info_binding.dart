import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

import '../../../src.dart';

class UnitInfoBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => UnitInfoController(sl(), sl()));
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<UnitInfoRepository>(
      () => UnitInfoRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => GetUnitInfoUseCase(sl()));
    Get.lazyPut(() => UpdateUnitInfoUseCase(sl()));
  }
}
