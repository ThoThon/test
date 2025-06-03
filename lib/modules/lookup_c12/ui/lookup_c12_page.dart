import 'package:v_bhxh/modules/lookup_c12/controller/lookup_c12_controller.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';

part 'lookup_c12_widget.dart';

class LookupC12Page extends BaseGetWidget {
  LookupC12Page({super.key});

  @override
  LookupC12Controller get controller => _controller;

  late final _controller = Get.put(LookupC12Controller());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.lookupC12_lookupC12.tr,
        ),
        actions: [
          _buildActionSelectYear(),
        ],
      ),
      body: buildLoadingOverlay(() => _buildBody()),
    );
  }
}
