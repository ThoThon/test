import 'package:v_bhxh/modules/src.dart';

import '../controller/nfc_controller.dart';

part 'nfc_widget.dart';

class NfcPage extends BaseGetWidget {
  NfcPage({super.key});

  @override
  NfcController get controller => _controller;

  late final _controller = Get.put(NfcController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.declareInfo_title.tr,
        ),
      ),
      body: _buildBody(),
    );
  }
}
