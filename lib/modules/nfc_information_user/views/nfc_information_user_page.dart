import '../../src.dart';
import '../nfc_information_user_src.dart';

part 'nfc_information_user_view.dart';

class NfcInformationUserPage extends BaseGetWidget {
  NfcInformationUserPage({super.key});

  @override
  NfcInformationUserController get controller => _controller;
  late final _controller = Get.put(NfcInformationUserController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(title: "Thông tin"),
      ),
      body: _buildListGuild(controller),
    );
  }
}
