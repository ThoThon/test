import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/get_account_info_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/login_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/save_auth_info_use_case.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';

class LoginControllerCl extends BaseGetClController {
  final LoginUseCase _loginUseCase;
  final SaveAuthInfoUseCase _saveAuthInfoUseCase;
  final GetAccountInfoUseCase _getAccountInfoUseCase;

  final formKey = GlobalKey<FormState>();
  final usernameTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();
  final isHaveUsername = false.obs;

  LoginControllerCl(
    this._loginUseCase,
    this._saveAuthInfoUseCase,
    this._getAccountInfoUseCase,
  );

  Future<void> login() async {
    await buildState(
      showLoadingOverlay: true,
      action: () async {
        if (formKey.currentState?.validate() != true) {
          return;
        }

        final loginRequest = LoginRequest(
          username: usernameTextCtrl.text.trim(),
          password: passwordTextCtrl.text.trim(),
        );

        final accessToken = await _loginUseCase.execute(loginRequest);

        await _saveAuthInfoUseCase.execute(
          SaveAuthInfoUseCaseInput(
            username: loginRequest.username,
            accessToken: accessToken,
          ),
        );

        await _getAccountInfo();

        appNavigator.offAllNamed(AppRoutesCl.home.path);
      },
    );
  }

  Future<void> _getAccountInfo() async {
    final accountInfo = await _getAccountInfoUseCase.execute();
    appController.accountInfo.value = accountInfo;
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
