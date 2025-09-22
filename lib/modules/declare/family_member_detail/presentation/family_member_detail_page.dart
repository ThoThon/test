import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/base_get_page.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/presentation/controller/family_member_detail_controller.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../declare_info/clean/domain/entity/entity_src.dart';
import '../../declare_info/clean/presentation/presentation_src.dart';
part 'family_member_detail_widget.dart';

class FamilyMemberDetailPage
    extends BaseGetPage<FamilyMemberDetailControllerCl> {
  FamilyMemberDetailPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: BaseAppBarTitle(
          title: LocaleKeys.familyMember_title.tr,
        ),
        leading: UtilWidget.buildButtonBackAppbar(),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
