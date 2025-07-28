import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const _boxName = 'app_local_storage';

class AppHive {
  AppHive._();

  // Tạm thời sử dụng singleton để tránh thay đổi quá nhiều code
  // TODO: Bỏ singleton để chuyển về dependency injection bình thường
  @Deprecated(
      "Không dùng trực tiếp qua AppHive.instance, dùng thông qua sl() để inject vào các class cần thiết")
  static final AppHive instance = AppHive._();

  late final Box _box;

  Future<AppHive> init() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    Hive.init(documentsDir.path);
    // Register adapters here:
    // Hive.registerAdapter(YourAdapter());
    // Hive.registerAdapter(AnotherAdapter());

    _box = await Hive.openBox(_boxName);
    return this;
  }

  Future<void> put(String key, dynamic value) => _box.put(key, value);

  T? get<T>(String key) => _box.get(key);

  Future<void> delete(String key) => _box.delete(key);

  Future<int> deleteAll() => _box.clear();

  Future<void> deleteKeys(List<String> keys) => _box.deleteAll(keys);
}
