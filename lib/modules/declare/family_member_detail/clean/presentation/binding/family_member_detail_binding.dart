import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/clean/presentation/controller/family_member_detail_controller.dart';

class FamilyMemberDetailBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => FamilyMemberDetailControllerCl(argument: Get.arguments),
    );
  }

  @override
  void bindingsRepository() {}

  @override
  void bindingsUseCase() {}
}
