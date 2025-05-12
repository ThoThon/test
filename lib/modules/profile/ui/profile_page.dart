import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';

import '../controller/profile_controller.dart';

part 'profile_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfileController get controller => _controller;

  late final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: SDSBuildText(
          LocaleKeys.profile_accountInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.showDialogLogout,
            icon: Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
          ),
          sdsSBWidth12,
        ],
      ),
      body: _buildBody(),
    );
  }
}
