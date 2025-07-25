import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/login_use_case.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class LoginController extends BaseGetClController {
  final LoginUseCase _loginUseCase;

  LoginController(
    this._loginUseCase,
  );

  Future<void> login() async {
    await buildState(
      showLoadingOverlay: true,
      action: () async {
        final loginRequest = LoginRequest(
          username: 'sd8888k17',
          password: 'Viettel@789',
        );
        final accessToken = await _loginUseCase.execute(loginRequest);
        logger.d('Login result: $accessToken');
        // TODO Save access token to local storage
      },
    );
  }
}
