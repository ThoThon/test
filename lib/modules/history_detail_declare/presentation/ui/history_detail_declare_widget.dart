part of 'history_detail_declare_page.dart';

extension HistoryDetailDeclareWidget on HistoryDetailDeclarePage {
  Widget _buildBody() {
    final model = controller.historyDeclareItem.value;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  LocaleKeys.history_profileInfo.tr,
                  style: AppTextStyle.font14Bo,
                ),
                sdsSBHeight8,
                _buildProfileInfoCard(model),
                _buildProgressHandleCard(model),
              ],
            ),
          ),
        ),
        _buildButtonLookup(),
        sdsSBHeight16,
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget _buildProfileInfoCard(DeclarationHistoryItem? item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Column(
        children: [
          _buildProfileInfoItem(
            textLeft: LocaleKeys.history_status.tr,
            textRight: item?.status.titleStatus ?? '',
            color: item?.status.historyStatusColor,
          ),
          sdsSBHeight8,
          _buildProfileInfoItem(
            textLeft: LocaleKeys.history_profileNumber.tr,
            textRight: item?.dossierNumber ?? '',
          ),
          sdsSBHeight8,
          _buildProfileInfoItem(
            textLeft: LocaleKeys.history_timeResgiter.tr,
            textRight: changeDateString(
              item?.submissionTime ?? '',
              pattern: PATTERN_14,
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: AppDimens.paddingSmall,
      ),
    );
  }

  Widget _buildProfileInfoItem({
    required String textRight,
    required String textLeft,
    Color? color,
  }) {
    return Row(
      children: [
        SDSBuildText(
          textLeft,
          style: AppTextStyle.font14Re.copyWith(color: AppColors.dsGray1),
        ),
        const Spacer(),
        SDSBuildText(
          textRight,
          style: AppTextStyle.font14Re.copyWith(
            color: color ?? AppColors.dsGray1,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressHandleCard(DeclarationHistoryItem? item) {
    if (item == null) return const SizedBox.shrink();

    // Kết quả các bước
    final steps = item.steps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.history_progressHandle.tr,
          style: AppTextStyle.font14Bo,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        Column(
          children: List.generate(
            4,
            (index) => _buildStatusItem(
              index: index + 1,
              stepResult: steps[index].result,
              stepStatus: steps[index].status,
              // Kiểm tra nếu bước tiếp theo có dữ liệu (cho bước 1-3) để đặt màu connector xanh
              // Bước 4 không cần kiểm tra (false vì không có connector)
              hasNextData:
                  index < 3 ? steps[index + 1].result.isNotEmpty : false,
            ),
          ),
        ),
      ],
    ).paddingOnly(top: AppDimens.defaultPadding);
  }

  Widget _buildStatusItem({
    required int index,
    required String stepResult,
    required bool stepStatus,
    required bool hasNextData,
  }) {
    final connector = DashedLineConnector(
      thickness: 1.5,
      gap: 6,
      dash: 3,
      color: hasNextData ? AppColors.statusGreen : AppColors.dsGray5,
    );

    final indicator = Container(
      width: AppDimens.btnRecommend,
      height: AppDimens.btnRecommend,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        color: stepResult.isEmpty
            ? AppColors.dsGray5
            : (stepStatus ? AppColors.statusGreen : AppColors.statusRed),
      ),
      child: Center(
        child: SDSBuildText(
          '$index',
          style: AppTextStyle.font14Bo.copyWith(
            color: AppColors.colorWhite,
          ),
        ),
      ),
    );

    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      node: TimelineNode(
        indicator: indicator,
        indicatorPosition: 0,
        endConnector: index == 4 ? null : connector,
      ),
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SDSBuildText(
            LocaleKeys.history_profileCheckResult.tr,
            style: AppTextStyle.font14Bo,
          ),
          sdsSBHeight4,
          SDSBuildText(
            stepResult,
            overflow: TextOverflow.visible,
            style: AppTextStyle.font14Re.copyWith(color: AppColors.basicBlack),
          ),
          sdsSBHeight16,
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
    );
  }

  Widget _buildButtonLookup() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font16Re.copyWith(color: AppColors.basicWhite),
      title: LocaleKeys.history_lookup.tr,
      onPressed: controller.lookupProgressHistory,
    );
  }
}
