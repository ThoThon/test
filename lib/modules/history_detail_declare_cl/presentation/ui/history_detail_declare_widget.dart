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
        _buildButtonLookup(model),
        sdsSBHeight16,
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget _buildProfileInfoCard(
    DeclarationHistoryItem? item,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Column(
        children: [
          _buildProfleInfoItem(
            textLeft: LocaleKeys.history_status.tr,
            textRight: item?.status.titleStatus ?? '',
            color: item?.status.historyStatusColor,
          ),
          sdsSBHeight8,
          _buildProfleInfoItem(
            textLeft: LocaleKeys.history_profileNumber.tr,
            textRight: item?.dossierNumber ?? '',
          ),
          sdsSBHeight8,
          _buildProfleInfoItem(
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

  Widget _buildProfleInfoItem({
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

  Widget _buildProgressHandleCard(
    DeclarationHistoryItem? item,
  ) {
    // Kết quả các bước
    final resultStep = [
      item?.step1Result ?? '',
      item?.step2Result ?? '',
      item?.step3Result ?? '',
      item?.step4Result ?? '',
    ];

    // Mã lỗi các bước
    final errorStep = [
      item?.step1ErrorCode ?? '',
      item?.step2ErrorCode ?? '',
      item?.step3ErrorCode ?? '',
      item?.step4ErrorCode ?? '',
    ];

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
            (index) {
              return _buildStatusItem(
                errorStep: errorStep[index],
                numberStep: '${index + 1}',
                title: resultStep[index],
                isLastStep: index == resultStep.length - 1,
              );
            },
          ),
        ),
      ],
    ).paddingOnly(top: AppDimens.defaultPadding);
  }

  Widget _buildStatusItem({
    required String numberStep,
    required String title,
    required String errorStep,
    required bool isLastStep,
  }) {
    final indicator = Container(
      width: AppDimens.btnRecommend,
      height: AppDimens.btnRecommend,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        color: title.isEmpty ? AppColors.dsGray5 : _colorStepIsValid(errorStep),
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
      thickness: 1.5,
      gap: 6,
      dash: 3,
      color: title.isNotEmpty ? AppColors.statusGreen : AppColors.dsGray5,
    );

    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      node: TimelineNode(
        indicator: indicator,
        indicatorPosition: 0,
        endConnector: isLastStep ? null : connector,
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
            title,
            overflow: TextOverflow.visible,
          ),
          sdsSBHeight16,
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
    );
  }

  Widget _buildButtonLookup(DeclarationHistoryItem? model) {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font16Re.copyWith(color: AppColors.basicWhite),
      title: LocaleKeys.history_lookup.tr,
      onPressed: () {
        model?.dossierNumber?.isNotEmpty ?? false
            ? controller.lookupProgressHistory(model?.dossierNumber ?? '')
            : controller.getFileNumber(model?.id ?? '');
      },
    );
  }

  // Phải dựa vào "maLoiBuocX" trả về để biết trạng thái của bước đó
  Color _colorStepIsValid(String errorCode) {
    return ResultValidEnum.isValidCode(errorCode)
        ? AppColors.statusGreen
        : AppColors.statusRed;
  }
}
