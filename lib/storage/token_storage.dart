import 'package:hive/hive.dart';

class TokenStorage {
  static const _boxName = 'auth';
  static const _tokenKey = 'token';

  /// Make sure to call TokenStorage.init() from main() before using.
  static Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
  }

  static Future<void> saveToken(String token) async {
    final box = Hive.box(_boxName);
    await box.put(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
    final box = Hive.box(_boxName);
    return box.get(_tokenKey) as String?;
  }

  static Future<void> deleteToken() async {
    final box = Hive.box(_boxName);
    await box.delete(_tokenKey);
  }
}