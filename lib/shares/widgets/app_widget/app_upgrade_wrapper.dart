import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class AppUpgradeWrapper extends StatelessWidget {
  const AppUpgradeWrapper({
    super.key,
    this.minAppVersion,
    this.child,
  });

  final String? minAppVersion;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      showIgnore: false,
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(hours: 2),
        // Ngôn ngữ của dialog sẽ theo ngôn ngữ của app thay vì của hệ thống
        messages: UpgraderMessages(code: 'vi'),
        // Force update bằng minAppVersion
        minAppVersion: kDebugMode ? null : minAppVersion,
      ),
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: child,
    );
  }
}
