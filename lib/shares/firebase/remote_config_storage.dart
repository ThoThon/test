import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:v_bhxh/core/values/remote_config_const.dart';
import 'package:v_bhxh/shares/function/logger.dart';

// FROM DOC: https://firebase.google.com/docs/remote-config/get-started?platform=android#throttling
// "the limit was 5 fetch requests in a 60 minute window" => Trong 1h chỉ được fetch 5 lần
// => Throttling time = 60 / 5 = 12 minutes
// => Thời gian giữa 2 lần fetchAndActivateConfigs phải lớn hơn 12p => Chọn 15p cho an toàn
const _fetchAndActivateRemoteConfigThrottleTime = Duration(minutes: 15);

class RemoteConfigStorage {
  RemoteConfigStorage._();

  // Make RemoteConfigStorage a singleton
  static final RemoteConfigStorage instance = RemoteConfigStorage._();
  late final _remoteConfig = FirebaseRemoteConfig.instance;
  static const remoteConfigDefaultValues = {
    RemoteConfigConst.minAppVersionAndroid: '1.0.0',
    RemoteConfigConst.minAppVersionIOS: '1.0.0',
  };
  StreamSubscription<RemoteConfigUpdate>? _subscription;

  String get minAppVersionAndroid =>
      _remoteConfig.getString(RemoteConfigConst.minAppVersionAndroid);

  String get minAppVersionIOS =>
      _remoteConfig.getString(RemoteConfigConst.minAppVersionIOS);

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          // VD: minimumFetchInterval là 15 phút, nếu ta fetchAndActivate lại trong khoảng thời gian nhỏ hơn 15p
          // so với lần trước thì sẽ không gọi đến server mà lấy dữ liệu từ cache
          minimumFetchInterval: _fetchAndActivateRemoteConfigThrottleTime,
        ),
      );

      await _remoteConfig.setDefaults(remoteConfigDefaultValues);

      _listenConfigUpdated();

      await fetchAndActivateConfigs();
    } catch (e) {
      logger.e('RemoteConfigStorage initialize error: $e');
    }
  }

  DateTime get lastSuccessFetchTime => _remoteConfig.lastFetchTime;

  /// Lắng nghe sự kiện config được cập nhật,
  /// Chỉ chạy khi app đang ở foreground (được dùng) hoặc mới vào nền background
  ///
  /// Nếu app ở trong nền quá lâu thì khi update config ở firebase console app sẽ không nhận được.
  /// Đã thử xử lý gọi hàm [fetchAndActivateConfigs] khi app resume nhưng có vẻ trạng thái resume sẽ bị gọi khá nhiều,
  /// như vuốt thanh noti xong thì cũng resume. Đã xử lý khôn khéo hơn bằng cách dùng throttleTime ở app bloc
  void _listenConfigUpdated() {
    _subscription ??= _remoteConfig.onConfigUpdated.listen(
      (event) async {
        logger.d(
            'RemoteConfigStorage onConfigUpdated event: ${event.updatedKeys}');
        // Make new values available to the app.
        await activeConfigs();
      },
      onError: (error) {
        // Khi tắt mạng và mở app, sẽ có lỗi PlatformException(firebase_remote_config, Unable to connect to the server...)
        // => Cần thêm onError để catch lỗi từ stream, nếu ko có onError lỗi không được catch dẫn tới fire crashlytics
        logger.e('RemoteConfigStorage _listenConfigUpdated error: $error');
      },
    );
  }

  /// Fetch dữ liệu mới nhất từ remote config và active nó
  /// Hàm này có gọi tới network nên có thể xảy ra exception, cần try catch khi gọi
  Future<void> fetchAndActivateConfigs() async {
    // Chỉ fetch và action 15p / lần, handle case app resume
    if (_remoteConfig.lastFetchTime.difference(DateTime.now()).abs() <
        _fetchAndActivateRemoteConfigThrottleTime) {
      return;
    }

    try {
      // Khi set fetchTimeout ở bên trên nhỏ lại tầm 5s nhưng khi test thì khi không có mạng thì fetchAndActivate vẫn tốn
      // tầm 10s => Tự xử lý timeout cho hàm này để đảm bảo màn Splash không bị treo quá 2s

      // Cái hay ở đoạn code dưới là việc set timout là 2s để hàm fetchAndActivateConfigs này chỉ giữ tối đa 2s
      // => Hàm fetchAndActivateConfigs kết thúc sau 2s nhưng khi fetchAndActivate vẫn trả về kết quả (sau 10s chẳng hạn)
      // Không cần quan tâm kết quả vì hàm fetchAndActivate đã active dữ liệu luôn rồi
      await _remoteConfig.fetchAndActivate().onError(
        (error, stackTrace) {
          // Khi có lỗi thì trả về false, nhưng mà cũng ko dùng tới
          return false;
        },
      ).timeout(
        const Duration(seconds: 2),
        // Set onTimeout thì sẽ để KHÔNG có exception xảy ra
        onTimeout: () => false,
      );
    } catch (e) {
      logger.e('fetchAndActivateConfigs error: $e');
    }
  }

  /// Active các giá trị config mới nhất
  Future<void> activeConfigs() {
    return _remoteConfig.activate();
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}
