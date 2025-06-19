import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/base/ui/card_input_select_date_with_label.dart';

import '../../../shares/base/ui/card_input_text_form_with_label.dart';

part 'common_info_tab.dart';
part 'register_code_widget.dart';
part 'register_info_tab.dart';

class RegisterCodePage extends BaseGetWidget {
  RegisterCodePage({super.key});

  @override
  RegisterCodeController get controller => _controller;

  late final _controller = Get.put(RegisterCodeController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: BaseAppBarTitle(
          title: 'Đăng ký cấp mã',
        ),
      ),
      body: _buildBody(),
    );
  }
}
