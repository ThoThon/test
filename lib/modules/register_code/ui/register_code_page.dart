import 'package:v_bhxh/modules/src.dart';

part 'register_code_widget.dart';

class RegisterCodePage extends BaseGetWidget {
  const RegisterCodePage({super.key});

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
