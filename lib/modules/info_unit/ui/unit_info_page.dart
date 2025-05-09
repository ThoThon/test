import '../../src.dart';

part 'unit_info_widget.dart';

class UnitInfoPage extends BaseGetWidget {
  UnitInfoPage({super.key});

  @override
  UnitInfoControllerImpICare get controller => _controller;

  late final _controller = Get.put(UnitInfoControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: SDSBuildText(
          LocaleKeys.unitInfo_unitInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
      ),
      body: baseShowLoading(() => _buildBody()),
    );
  }
}
