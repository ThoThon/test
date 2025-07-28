import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

class LoginValidator {
  const LoginValidator._();

  static String? validateUsername(String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return LocaleKeys.login_userNameCannotEmpty.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return LocaleKeys.login_passwordCannotEmpty.tr;
    }
    return null;
  }
}
