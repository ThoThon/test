part of 'history_detail_page.dart';

extension HistoryDetailWidget on HistoryDetailPage {
  Widget _buildBody() {
    return GetBuilder<HistoryDetailController>(
        init: HistoryDetailController(),
        builder: (controller) {
          // final HistoryItemModel model = controller.historyItemModel;
          final model = controller.historyItemModel;
          return Column(
            children: [
              BaseButton(
                text: LocaleKeys.history_lookup.tr,
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
              sdsSBHeight8,
              _buildProfileInfoCard(model),
              _buildProgressHandleCard(model),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
        });
  }

  Widget _buildProfileInfoCard(
    HistoryItemModel model,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.history_profileInfo.tr,
          style: AppTextStyle.font14Bo,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        UtilWidget.buildCardBase(
          Column(
            children: [
              _buildProfleInfoItem(
                textLeft: LocaleKeys.history_status.tr,
                textRight: model.trangThai.titleStatus,
                color: model.trangThai.historyStatusColor,
              ),
              sdsSBHeight8,
              _buildProfleInfoItem(
                textLeft: LocaleKeys.history_profileNumber.tr,
                textRight: model.soHoSo ?? '',
              ),
              sdsSBHeight8,
              _buildProfleInfoItem(
                textLeft: LocaleKeys.history_timeResgiter.tr,
                textRight:
                    changeDateString(model.thoiGianGui, pattern: PATTERN_9),
              ),
            ],
          ).paddingSymmetric(
            horizontal: AppDimens.defaultPadding,
            vertical: AppDimens.paddingSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildProfleInfoItem({
    required String textRight,
    required String textLeft,
    Color? color,
  }) {
    return Row(
      children: [
        SDSBuildText(
          textLeft,
        ),
        Spacer(),
        SDSBuildText(
          textRight,
          style: AppTextStyle.font14Bo.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressHandleCard(
    HistoryItemModel model,
  ) {
    final titles = [
      model.ketQuaBuoc1 ?? '',
      model.ketQuaBuoc2 ?? '',
      model.ketQuaBuoc3 ?? '',
      model.ketQuaBuoc4 ?? '',
    ];

    final statuses = [
      model.maLoiBuoc1 ?? '',
      model.maLoiBuoc2 ?? '',
      model.maLoiBuoc3 ?? '',
      model.maLoiBuoc4 ?? '',
    ];

    final isLastSteps = [
      model.maLoiBuoc2,
      model.maLoiBuoc3,
      model.maLoiBuoc4,
      null,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.history_progressHandle.tr,
          style: AppTextStyle.font14Bo,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        UtilWidget.buildCardBase(
          Column(
            children: List.generate(
              4,
              (index) {
                return _buildStatusItem(
                  status: statuses[index],
                  numberStep: '${index + 1}',
                  title: titles[index],
                  isLastStep: isLastSteps[index],
                );
              },
            ),
          ).paddingAll(AppDimens.paddingSmall),
        ),
      ],
    ).paddingOnly(top: AppDimens.defaultPadding);
  }

  Widget _buildStatusItem({
    required String numberStep,
    required String title,
    required String status,
    String? isLastStep,
  }) {
    final indicator = Container(
      width: AppDimens.btnRecommend,
      height: AppDimens.btnRecommend,
      decoration: BoxDecoration(
        color: title.isEmpty
            ? AppColors.dsGray5
            : (ResultValidEnum.isValidCode(status))
                ? AppColors.statusGreen
                : AppColors.statusRed,
        borderRadius: BorderRadius.circular(AppDimens.radius30),
      ),
      child: Center(
        child: SDSBuildText(
          numberStep,
          style: AppTextStyle.font14Bo.copyWith(
            color: AppColors.colorWhite,
          ),
        ),
      ),
    );
    final connector = DashedLineConnector(
      color: isLastStep != null
          ? isLastStep.isNotEmpty
              ? AppColors.statusGreen
              : AppColors.dsGray5
          : null,
    );
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SDSBuildText(
            LocaleKeys.history_profileCheckResult.tr,
            style: AppTextStyle.font14Bo,
          ),
          SDSBuildText(
            title,
            maxLines: 3,
          ).paddingOnly(top: AppDimens.paddingSmallest)
        ],
      ).paddingAll(AppDimens.paddingVerySmall),
      node: TimelineNode(
        indicator: indicator,
        endConnector: numberStep == "4" ? null : connector,
        indicatorPosition: 0,
      ),
    );
  }
}
