part of 'lookup_c12_page.dart';

extension LookupC12Widget on LookupC12Page {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SDSBuildText(LocaleKeys.lookupC12_selectYear.tr),
                  _buildSelectYear(),
                  SDSBuildText(
                    '${LocaleKeys.lookupC12_year.tr} ${controller.selectedYear.value.year}',
                    style: AppTextStyle.font14Bo,
                  ),
                  sdsSBHeight8,
                  _buildCardMonth(),
                ],
              ),
            ),
          ),
          _buildButtonLookUp(),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildSelectYear() {
    return Container(
      height: AppDimens.btnDefaultFigma,
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        border: Border.all(
          width: 1,
          color: AppColors.dsGray3,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radius4),
      ),
      child: Row(
        children: [
          SDSBuildText(
            '${controller.selectedYear.value.year}',
            style: AppTextStyle.font14Bo,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              controller.pickPeriodDate();
            },
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
        ],
      ).paddingOnly(left: AppDimens.defaultPadding),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildCardMonth() {
    return Expanded(
      child: UtilWidget.buildCardBase(
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildItemMonth(index);
          },
          itemCount: 12,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: AppColors.dsGray5,
          ),
        ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
      ),
    );
  }

  Widget _buildItemMonth(int index) {
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            '${LocaleKeys.lookupC12_month.tr} ${index + 1}',
            style: AppTextStyle.font14Bo,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            color: AppColors.backgroundButton,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingVerySmall,
              vertical: AppDimens.paddingSmallest,
            ),
            child: SDSBuildText(
              LocaleKeys.lookupC12_see.tr,
              style:
                  AppTextStyle.font12Bo.copyWith(color: AppColors.primaryColor),
            ),
          ),
        )
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildButtonLookUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.defaultPadding),
      child: UtilWidget.buildSolidButton(title: 'Tra cứu'),
    );
  }
}
