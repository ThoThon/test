import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:v_bhxh/clean/core/domain/entity/account_info.dart';
import 'package:v_bhxh/clean/core/domain/entity/d02_categories_cl.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/app_controller.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/app_navigator.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller_cl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';

class MockAppNavigator extends Mock implements AppNavigator {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockSaveAuthInfoUseCase extends Mock implements SaveAuthInfoUseCase {}

class MockGetAccountInfoUseCase extends Mock implements GetAccountInfoUseCase {}

class MockGetLastUsernameUseCase extends Mock
    implements GetLastUsernameUseCase {}

class MockSaveCompanyNameUseCase extends Mock
    implements SaveCompanyNameUseCase {}

class MockGetD02CategoriesUseCase extends Mock
    implements GetD02CategoriesUseCase {}

class MockGetUnreadNotificationCountUseCase extends Mock
    implements GetUnreadNotificationCountUseCase {}

class FakeLoginRequest extends Fake implements LoginRequest {}

class FakeSaveAuthInfoUseCaseInput extends Fake
    implements SaveAuthInfoUseCaseInput {}

void main() {
  late LoginControllerCl controller;
  final loginUseCase = MockLoginUseCase();
  final saveAuthInfoUseCase = MockSaveAuthInfoUseCase();
  final getAccountInfoUseCase = MockGetAccountInfoUseCase();
  final getLastUsernameUseCase = MockGetLastUsernameUseCase();
  final saveCompanyNameUseCase = MockSaveCompanyNameUseCase();
  final getD02CategoriesUseCase = MockGetD02CategoriesUseCase();
  final getUnreadNotificationCountUseCase =
      MockGetUnreadNotificationCountUseCase();
  final navigator = MockAppNavigator();

  setUpAll(() {
    registerFallbackValue(FakeLoginRequest());
    registerFallbackValue(FakeSaveAuthInfoUseCaseInput());
  });

  setUp(
    () {
      controller = LoginControllerCl(
        loginUseCase,
        saveAuthInfoUseCase,
        getAccountInfoUseCase,
        getLastUsernameUseCase,
        saveCompanyNameUseCase,
        getD02CategoriesUseCase,
        getUnreadNotificationCountUseCase,
      );
      controller.nav = navigator;
      // Login controller có lưu dữ liệu vào AppController, nên cần khởi tạo AppController thật ở đây
      // Nếu controller nào có cần đọc dữ liệu từ AppController thì cũng cần khởi tạo AppController thật
      controller.appCtrl = AppController();
      controller.onOpen();
    },
  );

  tearDown(
    () {
      controller.onClose();
    },
  );

  test('isHaveUsername is false by default', () {
    expect(controller.isHaveUsername.value, isFalse);
  });

  group('test login function', () {
    test('login success', () async {
      // Arrange
      when(() => getLastUsernameUseCase.execute()).thenReturn('testUser');
      when(() => loginUseCase.execute(any()))
          .thenAnswer((_) async => 'access_token');
      when(() => saveAuthInfoUseCase.execute(any())).thenAnswer((_) async {});
      when(() => saveCompanyNameUseCase.execute(any()))
          .thenAnswer((_) async => true);
      when(() => getAccountInfoUseCase.execute()).thenAnswer((_) async {
        return AccountInfo.empty();
      });
      when(() => getD02CategoriesUseCase.execute()).thenAnswer((_) async {
        return D02CategoriesCl.empty();
      });
      when(() => getUnreadNotificationCountUseCase.execute())
          .thenAnswer((_) async => 0);
      when(() => navigator.offAllNamed(AppRoutesCl.home.path))
          .thenAnswer((_) async {});

      // Act
      await controller.login();

      // Assert
      verify(() => navigator.offAllNamed(AppRoutesCl.home.path)).called(1);
    });
  });

  test('login fails with invalid username or password', () async {
    // Arrange
    // Giả lập việc loginUseCase lỗi do với username hoặc password không hợp lệ
    when(() => loginUseCase.execute(any())).thenThrow(
      const RemoteException(kind: RemoteExceptionKind.serverDefined),
    );
    when(() => navigator.offAllNamed(AppRoutesCl.home.path))
        .thenAnswer((_) async {});
    // Khi có lỗi error handler sẽ hiển thị snackbar, nên cần giả lập việc này
    when(() => navigator.showSnackBar(any())).thenAnswer((_) {});

    // Act
    await controller.login();

    // Assert
    // Khi login thất bại
    // Show snackbar lỗi
    verify(() => navigator.showSnackBar(any())).called(1);
    // Không chuyển hướng đến màn home
    verifyNever(() => navigator.offAllNamed(AppRoutesCl.home.path));
  });

  test('login fails if getAccountInfo fails', () async {
    // Arrange
    when(() => loginUseCase.execute(any()))
        .thenAnswer((_) async => 'access_token');
    when(() => saveAuthInfoUseCase.execute(any())).thenAnswer((_) async {});
    when(() => getAccountInfoUseCase.execute()).thenThrow(
      const RemoteException(kind: RemoteExceptionKind.serverDefined),
    );
    when(() => navigator.showSnackBar(any())).thenAnswer((_) {});

    // Act
    await controller.login();

    // Assert
    verify(() => navigator.showSnackBar(any())).called(1);
  });
}
