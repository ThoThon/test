import 'package:v_bhxh/assets.dart';

import '../../base_app/base_app.src.dart';
import '../../core/core.src.dart';
import '../../shares/shares.src.dart';
import 'models/icare_model.src.dart';

class IcareModules {
  static late IcareModulesRequest icareModulesData;
  static final IcareModules _singleton = IcareModules._();

  factory IcareModules() {
    return _singleton;
  }

  IcareModules._();

  static Future<dynamic> gotoDeclarationTaxCode({
    required IcareModulesRequest icareModulesRequest,
  }) async {
    // Get.toNamed(AppRoutesIcare.moduleIcare.path);
    icareModulesData = icareModulesRequest;
    Assets.isFromModules = true;
    Get.put(BaseGetxControllerIcare(), permanent: true);

    var result = await Get.toNamed(AppRoutesIcare.declarationTaxCode.path);
    Get.delete<BaseGetxControllerIcare>();
    return result;
  }
}
