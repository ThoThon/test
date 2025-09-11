import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/presentation/widgets/base_get_page.dart';
import '../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../register_code/domain/entity/certificate.dart';

part 'register_service_widget.dart';

class RegisterServicePage extends BaseGetPage<RegisterServiceController> {
  RegisterServicePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          title: BaseAppBarTitle(
            textColor: AppColors.basicWhite,
            title: LocaleKeys.registerService_registerTitle.tr,
          ),
        ),
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
