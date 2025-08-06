import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:v_bhxh/clean/features/login/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller_cl.dart';

// Create mocks for all use cases
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LoginControllerCl controller;
  final loginUseCase = MockLoginUseCase();
  final saveAuthInfoUseCase = MockSaveAuthInfoUseCase();
  final getAccountInfoUseCase = MockGetAccountInfoUseCase();
  final getLastUsernameUseCase = MockGetLastUsernameUseCase();
  final saveCompanyNameUseCase = MockSaveCompanyNameUseCase();
  final getD02CategoriesUseCase = MockGetD02CategoriesUseCase();
  final getUnreadNotificationCountUseCase =
      MockGetUnreadNotificationCountUseCase();

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
}
