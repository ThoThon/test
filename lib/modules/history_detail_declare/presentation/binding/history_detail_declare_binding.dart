import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';

import '../../../src.dart';

class HistoryDetailDeclareBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => HistoryDetailDeclareController(
        sl(),
        sl(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<HistoryDetailDeclareRepository>(
      () => HistoryDetailDeclareRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => DeclareHistoryLookupResultUseCase(sl()));
    Get.lazyPut(() => GetFileNumberUseCase(sl()));
  }
}
