import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';

import '../../declaration_list_src.dart';

part 'declaration_list_preview_pdf_ext.dart';
part 'declaration_list_record_pdf_ext.dart';
part 'declaration_list_widget.dart';

class DeclarationListPage extends BaseGetPage<DeclarationListController> {
  DeclarationListPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          centerTitle: true,
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.declareInfo_listOfDeclarationForm.tr,
            textColor: AppColors.basicWhite,
          ),
        ),
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
