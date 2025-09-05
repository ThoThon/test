import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/core/values/const.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';

class LoginControllerCl extends BaseGetClController {
  // final LoginArgument argument;

  final BaseUrlHelperCl _baseUrlHelper;
  final LoginUseCase _loginUseCase;
  final SaveAuthInfoUseCase _saveAuthInfoUseCase;
  final GetAccountInfoUseCase _getAccountInfoUseCase;
  final GetLastUsernameUseCase _getLastUsernameUseCase;
  final SaveCompanyNameUseCase _saveCompanyNameUseCase;
  final GetD02CategoriesUseCase _getD02CategoriesUseCase;
  final GetUnreadNotificationCountUseCase _getUnreadNotificationCountUseCase;

  final formKey = GlobalKey<FormState>();
  late final usernameTextCtrl =
      TextEditingController(text: _getLastUsernameUseCase.execute() ?? '');
  final passwordTextCtrl = TextEditingController();
  final isHaveUsername = false.obs;

  LoginControllerCl(
    // this.argument,
    this._baseUrlHelper,
    this._loginUseCase,
    this._saveAuthInfoUseCase,
    this._getAccountInfoUseCase,
    this._getLastUsernameUseCase,
    this._saveCompanyNameUseCase,
    this._getD02CategoriesUseCase,
    this._getUnreadNotificationCountUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    isHaveUsername.value = usernameTextCtrl.text.trim().isNotEmpty;
  }

  Future<void> login() {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final username = usernameTextCtrl.text.trim();
        final password = passwordTextCtrl.text.trim();

        // Với tài khoản demo gửi lên store sẽ gọi tới base url uat
        // để tránh lỗi chưa deploy api lên production
        if (username == AppConst.demoAccount) {
          await _baseUrlHelper.switchToUatEnv();
        }

        final loginRequest = LoginRequest(
          username: username,
          password: password,
        );

        final accessToken = await _loginUseCase.execute(loginRequest);

        await _saveAuthInfoUseCase.execute(
          SaveAuthInfoUseCaseInput(
            username: loginRequest.username,
            accessToken: accessToken,
          ),
        );

        await (
          _getAccountInfo(),
          _getD02Categories(),
          // TODO: get630Categories
          _getToTalNotiUnread(),
        ).wait;

        nav.offAllNamed(AppRoutesCl.home.path);
      },
    );
  }

  Future<void> _getAccountInfo() async {
    final accountInfo = await _getAccountInfoUseCase.execute();
    AppData.instance.accountInfo.value = accountInfo;
    await _saveCompanyNameUseCase.execute(accountInfo.tenToChuc);
  }

  Future<void> _getD02Categories() async {
    final d02Categories = await _getD02CategoriesUseCase.execute();
    // setter .value. của RxSet là protected nên sẽ sử dụng assignAll
    AppData.instance
      ..declarationTypes.assignAll(d02Categories.declarationTypes)
      ..ethnics.assignAll(d02Categories.ethnics)
      ..nations.assignAll(d02Categories.nations)
      ..provinces.assignAll(d02Categories.provinces)
      ..relationships.assignAll(d02Categories.relationships)
      ..positions.assignAll(d02Categories.positions)
      ..birthTypes.assignAll(d02Categories.birthTypes)
      ..receiveResults.assignAll(d02Categories.receiveResults)
      ..oldProvinces.assignAll(d02Categories.oldProvinces);
  }

  Future<void> _getToTalNotiUnread() async {
    final totalUnread = await _getUnreadNotificationCountUseCase.execute();
    AppData.instance.totalUnread.value = totalUnread;
  }

  void goToRegisterCodePage() {
    nav.toNamed(AppRoutesCl.registerCode.path);
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
