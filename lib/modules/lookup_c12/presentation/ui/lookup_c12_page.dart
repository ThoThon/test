import 'package:v_bhxh/modules/src.dart';

import '../../../../../clean/core/presentation/widgets/base_get_page.dart';
import '../../../../../clean/routes/app_routes_cl.dart';
import '../../../view_pdf/model/view_pdf_argument.dart';
import '../controller/lookup_c12_controller.dart';

part 'lookup_c12_widget.dart';

class LookupC12ClPage extends BaseGetPage<LookupC12Controller> {
  LookupC12ClPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          leading: UtilWidget.buildButtonBackAppbar(color: Colors.white),
          title: BaseAppBarTitle(
            title: LocaleKeys.lookupC12_lookupC12.tr,
            textColor: Colors.white,
          ),
          actions: [
            _buildActionSelectYear(),
          ],
        ),
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
