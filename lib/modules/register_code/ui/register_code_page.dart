import 'dart:io';

import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

part 'common_info_tab.dart';
part 'register_code_widget.dart';
part 'register_info_tab.dart';

class RegisterCodePage extends BaseGetWidget {
  RegisterCodePage({super.key});

  @override
  RegisterCodeController get controller => _controller;

  late final _controller = Get.put(RegisterCodeController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: BaseAppBarTitle(
          title: 'Đăng ký cấp mã',
        ),
      ),
      body: buildLoadingOverlay(
        () => _buildBody(),
      ),
    );
  }
}
