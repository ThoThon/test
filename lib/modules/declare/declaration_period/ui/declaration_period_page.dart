import 'package:v_bhxh/modules/src.dart';

part 'declaration_period_widget.dart';

class DeclarationPeriodPage extends BaseGetWidget<DeclarationPeriodController> {
  DeclarationPeriodPage({super.key});

  @override
  DeclarationPeriodController get controller => _controller;

  late final _controller = Get.put(DeclarationPeriodController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Container(
        color: AppColors.primaryColor,
        child: Scaffold(
          appBar: BaseAppBar(
            backgroundColor: AppColors.primaryColor,
            title: BaseAppBarTitle(
              title: LocaleKeys.declarationPeriod_title.tr,
              textColor: AppColors.basicWhite,
            ),
            centerTitle: true,
            leading: UtilWidget.buildButtonBackAppbar(
              color: AppColors.basicWhite,
            ),
            actions: [
              GestureDetector(
                child: SDSImageSvg(Assets.ASSETS_ICONS_IC_FILTER_PERIOD_SVG),
                onTap: () {
                  // TODO
                  controller.showSnackBar('hoàn thành bộ lọc cho đợt đi');
                },
              ),
              sdsSBWidth16,
            ],
          ),
          body: BaseCardBody(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
