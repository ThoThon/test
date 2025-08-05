import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';

class LoginControllerCl extends BaseGetClController {
  // final LoginArgument argument;

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

        await (
          _getAccountInfo(),
          _getD02Categories(),
          _getToTalNotiUnread(),
        ).wait;

        nav.offAllNamed(AppRoutesCl.home.path);
      },
    );
  }

  Future<void> _getAccountInfo() async {
    final accountInfo = await _getAccountInfoUseCase.execute();
    appCtrl.accountInfo.value = accountInfo;
    await _saveCompanyNameUseCase.execute(accountInfo.tenToChuc);

    // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
    AppData.instance.accountInfoModel.value = accountInfo.toOldModel();
  }

  Future<void> _getD02Categories() async {
    final d02Categories = await _getD02CategoriesUseCase.execute();
    // setter .value. của RxSet là protected nên sẽ sử dụng assignAll
    appCtrl
      ..declarationTypes.assignAll(d02Categories.declarationTypes)
      ..ethnics.assignAll(d02Categories.ethnics)
      ..nations.assignAll(d02Categories.nations)
      ..provinces.assignAll(d02Categories.provinces)
      ..relationships.assignAll(d02Categories.relationships)
      ..positions.assignAll(d02Categories.positions)
      ..birthTypes.assignAll(d02Categories.birthTypes)
      ..receiveResults.assignAll(d02Categories.receiveResults);

    // Gán các giá trị này cho AppData để đảm bảo tương thích ngược với code cũ
    // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
    AppData.instance
      ..declarationTypes =
          d02Categories.declarationTypes.map((e) => e.toOldModel()).toSet()
      ..ethnics = d02Categories.ethnics.map((e) => e.toOldModel()).toSet()
      ..nations = d02Categories.nations.map((e) => e.toOldModel()).toSet()
      ..provinces = d02Categories.provinces.map((e) => e.toOldModel()).toSet()
      ..relationships =
          d02Categories.relationships.map((e) => e.toOldModel()).toSet()
      ..positions = d02Categories.positions.map((e) => e.toOldModel()).toSet()
      ..birthTypes = d02Categories.birthTypes.map((e) => e.toOldModel()).toSet()
      ..receiveResults =
          d02Categories.receiveResults.map((e) => e.toOldModel()).toSet();
  }

  Future<void> _getToTalNotiUnread() async {
    final totalUnread = await _getUnreadNotificationCountUseCase.execute();
    appCtrl.totalUnread.value = totalUnread;

    // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
    AppData.instance.totalUnread.value = totalUnread;
  }

  void goToRegisterCodePage() {
    nav.toNamed(AppRoutesCl.registerCode.path);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
