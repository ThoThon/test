import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:v_bhxh/modules/login/model/categories_630a/benefit_group_code_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/parental_leave_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/pregnancy_check_condition_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/surrogacy_model.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../base_app/model/app_data.dart';
import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../login/model/categories_630a/declare_form_model.dart';
import '../../login/model/categories_630b/child_birth_condition_model.dart';
import '../../login/model/categories_630b/contraception_model.dart';
import '../../login/model/categories_630b/maternity_leave_model.dart';
import '../../login/model/categories_630b/surgery_pregnancy_32w_model.dart';

part 'benefit_account_info_group_ext_630b.dart';
part 'declare_info_gruop_ext_630b.dart';
part 'person_info_group_ext_630b.dart';

class DeclareInfo630bPage extends BaseGetWidget {
  DeclareInfo630bPage({super.key});

  @override
  DeclareInfo630bControllerImp get controller => _controller;

  late final _controller = Get.put(DeclareInfo630bControllerImp());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        leading: UtilWidget.buildButtonBackAppbar(),
        title: const BaseAppBarTitle(title: 'Thủ tục 630b'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildGroupPersonInfo(),
                    _buildDeclareInfoGroup(),
                    _buildBenefitAccountInfoGroup(),
                  ],
                ),
              ),
            ),
            _buildSaveButton(),
          ],
        ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
      ),
    );
  }

  Widget _buildSaveButton() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.declareInfo_saveButton.tr,
          backgroundColor: AppColors.primaryColor,
          borderRadius: AppDimens.radius30,
          onPressed: () {},
        ).paddingOnly(top: AppDimens.paddingSmall);
      },
    );
  }
}
