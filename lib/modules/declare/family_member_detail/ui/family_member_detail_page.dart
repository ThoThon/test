import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../model/model_src.dart';

part 'family_member_detail_widget.dart';

class FamilyMemberDetailPage
    extends BaseGetWidget<FamilyMemberDetailController> {
  FamilyMemberDetailPage({super.key});

  @override
  FamilyMemberDetailController get controller => _controller;

  late final _controller = Get.put(FamilyMemberDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.familyMember_title.tr,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
