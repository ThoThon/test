import 'package:hive/hive.dart';

import 'login_info.dart';

class LoginStorage {
  static const String boxName = 'login_box';

  /// Lưu thông tin đăng nhập
  static Future<void> saveLoginInfo(LoginInfo info) async {
    final box = Hive.box<LoginInfo>(boxName);
    await box.clear();
    await box.add(info);
  }

  /// Lấy thông tin đăng nhập
  static LoginInfo? getLoginInfo() {
    final box = Hive.box<LoginInfo>(boxName);
    if (box.isEmpty) return null;
    return box.getAt(0);
  }

  /// Lấy token
  static String? getToken() {
    final info = getLoginInfo();
    return info?.token;
  }

  /// Kiểm tra đã đăng nhập (có token hợp lệ)
  static bool get isLoggedIn {
    final info = getLoginInfo();
    return info != null && info.token != null && info.token!.isNotEmpty;
  }

  /// Chỉ xóa token, giữ lại thông tin đăng nhập
  static Future<void> clearToken() async {
    final box = Hive.box<LoginInfo>(boxName);
    if (box.isNotEmpty) {
      final currentInfo = box.getAt(0);
      if (currentInfo != null) {
        // Tạo info mới với token = null
        final updatedInfo = LoginInfo(
          username: currentInfo.username,
          password: currentInfo.password,
          taxCode: currentInfo.taxCode,
          token: null, // Xóa token
        );
        await box.putAt(0, updatedInfo);
      }
    }
  }

  /// Xóa hoàn toàn thông tin đăng nhập (dùng khi cần thiết)
  static Future<void> clearLoginInfo() async {
    final box = Hive.box<LoginInfo>(boxName);
    await box.clear();
  }

  /// Kiểm tra có thông tin đăng nhập đã lưu không (không cần token)
  static bool get hasSavedLoginInfo {
    final info = getLoginInfo();
    return info != null &&
        info.username.isNotEmpty &&
        info.password.isNotEmpty &&
        info.taxCode.isNotEmpty;
  }
}
