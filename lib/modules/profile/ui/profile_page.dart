import 'package:v_bhxh/shares/log/dio_log.dart';

import '../../../modules/src.dart';

part 'profile_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfileController get controller => _controller;

  late final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.profile_accountInfo.tr,
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
