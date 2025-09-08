part of 'lookup_c12_page.dart';

extension LookupC12Widget on LookupC12ClPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          sdsSBHeight16,
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardMonth(),
                ],
              ),
            ),
          ),
          _buildButtonLookUp(),
        ],
      ),
    );
  }

  Widget _buildCardMonth() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppConst.countMonth,
      itemBuilder: (context, index) => _buildItemMonthView(index),
      separatorBuilder: (context, index) => sdsSBHeight12,
    );
  }

  Widget _buildItemMonthView(int index) {
    return Obx(
      () {
        final month = index + 1;
        final file =
            controller.listFileC12.firstWhereOrNull((e) => e.month == month);
        final isActive = file != null;

        return Container(
          decoration: BoxDecoration(
            color: isActive ? AppColors.basicWhite : AppColors.dsGray6,
            borderRadius: BorderRadius.circular(AppDimens.radius8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingSmall,
                horizontal: AppDimens.defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: SDSBuildText(
                    '${LocaleKeys.lookupC12_month.tr} $month',
                    style: (AppTextStyle.font16Re).copyWith(
                        color:
                            isActive ? AppColors.dsGray1 : AppColors.dsGray3),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (file != null) {
                      nav.toNamed(
                        AppRoutesCl.viewPdf.path,
                        arguments: ViewPdfArgument(
                          url: file.c12FilePath,
                          title: "${LocaleKeys.lookupC12_month.tr} $month ",
                          isRotateHorizontal: false,
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingSmallest,
                      vertical: AppDimens.paddingSmallest,
                    ),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: isActive ? AppColors.dsGray1 : AppColors.dsGray3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtonLookUp() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimens.defaultPadding,
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: AppDimens.paddingVerySmall,
      ),
      child: UtilWidget.buildSolidButton(
        title: LocaleKeys.lookupC12_lookup.tr,
        borderRadius: AppDimens.radius30,
        onPressed: controller.getC12File,
      ),
    );
  }

  Widget _buildActionSelectYear() {
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
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    SDSBuildText(
                      '${controller.selectedYear.value.year}',
                      style: AppTextStyle.font14Bo
                          .copyWith(color: AppColors.basicWhite),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.basicWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
