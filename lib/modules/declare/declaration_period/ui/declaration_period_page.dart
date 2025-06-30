import 'package:flutter_slidable/flutter_slidable.dart';
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
              textStyle:
                  AppTextStyle.font18Bo.copyWith(color: AppColors.basicWhite),
            ),
            centerTitle: true,
            leading: UtilWidget.buildButtonBackAppbar(
              color: AppColors.basicWhite,
            ),
          ),
          body: SafeArea(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
