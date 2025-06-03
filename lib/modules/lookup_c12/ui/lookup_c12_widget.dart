part of 'lookup_c12_page.dart';

extension LookupC12Widget on LookupC12Page {
  Widget _buildBody() {
    return SDSSafearea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardMonth(),
                ],
              ),
            ),
            _buildButtonLookUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMonth() {
    return Expanded(
      child: UtilWidget.buildCardBase(
        ListView.separated(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (context, index) => _buildItemMonthView(index),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: AppColors.dsGray5,
          ),
        ),
      ),
    );
  }

  Widget _buildItemMonthView(int index) {
    return Obx(() {
      final month = index + 1;
      final file =
          controller.listFileC12.firstWhereOrNull((e) => e.thang == month);
      final isActive = file != null;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
        child: Row(
          children: [
            Expanded(
              child: SDSBuildText(
                '${LocaleKeys.lookupC12_month.tr} $month',
                style: AppTextStyle.font14Bo,
              ),
            ),
            InkWell(
              onTap: () {
                if (file != null) {
                  Get.toNamed(
                    AppRoutes.viewPdf.path,
                    arguments: ViewPdfArgument(
                      url: file.c12FilePath,
                      title: LocaleKeys.lookupC12_resultDetail.tr,
                      isRotateHorizontall: false,
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isActive ? AppColors.backgroundButton : AppColors.dsGray5,
                  borderRadius: BorderRadius.circular(AppDimens.radius4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingVerySmall,
                  vertical: AppDimens.paddingSmallest,
                ),
                child: SDSBuildText(
                  LocaleKeys.lookupC12_see.tr,
                  style: AppTextStyle.font12Bo.copyWith(
                    color:
                        isActive ? AppColors.primaryColor : AppColors.dsGray3,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildButtonLookUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.defaultPadding),
      child: UtilWidget.buildSolidButton(
        title: LocaleKeys.lookupC12_lookup.tr,
        onPressed: controller.getC12File,
      ),
    );
  }

  Widget _buildActionSelectYear() {
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.only(
            right: AppDimens.defaultPadding,
          ),
          child: InkWell(
            onTap: controller.pickPeriodDate,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingVerySmall,
                vertical: AppDimens.paddingSmallest,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(AppDimens.radius8),
                color: AppColors.basicWhite,
              ),
              child: SDSBuildText(
                '${LocaleKeys.lookupC12_year.tr} ${controller.selectedYear.value.year}',
                style: AppTextStyle.font16Bo
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
        );
      },
    );
  }

}
