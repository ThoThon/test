part of 'procedure_list_page.dart';

extension ProcedureListPageWidget on ProcedureListPage {
  Widget _buildBody() {
    return baseShowLoading(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.paddingMedium,
              top: AppDimens.defaultPadding,
            ),
            child: SDSBuildText(
              LocaleKeys.declarationPeriod_selectedProcedure.tr,
              style: AppTextStyle.font16Bo,
            ),
          ),
          Expanded(child: _buildProcedureList())
        ],
      ),
    );
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingMedium,
            vertical: AppDimens.defaultPadding,
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
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius16),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          color: AppColors.basicWhite),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
              sdsSBWidth8,
              SDSBuildText(
                procedure.code,
                style: AppTextStyle.font14Bo.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          sdsSBHeight8,
          const Divider(
            height: 1,
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
                  Get.toNamed(
                    AppRoutes.declarationPeriod.path,
                    arguments: procedure,
                  );
                },
                child: Row(
                  children: [
                    SDSBuildText(
                      LocaleKeys.procedureList_declare.tr,
                      style: AppTextStyle.font14Re
                          .copyWith(color: AppColors.primaryColor),
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
