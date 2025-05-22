part of 'declaration_period_page.dart';

extension DeclarationPeriodPageWidget on DeclarationPeriodPage {
  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getDeclarationPeriods();
      },
      child: Column(
        children: [
          _buildDatePicker()
              .paddingSymmetric(horizontal: AppDimens.defaultPadding),
          UtilWidget.sizedBox16,
          Expanded(
            child: baseShowLoading(
              () => _buildPeriods(),
            ),
          ),
          _buildBottomButton().paddingAll(AppDimens.defaultPadding),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SDSBuildText(
              '${LocaleKeys.declarationPeriod_month.tr} ${convertDateToString(controller.selectedPeriodDate.value, PATTERN_12)}',
              style: AppTextStyle.font16Bo,
            ),
            UtilWidget.buildSolidButtonBack(
              title: LocaleKeys.declarationPeriod_selectMonth.tr,
              onPressed: () {
                if (controller.isShowLoading.value) {
                  return;
                }

                controller.pickPeriodDate();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPeriods() {
    if (controller.declarationPeriods.isEmpty) {
      return Center(
        child: SDSBuildText(
          LocaleKeys.app_noData.tr,
          style: AppTextStyle.font16Bo,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppDimens.defaultPadding),
      itemCount: controller.declarationPeriods.length,
      itemBuilder: (context, index) {
        final period = controller.declarationPeriods[index];
        return _buildPeriodItem(
          period: period,
          index: index,
        );
      },
    );
  }

  Widget _buildPeriodItem({
    required DeclarationPeriod period,
    required int index,
  }) {
    return Slidable(
      key: ValueKey(period.id),
      enabled: period.status.canEdit,
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (ctx) {
              controller.showDialogDeletePeriod(period);
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            child: SDSBuildText(
              LocaleKeys.app_delete.tr,
              style: AppTextStyle.font20Bo.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : Colors.grey[100],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SDSBuildText(
                    "${LocaleKeys.declarationPeriod_period.tr} ${period.period}",
                    style: AppTextStyle.font16Bo,
                  ),
                  if (period.updateDate != null)
                    SDSBuildText(
                      '${LocaleKeys.declarationPeriod_updateDate.tr}: ${convertDateToStringSafe(period.updateDate, PATTERN_1)}',
                      style: AppTextStyle.font16Re,
                    ),
                  // if (period.fileNumber != null)
                  //   RichText(
                  //     text: TextSpan(
                  //       style: AppTextStyle.font16Re.copyWith(
                  //         fontStyle: FontStyle.italic,
                  //       ),
                  //       children: [
                  //         TextSpan(
                  //           text:
                  //               '${LocaleKeys.declarationPeriod_fileNumber.tr}: ',
                  //         ),
                  //         TextSpan(
                  //           text: period.fileNumber ?? '',
                  //           style: AppTextStyle.font16Bo,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.font16Re.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                      children: [
                        TextSpan(
                          text: '${LocaleKeys.declarationPeriod_status.tr}: ',
                        ),
                        TextSpan(
                          text: period.status.title,
                          style: AppTextStyle.font16Bo.copyWith(
                            color: period.status.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (period.status.canEdit)
              UtilWidget.buildSolidButtonBack(
                title: LocaleKeys.app_edit2.tr,
                onPressed: () {
                  // Get.toNamed(
                  //   AppRoutes.declareInfo.path,
                  //   arguments: DeclareInfoArgument(
                  //     period: period,
                  //     action: DeclareInfoAction.edit,
                  //   ),
                  // );
                  Get.toNamed(AppRoutes.depositInfo.path);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.declarationPeriod_createNewPeriod.tr,
      onPressed: controller.createDeclarationPeriod,
    );
  }
}
