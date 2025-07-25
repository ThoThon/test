import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/login/repository/login_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

class LoginController extends BaseGetxController {
  late final _loginRepository = LoginRepository(this);
  final formKey = GlobalKey<FormState>();
  // Username test : sd8888k17
  // Password test : Viettel@789
  final usernameTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();
  final isHaveUsername = false.obs;
  final appController = Get.find<AppController>();

  int page = AppConst.defaultPageNumber;

  @override
  void onInit() {
    super.onInit();
    if (hiveApp.get(HiveKeys.keyUsername) != null) {
      usernameTextCtrl.text = hiveApp.get(HiveKeys.keyUsername);
    }
    isHaveUsername.value = hiveApp.get(HiveKeys.keyUsername) != null;
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    try {
      KeyBoard.hide();
      showLoadingOverlay();

      final username = usernameTextCtrl.text.trim();
      final password = passwordTextCtrl.text.trim();

      final response = await _loginRepository.login(
        username: username,
        password: password,
      );

      if (response.isSuccess) {
        await Future.wait([
          hiveApp.put(HiveKeys.keyUsername, username),
          hiveApp.put(HiveKeys.keyJwtToken, response.result),
        ]);
        await (
          _getAccountInfo(),
          _getD02Categories(),
          _get630aCategories(),
          _getToTalNotiUnread(),
        ).wait;
        Get.offAllNamed(AppRoutes.home.path);
        return;
      } else {
        showSnackBar(
          isHaveUsername.value
              ? LocaleKeys.login_invalidPassword.tr
              : LocaleKeys.login_usernameAndPasswordInValid.tr,
        );
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _getToTalNotiUnread() async {
    try {
      final res = await _loginRepository.getToTalNotiUnread();
      if (res.isSuccess && res.result != null) {
        AppData.instance.totalUnread.value = res.result!;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _getAccountInfo() async {
    try {
      final res = await _loginRepository.getAccountInfo();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        AppData.instance.accountInfoModel.value = res.result;
        //Lưu tên tổ chức lại để hiện ngoài màn login
        hiveApp.put(HiveKeys.keyCompanyName, res.result?.tenToChuc);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _getD02Categories() async {
    try {
      final res = await _loginRepository.getD02Categories();
      final d02Categories = res.result;
      if (res.code == AppConst.statusCodeSuccess && d02Categories != null) {
        AppData.instance
          ..declarationTypes = d02Categories.declarationTypes
          ..ethnics = d02Categories.ethnics
          ..nations = d02Categories.nations
          ..provinces = d02Categories.provinces
          ..relationships = d02Categories.relationships
          ..positions = d02Categories.positions
          ..birthTypes = d02Categories.birthTypes
          ..receiveResults = d02Categories.receiveResults;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _get630aCategories() async {
    try {
      final response = await _loginRepository.get630aCategories();
      final categories630a = response.result;
      if (response.code == AppConst.statusCodeSuccess &&
          categories630a != null) {
        AppData.instance
          ..declareForm = categories630a.declareForm
          ..benefitGroup = categories630a.benefitGroup
          ..workCondition = categories630a.workCondition
          ..receiveForm = categories630a.receiveForm
          ..hospitalLine = categories630a.hospitalLine
          ..longDiease = categories630a.longDiease
          ..bank = categories630a.bank;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }

  void goToRegisterCodePage() {
    Get.toNamed(AppRoutes.registerCode.path);
  }
}
