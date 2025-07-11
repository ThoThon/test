import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/modules/src.dart';

part 'register_service_widget.dart';

class RegisterServicePage extends BaseGetWidget {
  RegisterServicePage({super.key});

  @override
  RegisterServiceController get controller => _controller;

  late final _controller = Get.put(RegisterServiceController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Container(
        color: AppColors.primaryColor,
        child: Scaffold(
          appBar: BaseAppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            leading:
                UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
            title: BaseAppBarTitle(
              textColor: AppColors.basicWhite,
              title: LocaleKeys.registerService_registerService.tr,
            ),
          ),
          body: BaseCardBody(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
