import 'package:v_bhxh/clean/shared/exceptions/base/app_exception.dart';

class LoginException extends AppException {
  LoginException({
    required this.kind,
    this.rootException,
  }) : super(AppExceptionType.custom);

  final LoginExceptionKind kind;
  final Object? rootException;

  @override
  String toString() =>
      "LoginException(kind: $kind, rootException: $rootException";

  @override
  String? get errorMessage {
    switch (kind) {
      case LoginExceptionKind.invalidUsernameOrPassword:
        return 'Tên đăng nhập hoặc mật khẩu không hợp lệ';
      case LoginExceptionKind.userNotFound:
        return 'Người dùng không tồn tại';
      case LoginExceptionKind.accountLocked:
        return 'Tài khoản đã bị khóa';
      case LoginExceptionKind.unknownError:
        return 'Lỗi không xác định';
      case LoginExceptionKind.invalidAccessToken:
        return 'Token truy cập không hợp lệ';
    }
  }
}

enum LoginExceptionKind {
  invalidUsernameOrPassword,
  userNotFound,
  accountLocked,
  unknownError,
  invalidAccessToken,
}
