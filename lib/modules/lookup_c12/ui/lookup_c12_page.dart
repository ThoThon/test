import 'package:v_bhxh/modules/src.dart';

part 'lookup_c12_widget.dart';

class LookupC12Page extends BaseGetWidget {
  const LookupC12Page({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.lookupC12_lookupC12.tr,
        ),
      ),
      body: _buildBody(),
    );
  }
}
