import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class ButtonUtils {
  static DateTime? _dateTime;
  static int _oldFunc = 0;

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
    bool isContinuous = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isContinuous) {
          onTap();
        } else {
          DateTime now = DateTime.now();
          if (_dateTime == null ||
              now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
              onTap.hashCode != _oldFunc) {
            _dateTime = now;
            _oldFunc = onTap.hashCode;
            onTap();
          }
        }
      },
      child: child,
    );
  }

  static void onTapButton({required Function onTap, required bool isLoading}) {
    if (!isLoading) {
      DateTime now = DateTime.now();
      if (_dateTime == null ||
          now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
          onTap.hashCode != _oldFunc) {
        _dateTime = now;
        _oldFunc = onTap.hashCode;
        onTap();
      }
    }
  }
}
