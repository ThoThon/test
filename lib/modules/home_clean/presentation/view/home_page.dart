import 'package:flutter/cupertino.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/shared/utils/app_info.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/home_clean/presentation/controller/home_controller_cl.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../src.dart';

part 'home_widget.dart';

class HomePageCL extends BaseGetPage<HomeControllerCl> {
  HomePageCL({super.key});

  late final _appInfo = sl<AppInfo>();
  late final _remoteConfigStorage = sl<RemoteConfigStorage>();

  @override
  Widget buildPage(BuildContext context) {
    // Nếu treo ở màn home, và user không thể logout để mở màn login thì dialog update sẽ không được hiện
    // => Bọc AppUpgradeWrapper cho màn home luôn để dialog update luôn được hiện khi onResume
    // Đã thử bọc AppUpgradeWrapper ở App nhưng cũng gặp bug dialog không hiển thị
    return AppUpgradeWrapper(
      minAppVersion: _remoteConfigStorage.minAppVersion,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}
