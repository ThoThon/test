import 'package:v_bhxh/modules/register_service/register_service_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'register_service_widget.dart';

class RegisterServicePage extends BaseGetWidget {
  RegisterServicePage({super.key});

  @override
  RegisterServiceController get controller => _controller;

  late final _controller = Get.put(RegisterServiceController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.registerService_registerService.tr,
        ),
      ),
      body: buildLoadingOverlay(
        () => SDSSafearea(
          child: _buildBody(),
        ),
      ),
    );
  }
}
