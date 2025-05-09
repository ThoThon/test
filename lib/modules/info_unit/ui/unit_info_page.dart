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
        title: TextUtils(
          text: LocaleKeys.unitInfo_unitInfo.tr,
          availableStyle: StyleEnum.subBold,
        ),
      ),
      body: baseShowLoading(() => _buildBody()),
    );
  }
}
