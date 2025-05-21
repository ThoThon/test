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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(LocaleKeys.lookupC12_selectYear.tr),
                    _buildSelectYear(),
                    SDSBuildText(
                      '${LocaleKeys.lookupC12_year.tr} ${controller.selectedYear.value.year}',
                      style: AppTextStyle.font20Re,
                    ),
                    sdsSBHeight8,
                    _buildCardMonth(),
                  ],
                ),
              ),
            ),
            _buildButtonLookUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectYear() {
    final selectedYear = controller.selectedYear.value.year;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
      child: Container(
        height: AppDimens.btnDefaultFigma,
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          border: Border.all(
            width: 1,
            color: AppColors.dsGray3,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ),
        padding: const EdgeInsets.only(left: AppDimens.defaultPadding),
        child: Row(
          children: [
            SDSBuildText(
              '$selectedYear',
              style: AppTextStyle.font14Bo,
            ),
            const Spacer(),
            IconButton(
              onPressed: controller.pickPeriodDate,
              icon: const Icon(Icons.calendar_month),
            ),
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
}
