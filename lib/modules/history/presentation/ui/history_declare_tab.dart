part of 'history_page.dart';

extension HistoryDeclareTab on HistoryPage {
  Widget _buildHistoryDeclare() {
    return baseShowLoading(
      () {
        if (controller.listHistoryDeclare.isEmpty) {
          return UtilWidget.buildEmptyOnRefresh(
            refreshController: controller.declareRefreshCtrl,
            onRefresh: controller.onRefreshDeclare,
          );
        }
        return UtilWidget.buildSmartRefresher(
          refreshController: controller.declareRefreshCtrl,
          onRefresh: controller.onRefreshDeclare,
          onLoadMore: controller.onLoadMoreDeclare,
          enablePullUp: true,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = controller.listHistoryDeclare[index];
              return _buildCardItemHistoryDeclare(item);
            },
            itemCount: controller.listHistoryDeclare.length,
            separatorBuilder: (context, index) => sdsSBHeight12,
          ),
        );
      },
    );
  }

  Widget _buildCardItemHistoryDeclare(DeclarationHistoryItem item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(
          AppDimens.radius16,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sdsSBHeight12,
          _buildCardStatus(item),
          sdsSBHeight12,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          sdsSBHeight8,
          _buildTitleProcedure(item),
          sdsSBHeight8,
          _buildTimeAndLookup(item),
          sdsSBHeight8,
        ],
      ),
    );
  }

  Widget _buildCardStatus(DeclarationHistoryItem item) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingVerySmall,
            vertical: AppDimens.paddingSmallest,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.radius16),
            color: item.status.cardStatusColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: item.status.historyStatusColor,
                  shape: BoxShape.circle,
                ),
              ),
              sdsSBWidth8,
              SDSBuildText(
                item.status.titleStatus,
                style: AppTextStyle.font12Re.copyWith(
                  color: item.status.historyStatusColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            controller.getDeclarationHistoryRecordList(
              keyMap: item.id,
            );
          },
          child: SDSImageSvg(Assets.ASSETS_ICONS_IC_EYE_SVG),
        )
      ],
    ).paddingSymmetric(
      horizontal: AppDimens.defaultPadding,
    );
  }

  Widget _buildTitleProcedure(DeclarationHistoryItem item) {
    return Row(
      children: [
        SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
        sdsSBWidth8,
        SDSBuildText(
          "${LocaleKeys.history_procedure.tr} ${item.procedureCode}${LocaleKeys.history_number.tr}",
          style: AppTextStyle.font14Bo,
        ),
        if (item.dossierNumber?.isNotEmpty ?? false)
          Expanded(
            child: SDSBuildText(
              item.dossierNumber ?? '',
              style: AppTextStyle.font14Bo,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildTimeAndLookup(DeclarationHistoryItem item) {
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            changeDateString(item.submissionTime, pattern: PATTERN_14),
            style: AppTextStyle.font12Re.copyWith(color: AppColors.dsGray2),
            maxLines: 1,
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(
              AppRoutesCl.historyDetailDeclare.path,
              arguments: item,
            )?.then(
              (value) async {
                controller.listHistoryDeclare.clear();
                await controller.getHistoryDeclare();
              },
            );
          },
          child: Row(
            children: [
              SDSBuildText(
                LocaleKeys.history_lookup.tr,
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
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
