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
          _get630Categories(),
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
          ..receiveResults = d02Categories.receiveResults
          ..provinceOld = d02Categories.provinceOld;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _get630Categories() async {
    try {
      final response = await _loginRepository.get630aCategories();
      final categories630 = response.result;
      if (response.code == AppConst.statusCodeSuccess &&
          categories630 != null) {
        AppData.instance
          ..declareForm = categories630.declareForm
          ..benefitGroup630a = categories630.benefitGroup630a
          ..hospitalLine = categories630.hospitalLine
          ..longDiease = categories630.longDiease
          ..workCondition = categories630.workCondition
          ..receiveForm = categories630.receiveForm
          ..bank = categories630.bank
          ..benefitGroup630b = categories630.benefitGroup630b
          ..pregnancyCondition = categories630.pregnancyCondition
          ..childBirthCondition = categories630.childBirthCondition
          ..maternityLeave = categories630.maternityLeave
          ..parentalLeave = categories630.parentalLeave
          ..surrogacy = categories630.surrogacy
          ..surgeryPregnancy32w = categories630.surgeryPregnancy32w
          ..contraception = categories630.contraception;
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
