import 'package:v_bhxh/shares/base/ui/base_card_body.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../src.dart';

part 'unit_info_widget.dart';

class UnitInfoPage extends BaseGetWidget {
  UnitInfoPage({super.key});

  @override
  UnitInfoControllerImpICare get controller => _controller;

  late final _controller = Get.put(UnitInfoControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: BaseAppBarTitle(
            title: LocaleKeys.unitInfo_unitInfo.tr,
            style: AppTextStyle.font18Bo.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: buildLoadingOverlay(() => baseShowLoading(
              () {
                return BaseCardBody(child: _buildBody());
              },
            )),
      ),
    );
  }
}
