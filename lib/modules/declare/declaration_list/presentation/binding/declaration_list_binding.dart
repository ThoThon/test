import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/declare/declaration_list/declaration_list_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/use_case/get_record_pdf_use_case.dart';
import 'package:v_bhxh/modules/src.dart';

class DeclarationListBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => DeclarationListController(
        sl(),
        sl(),
        sl(),
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
    Get.lazyPut<DeclarationListRepository>(
      () => DeclarationListRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => GetViewPdf600UseCase(sl()));
    Get.lazyPut(() => GetViewPdf607UseCase(sl()));
    Get.lazyPut(() => GetViewPdf630aUseCase(sl()));
    Get.lazyPut(() => GetViewPdf630bUseCase(sl()));
    Get.lazyPut(() => GetViewPdf630bUseCase(sl()));
    Get.lazyPut(() => GetViewPdf630cUseCase(sl()));
    Get.lazyPut(() => SignDocumentUseCase(sl()));
    Get.lazyPut(() => GetRecordPdfUseCase(sl()));
  }
}
