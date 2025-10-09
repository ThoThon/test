import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/get_630_categories_use_case.dart';
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
  final Get630CategoriesUseCase _get630categoriesUseCase;

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
    this._get630categoriesUseCase,
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

        // Nếu ngay sau khi login thành công mà tiến hành gọi các api khác thì có thể gặp lỗi 401 (do token chưa hợp lệ ngay lập tức ???)
        // Nên phải delay một chút để đảm bảo token đã hợp lệ
        await Future.delayed(const Duration(milliseconds: 100));

        await Future.wait([
          _getAccountInfo(),
          _getD02Categories(),
          _get630Categories(),
        ]);

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

  Future<void> _get630Categories() async {
    final categories630 = await _get630categoriesUseCase.execute();
    // setter .value. của RxSet là protected nên sẽ sử dụng assignAll
    AppData.instance
      ..declareForm.assignAll(categories630.declareForm)
      ..benefitGroup630a.assignAll(categories630.benefitGroup630a)
      ..hospitalLine.assignAll(categories630.hospitalLine)
      ..longDiease.assignAll(categories630.longDiease)
      ..workCondition.assignAll(categories630.workCondition)
      ..receiveForm.assignAll(categories630.receiveForm)
      ..bank.assignAll(categories630.bank)
      ..benefitGroup630b.assignAll(categories630.benefitGroup630b)
      ..pregnancyCondition.assignAll(categories630.pregnancyCondition)
      ..childBirthCondition.assignAll(categories630.childBirthCondition)
      ..maternityLeave.assignAll(categories630.maternityLeave)
      ..parentalLeave.assignAll(categories630.parentalLeave)
      ..surrogacy.assignAll(categories630.surrogacy)
      ..surgeryPregnancy32w.assignAll(categories630.surgeryPregnancy32w)
      ..contraception.assignAll(categories630.contraception)
      ..benefitGroup630c.assignAll(categories630.benefitGroup630c);
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
