part of 'procedure_list_page.dart';

extension ProcedureListPageWidget on ProcedureListPage {
  Widget _buildBody() {
    return baseShowLoading(() => _buildProcedureList());
  }

  Widget _buildProcedureList() {
    return Obx(
      () {
        if (controller.procedures.isEmpty) {
          return Center(
            child: SDSBuildText(
              LocaleKeys.app_noData.tr,
              style: AppTextStyle.font16Bo,
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.only(
            left: AppDimens.defaultPadding,
            right: AppDimens.defaultPadding,
            bottom: AppDimens.defaultPadding,
          ),
          itemCount: controller.procedures.length,
          itemBuilder: (context, index) {
            final procedure = controller.procedures[index];
            return _buildProcedureItem(procedure: procedure);
          },
          separatorBuilder: (context, index) {
            return UtilWidget.sizedBox16;
          },
        );
      },
    );
  }

  Widget _buildProcedureItem({
    required Procedure procedure,
  }) {
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
                  procedure.ma,
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
                      procedure.ten,
                      style: AppTextStyle.font16Bo,
                      maxLines: 3,
                    ),
                    UtilWidget.sizedBox4,
                    SDSBuildText(
                      procedure.ghiChu,
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
