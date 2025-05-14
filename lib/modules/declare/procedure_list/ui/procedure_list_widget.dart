part of 'procedure_list_page.dart';

extension ProcedureListPageWidget on ProcedureListPage {
  Widget _buildBody() {
    return _buildProcedureList();
  }

  Widget _buildProcedureList() {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: AppDimens.defaultPadding,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildProcedureItem();
      },
      separatorBuilder: (context, index) {
        return UtilWidget.sizedBox16;
      },
    );
  }

  Widget _buildProcedureItem() {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius8),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.paddingVerySmall,
                  horizontal: AppDimens.paddingSmall,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                child: SDSBuildText(
                  '600',
                  style: AppTextStyle.font20Bo.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              UtilWidget.sizedBoxWidth16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      LocaleKeys.procedureList_procedureItemTitle.tr,
                      style: AppTextStyle.font16Bo,
                      maxLines: 3,
                    ),
                    UtilWidget.sizedBox4,
                    SDSBuildText(
                      LocaleKeys.procedureList_procedureItemSubtitle.tr,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          UtilWidget.sizedBox8,
          UtilWidget.buildSolidButtonBack(
            title: LocaleKeys.procedureList_declare.tr,
            onPressed: () {
              Get.toNamed(AppRoutes.declarationPeriod.path);
            },
          ),
        ],
      ),
    );
  }
}
