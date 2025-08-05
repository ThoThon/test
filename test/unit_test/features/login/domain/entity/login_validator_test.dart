import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_validator.dart';
import 'package:v_bhxh/generated/locales.g.dart';

void main() {
  group('validateUsername', () {
    test(
      'validateUsername should return null when username is not empty',
      () {
        // Arrange
        const username = 'testUser';
        // Act
        final result = LoginValidator.validateUsername(username);
        // Assert
        expect(result, isNull);
      },
    );

    test(
      'validateUsername should return error message when username is empty',
      () {
        // Arrange
        const username = '';
        // Act
        final result = LoginValidator.validateUsername(username);
        // Assert
        expect(result, LocaleKeys.login_userNameCannotEmpty.tr);
      },
    );
    test(
      'validateUsername should return error message when username is null',
      () {
        // Arrange
        const String? username = null;
        // Act
        final result = LoginValidator.validateUsername(username);
        // Assert
        expect(result, LocaleKeys.login_userNameCannotEmpty.tr);
      },
    );
    test(
      'validateUsername should return error message when username is whitespace',
      () {
        // Arrange
        const username = '   ';
        // Act
        final result = LoginValidator.validateUsername(username);
        // Assert
        expect(result, LocaleKeys.login_userNameCannotEmpty.tr);
      },
    );
  });

  group('validatePassword', () {
    test(
      'validatePassword should return null when password is not empty',
      () {
        // Arrange
        const password = 'testPassword';
        // Act
        final result = LoginValidator.validatePassword(password);
        // Assert
        expect(result, isNull);
      },
    );

    test(
      'validatePassword should return error message when password is empty',
      () {
        // Arrange
        const password = '';
        // Act
        final result = LoginValidator.validatePassword(password);
        // Assert
        expect(result, LocaleKeys.login_passwordCannotEmpty.tr);
      },
    );

    test(
      'validatePassword should return error message when password is null',
      () {
        // Arrange
        const String? password = null;
        // Act
        final result = LoginValidator.validatePassword(password);
        // Assert
        expect(result, LocaleKeys.login_passwordCannotEmpty.tr);
      },
    );

    test(
      'validatePassword should return error message when password is whitespace',
      () {
        // Arrange
        const password = '   ';
        // Act
        final result = LoginValidator.validatePassword(password);
        // Assert
        expect(result, LocaleKeys.login_passwordCannotEmpty.tr);
      },
    );
  });
}
