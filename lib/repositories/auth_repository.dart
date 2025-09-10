import '../features/login/models/login_info.dart';
import '../features/login/models/login_storage.dart';
import '../services/remote/auth_apiservice.dart';

class AuthRepository {
  static Future<bool> login({
    required String taxCode,
    required String username,
    required String password,
  }) async {
    try {
      final response = await AuthApiService.login(
        taxCode: taxCode,
        username: username,
        password: password,
      );

      if (response.success && response.data != null) {
        final token = response.data!.token;

        // Lưu thông tin đăng nhập
        final loginInfo = LoginInfo(
          username: username,
          password: password,
          taxCode: taxCode,
          token: token,
        );

        await LoginStorage.saveLoginInfo(loginInfo);

        print("Token đã lưu: $token");
        return true;
      }

      return false;
    } catch (e) {
      print('Lỗi trong AuthRepository.login: $e');
      return false;
    }
  }

  // Đăng xuất
  static Future<void> logout() async {
    await LoginStorage.clearLoginInfo();
  }

  // Kiểm tra trạng thái đăng nhập
  static bool get isLoggedIn => LoginStorage.isLoggedIn;

  // Lấy token hiện tại
  static String? get currentToken => LoginStorage.getToken();

  // Lấy thông tin đăng nhập đã lưu
  static LoginInfo? get savedLoginInfo => LoginStorage.getLoginInfo();
}
