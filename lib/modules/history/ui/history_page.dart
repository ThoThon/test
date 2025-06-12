import 'package:v_bhxh/modules/history/models/model_src.dart';

import '../../src.dart';

part 'history_widget.dart';

class HistoryPage extends BaseGetWidget {
  HistoryPage({super.key});

  @override
  HistoryController get controller => _controller;

  late final _controller = Get.put(HistoryController());

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        controller.backToHome();
      },
      child: Scaffold(
        appBar: BaseAppBar(
          leading: BackButton(
            onPressed: () {
              controller.backToHome();
            },
          ),
          title: BaseAppBarTitle(
            title: LocaleKeys.history_historyTransaction.tr,
          ),
          actions: [
            _buildActionSelectMonth(),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildActionSelectMonth() {
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.only(right: AppDimens.defaultPadding),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: controller.pickPeriodDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingVerySmall,
                  vertical: AppDimens.paddingSmallest,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  color: AppColors.basicWhite,
                ),
                child: SDSBuildText(
                  '${controller.selectedPeriodDate.value.month}/${controller.selectedPeriodDate.value.year}',
                  style: AppTextStyle.font16Bo
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
