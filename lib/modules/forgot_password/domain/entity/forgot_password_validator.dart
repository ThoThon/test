import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

class ForgotPasswordValidator {
  const ForgotPasswordValidator._();

  static String? validateUnitCode(String? value) {
    final trimmedValue = value?.trim();
    if (trimmedValue == null || trimmedValue.isEmpty) {
      return LocaleKeys.login_unitCodeCannotEmpty.tr;
    }
    return null;
  }

  static String? validateTaxCode(String? value) {
    final trimmedValue = value?.trim();
    if (trimmedValue == null || trimmedValue.isEmpty) {
      return LocaleKeys.login_taxCodeCannotEmpty.tr;
    }
    return null;
  }
}
