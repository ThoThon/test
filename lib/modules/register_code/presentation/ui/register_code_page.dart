import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../domain/entity/categories.dart';
import '../../domain/entity/certificate.dart';
import '../../domain/entity/social_agency.dart';
import '../controller/register_code_controller.dart';
import '../enum/register_code_tab_enum.dart';

part 'common_info_tab.dart';
part 'register_code_widget.dart';
part 'register_info_tab.dart';

class RegisterCodePage extends BaseGetPage<RegisterCodeController> {
  RegisterCodePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backgroundColor: AppColors.basicWhite,
        leading: InkWell(
          onTap: Get.back,
          child: SDSImageSvg(
            Assets.ASSETS_ICONS_IC_ARROW_LEFT_SVG,
            fit: BoxFit.none,
          ),
        ),
        title: BaseAppBarTitle(
          title: LocaleKeys.login_registerForCode.tr,
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
