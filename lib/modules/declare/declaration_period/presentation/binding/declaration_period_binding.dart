import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/declare/declaration_period/data/repository/declaration_period_repository_impl.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/repository/declaration_period_repository.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/controller/declaration_period_controller.dart';

class DeclarationPeriodBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => DeclarationPeriodControllerCl(
        sl(),
        sl(),
        sl(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<DeclarationPeriodRepository>(
      () => DeclarationPeriodRepositoryImpl(sl(), sl()),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(
      () => GetDeclarationPeriodsUseCase(sl()),
    );
    Get.lazyPut(
      () => DeleteDeclarationPeriodUseCase(sl()),
    );
    Get.lazyPut(
      () => CreateDeclarationPeriodUseCase(sl()),
    );
  }
}
