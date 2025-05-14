import 'package:v_bhxh/modules/src.dart';

part 'scan_cccd_widget.dart';

class ScanCccdPage extends BaseGetWidget {
  const ScanCccdPage({super.key});

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
