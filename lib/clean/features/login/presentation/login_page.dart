import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/features/login/presentation/validator/login_validator.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller_cl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/core/values/hive_key.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/base/ui/formatter/input_formatter_enum.dart';
import 'package:v_bhxh/shares/base/ui/text_widget.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper.dart';
import 'package:v_bhxh/shares/firebase/remote_config_storage.dart';
import 'package:v_bhxh/shares/widgets/app_widget/app_upgrade_wrapper.dart';
import 'package:v_bhxh/shares/widgets/appbar/base_app_bar.dart';
import 'package:v_bhxh/shares/widgets/image_app/sds_image_svg.dart';
import 'package:v_bhxh/shares/widgets/input/card_input_text_form.dart';
import 'package:v_bhxh/shares/widgets/sized_box/sized_box.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

part 'login_widget.dart';

class LoginPage extends BaseGetPage<LoginControllerCl> {
  LoginPage({super.key});

  late final appHive = sl<AppHive>();

  late final _remoteConfigStorage = sl<RemoteConfigStorage>();

  @override
  Widget buildPage(BuildContext context) {
    return AppUpgradeWrapper(
      minAppVersion: _remoteConfigStorage.minAppVersion,
      child: Scaffold(
        // Thêm appbar để status bar của hệ thống hiển thị đúng màu sắc
        appBar: const BaseAppBar(title: UtilWidget.shrink),
        body: _buildBody(),
      ),
    );
  }
}
