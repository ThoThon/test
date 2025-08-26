import '../../../../clean/core/presentation/bindings/binding_src.dart';
import '../../../../clean/shared/utils/get_finder.dart';
import '../../../../shares/package/export_package.dart';
import '../../data/repository/lookup_c12_repository_imp.dart';
import '../../domain/repository/lookup_c12_repository.dart';
import '../../domain/usecase/get_c12_file_use_case.dart';
import '../controller/lookup_c12_controller.dart';

class LookupC12Binding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => LookupC12Controller(sl()),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LookupC12Repository>(
      () => LookupC12RepositoryImp(
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(
      () => GetC12FileUseCase(sl()),
    );
  }
}
