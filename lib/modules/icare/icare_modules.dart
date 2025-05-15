import 'models/icare_model.src.dart';

class IcareModules {
  static late IcareModulesRequest icareModulesData;
  static final IcareModules _singleton = IcareModules._();

  factory IcareModules() {
    return _singleton;
  }

  IcareModules._();

  // static Future<dynamic> gotoDeclarationTaxCode({
  //   required IcareModulesRequest icareModulesRequest,
  // }) async {
  //   // Get.toNamed(AppRoutesIcare.moduleIcare.path);
  //   icareModulesData = icareModulesRequest;
  //   Assets.isFromModules = true;
  //   Get.put(BaseGetxController(), permanent: true);

  //   var result = await Get.toNamed(AppRoutes.declarationTaxCode.path);
  //   Get.delete<BaseGetxController>();
  //   return result;
  // }
}
