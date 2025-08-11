import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:upgrader/upgrader.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/modules/home_clean/presentation/controller/home_controller_cl.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../src.dart';
import '../model/home_menu_item_src.dart';

part 'home_widget.dart';

class HomePageCL extends BaseGetPage<HomeControllerCl> {
  HomePageCL({super.key});

  late final _remoteConfigStorage = Get.find<RemoteConfigStorage>();

  @override
  Widget buildPage(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(days: 1),
        // Ngôn ngữ của dialog sẽ theo ngôn ngữ của app thay vì của hệ thống
        messages: UpgraderMessages(code: 'vi'),
        // Force update bằng minAppVersion
        minAppVersion: kDebugMode ? null : _remoteConfigStorage.minAppVersion,
      ),
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}
