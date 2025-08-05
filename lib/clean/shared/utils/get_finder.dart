import 'package:get/get.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

/// - Service locator for GetX
/// - Shortcut to find dependencies in GetX
S sl<S>({String? tag}) => Get.find<S>(tag: tag);

/// - Service locator for GetX with factory
/// - Shortcut to find dependencies in GetX with factory
S slF<S>({String? tag}) => Get.findFactory<S>();
