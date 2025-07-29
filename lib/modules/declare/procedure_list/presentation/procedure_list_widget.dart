part of 'procedure_list_page.dart';

extension ProcedureListPageWidget on ProcedureListPage {
  Widget _buildBody() {
    return baseShowLoading(
      () => Obx(
        () {
          final procedures = controller.procedures;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMedium,
            ),
            itemCount: procedures.isEmpty ? 1 : procedures.length + 1,
            separatorBuilder: (_, __) => UtilWidget.sizedBox16,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SDSBuildText(
                  LocaleKeys.declarationPeriod_selectedProcedure.tr,
                  style: AppTextStyle.font16Bo,
                );
              }

              if (procedures.isEmpty) {
                return Center(
                  child: SDSBuildText(
                    LocaleKeys.app_noData.tr,
                    style: AppTextStyle.font16Bo,
                  ),
                );
              }

              final procedure = procedures[index - 1];
              return _buildProcedureItem(procedure: procedure);
            },
          );
        },
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  Widget _buildProcedureItem({
    required Procedure procedure,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius16),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
        color: AppColors.basicWhite,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
              sdsSBWidth8,
              SDSBuildText(
                '${LocaleKeys.procedureList_title.tr} ${procedure.code}',
                style: AppTextStyle.font14Bo.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          sdsSBHeight8,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          sdsSBHeight8,
          SDSBuildText(
            procedure.note,
            maxLines: 3,
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  nav.toNamed(
                    AppRoutesCl.declarationPeriod.path,
                    arguments: procedure,
                  );
                },
                child: Row(
                  children: [
                    SDSBuildText(
                      LocaleKeys.procedureList_declare.tr,
                      style: AppTextStyle.font14Re.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    sdsSBWidth4,
                    SDSImageSvg(
                      Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ],
      ),
    );
  }
}
