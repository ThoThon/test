import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/history/domain/use_case/get_declaration_history_record_list_use_case.dart';

import '../../../src.dart';

class HistoryBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => HistoryController(
        sl(),
        sl(),
        sl(),
        sl(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<HistoryRepository>(
      () => HistoryRepositoryImpl(
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
  void bindingsUseCase() {
    Get.lazyPut(() => GetDeclarationHistoryListUseCase(sl()));
    Get.lazyPut(() => GetProcedureListFilterUseCase(sl()));
    Get.lazyPut(() => GetRegisterHistoryListUseCase(sl()));
    Get.lazyPut(() => GetDeclarationHistoryRecordListUseCase(sl()));
  }
}
