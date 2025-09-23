import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/src.dart';

part 'staff_list_widget.dart';

class StaffListPage extends BaseGetPage<StaffListController> {
  StaffListPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backgroundColor: AppColors.primaryColor,
        title: BaseAppBarTitle(
          title: LocaleKeys.staffList_title.tr,
          textColor: AppColors.basicWhite,
        ),
        leading: UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
        centerTitle: true,
      ),
      body: BaseCardBody(
        child: baseShowLoading(
          () => _buildBody(),
        ),
      ),
    );
  }
}
