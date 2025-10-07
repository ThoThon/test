import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/data/repository/history_detail_declare_repository_impl.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/use_case/declare_history_lookup_result_use_case.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/use_case/get_file_number_use_case.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/presentation/controller/history_detail_declare_controller.dart';

import '../../../src.dart';
import '../../domain/repository/history_detail_declare_repository.dart';

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
