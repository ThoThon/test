import 'package:v_bhxh/clean/core/presentation/widgets/base_get_page.dart';
import 'package:v_bhxh/clean/features/forgot_password/domain/entity/forgot_password_validator.dart';
import 'package:v_bhxh/clean/features/forgot_password/presentation/controller/forgot_password_controller_cl.dart';
import 'package:v_bhxh/modules/src.dart';

part 'forgot_password_widget.dart';

class ForgotPasswordPage extends BaseGetPage<ForgotPasswordControllerCl> {
  ForgotPasswordPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: UtilWidget.shrink),
      body: _buildBody(),
    );
  }
}
