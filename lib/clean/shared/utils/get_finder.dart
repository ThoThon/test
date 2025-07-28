import 'package:get/get.dart';

/// - Service locator for GetX
/// - Shortcut to find dependencies in GetX
S sl<S>({String? tag}) => Get.find<S>(tag: tag);
