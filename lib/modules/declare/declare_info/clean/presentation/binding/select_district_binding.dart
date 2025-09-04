import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings_factory.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/data/repository/district_repository_impl.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/district_repository.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/usecase/get_districts_use_case.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/presentation/controller/select_district_controller.dart';

class SelectDistrictBinding extends BaseBindingsFactory {
  @override
  void bindingsFactoryController() {
    Get.lazyPutFactory(
      () => SelectDistrictControllerCl(
        slf(),
        argument: Get.arguments,
      ),
    );
  }

  @override
  void bindingsFactoryRepository() {
    Get.lazyPutFactory<DistrictRepository>(
      () => DistrictRepositoryImpl(sl(), sl()),
    );
  }

  @override
  void bindingsFactoryUseCase() {
    Get.lazyPutFactory(
      () => GetDistrictsUseCase(slf()),
    );
  }
}
