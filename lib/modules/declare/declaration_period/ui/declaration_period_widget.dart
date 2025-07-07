part of 'declaration_period_page.dart';

extension DeclarationPeriodPageWidget on DeclarationPeriodPage {
  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: controller.getDeclarationPeriods,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimens.defaultPadding,
          AppDimens.defaultPadding,
          AppDimens.defaultPadding,
          AppDimens.padding32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDatePicker(),
            UtilWidget.sizedBox16,
            Expanded(child: baseShowLoading(_buildPeriods)),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Obx(
      () {
        return InkWell(
          onTap: () {
            if (controller.isShowLoading.value) {
              return;
            }
            controller.pickPeriodDate();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.paddingSmallest,
              horizontal: AppDimens.paddingVerySmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.basicWhite,
              borderRadius: BorderRadius.circular(
                AppDimens.radius20,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SDSBuildText(
                  '${LocaleKeys.declarationPeriod_month.tr} ${convertDateToString(controller.selectedPeriodDate.value, PATTERN_12)}',
                  style: AppTextStyle.font16Bo,
                ),
                sdsSBWidth4,
                SDSImageSvg(Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG)
              ],
            ),
          ),
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

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: AppDimens.defaultPadding),
      itemCount: controller.declarationPeriods.length,
      separatorBuilder: (context, index) => sdsSBHeight16,
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
    return Container(
      padding: const EdgeInsets.only(
        top: AppDimens.defaultPadding,
        bottom: AppDimens.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildCardStatus(
                index: index,
                period: period,
              ),
              const Spacer(),
              if (period.status.canEdit)
                Padding(
                  padding: const EdgeInsets.only(right: AppDimens.paddingSmall),
                  child: InkWell(
                    onTap: () {
                      controller.showDialogDeletePeriod(period);
                    },
                    child: const Icon(Icons.delete_outline),
                  ),
                )
            ],
          ),
          sdsSBHeight12,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          sdsSBHeight8,
          _buildPeriodNumber(period: period),
          sdsSBHeight12,
          _buildDateAndButton(period),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font16Re.copyWith(color: AppColors.basicWhite),
      title: LocaleKeys.declarationPeriod_createNewPeriod.tr,
      onPressed: controller.createDeclarationPeriod,
    );
  }

  Widget _buildCardStatus({
    required DeclarationPeriod period,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingSmallest,
        ),
        decoration: BoxDecoration(
          color: period.status.cardColor,
          borderRadius: BorderRadius.circular(AppDimens.radius16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: period.status.color,
                shape: BoxShape.circle,
              ),
            ),
            sdsSBWidth8,
            SDSBuildText(
              period.status.title,
              style: AppTextStyle.font14Re.copyWith(color: period.status.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodNumber({
    required DeclarationPeriod period,
  }) {
    return Row(
      children: [
        SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
        sdsSBWidth8,
        SDSBuildText(
          "${LocaleKeys.declarationPeriod_period.tr} ${period.period}",
          style: AppTextStyle.font16Bo,
        ),
        if (period.fileNumber != null)
          SDSBuildText(
            ' - Số ${period.fileNumber}',
            style: AppTextStyle.font16Bo,
          ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildDateAndButton(DeclarationPeriod period) {
    return Row(
      children: [
        if (period.updateDate != null || period.createTime != null)
          SDSBuildText(
            '${convertDateToStringSafe(period.updateDate ?? period.createTime, PATTERN_14)}',
            style: AppTextStyle.font14Re.copyWith(color: Colors.grey),
          ),
        const Spacer(),
        if (period.status.canEdit)
          InkWell(
            onTap: () {
              controller.editDeclarationPeriod(period);
            },
            child: Row(
              children: [
                SDSBuildText(
                  LocaleKeys.app_edit2.tr,
                  style: AppTextStyle.font14Re.copyWith(color: Colors.grey),
                ),
                sdsSBWidth4,
                SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                  color: Colors.grey,
                ),
              ],
            ),
          )
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
