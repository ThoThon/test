import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/controller/controller_src.dart';
import 'package:v_bhxh/modules/src.dart';

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
      appBar: const BaseAppBar(
        title: BaseAppBarTitle(
          title: 'Thành viên trong gia đình',
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
