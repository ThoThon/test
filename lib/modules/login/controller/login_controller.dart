import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/login/repository/login_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class LoginController extends BaseGetxController {
  late final _loginRepository = LoginRepository(this);

  Future<void> login() async {
    final username = "sd8888k17";
    final password = "Viettel@789";

    try {
      final response = await _loginRepository.login(
        username: username,
        password: password,
      );

      if (response.isSuccess) {
        await Future.wait([
          hiveApp.put(HiveKeys.keyUsername, username),
          hiveApp.put(HiveKeys.keyPassword, password),
          hiveApp.put(HiveKeys.keyJwtToken, response.result),
        ]);

        Get.offAndToNamed(AppRoutes.pageBuilder.path);
        return;
      } else {
        showSnackBar('Tên đăng nhập hoặc mật khẩu không hợp lệ');
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
