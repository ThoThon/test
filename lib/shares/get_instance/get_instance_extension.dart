import 'package:get/get.dart';

extension GetInstanceExtension on GetInterface {
  /// The findOrNull method will return the instance if it is registered;
  /// otherwise, it will return null.
  S? findOrNull<S>({String? tag}) {
    if (isRegistered<S>(tag: tag)) {
      return find<S>(tag: tag);
    }
    return null;
  }

  T? safeArguments<T>() {
    return Get.arguments is T? ? Get.arguments as T? : null;
  }

  bool get isPortrait => Get.width < Get.height;

  bool get isLandspace => Get.width > Get.height;

  double get longestSide => isPortrait ? Get.height : Get.width;

  double get shortestSide => isPortrait ? Get.width : Get.height;
}
