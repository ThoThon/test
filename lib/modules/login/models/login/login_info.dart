import 'package:hive/hive.dart';

part 'login_info.g.dart';

@HiveType(typeId: 0)
class LoginInfo extends HiveObject {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String taxCode;

  @HiveField(3)
  final String? token; // Nullable để có thể xóa token

  LoginInfo({
    required this.username,
    required this.password,
    required this.taxCode,
    this.token,
  });

  // Tạo copy với token mới
  LoginInfo copyWith({
    String? username,
    String? password,
    String? taxCode,
    String? token,
  }) {
    return LoginInfo(
      username: username ?? this.username,
      password: password ?? this.password,
      taxCode: taxCode ?? this.taxCode,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'LoginInfo{username: $username, taxCode: $taxCode, hasToken: ${token != null}}';
  }
}
