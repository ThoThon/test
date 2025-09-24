import 'package:v_bhxh/modules/selected_staff/domain/entity/staff_info.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/presentation/widgets/base_get_page.dart';
import '../controller/selected_staff_controller.dart';

part 'selected_staff_widget.dart';

class SelectStaffPage extends BaseGetPage<SelectStaffController> {
  SelectStaffPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: BaseAppBarTitle(title: LocaleKeys.staffList_selectedStaff.tr),
        leading: UtilWidget.buildButtonBackAppbar(),
      ),
      body: SafeArea(child: _buildBody()),
    );
  }
}
