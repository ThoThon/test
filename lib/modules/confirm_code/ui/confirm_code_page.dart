import 'package:v_bhxh/modules/confirm_code/controller/confirm_code_controller.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part 'confirm_code_widget.dart';

class ConfirmCodePage extends BaseGetWidget {
  ConfirmCodePage({super.key});

  @override
  PinCodeControllerICare get controller => _controller;
  late final _controller = Get.put(PinCodeControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: BaseAppBar(title: LocaleKeys.awaitConfirmSign_activeCode.tr),
      body: _buildBody(),
    );
  }
}
