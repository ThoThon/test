import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/shared/utils/app_info.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/home_clean/presentation/controller/home_controller_cl.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../src.dart';
import '../model/home_menu_item_src.dart';

part 'home_widget.dart';

class HomePageCL extends BaseGetPage<HomeControllerCl> {
  HomePageCL({super.key});

  late final _appInfo = sl<AppInfo>();

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
