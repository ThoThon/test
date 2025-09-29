part of 'history_detail_register_page.dart';

extension HistoryDetailRegisterWidget on HistoryDetailRegisterPage {
  Widget _buildBody() {
    final itemRegister = controller.registerHistoryItem;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              AppDimens.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  LocaleKeys.history_profileInfo.tr,
                  style: AppTextStyle.font14Bo,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                _buildProfileInfoCard(itemRegister),
                _buildProgressHandleCard(itemRegister),
              ],
            ),
          ),
        ),
        _buildButtonLookup(),
      ],
    );
  }

  Widget _buildProfileInfoCard(
    RegisterHistoryItem item,
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
            textRight: item.status.titleStatus,
            color: item.status.historyStatusColor,
          ),
          sdsSBHeight8,
          _buildProfleInfoItem(
            textLeft: LocaleKeys.history_profileNumber.tr,
            textRight: item.dossierNumber,
          ),
          sdsSBHeight8,
          _buildProfleInfoItem(
            textLeft: LocaleKeys.history_timeResgiter.tr,
            textRight: changeDateString(
              item.submissionTime,
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
    String? textRight,
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
          textRight ?? '',
          style: AppTextStyle.font14Re.copyWith(
            color: color ?? AppColors.dsGray1,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressHandleCard(
    RegisterHistoryItem item,
  ) {
    final isNewData = controller.resultLookupHistoryRegister != null;
    final resultLookup = controller.resultLookupHistoryRegister;

    final titles = isNewData
        ? [
            resultLookup?.buoc1?.moTaKetQua ?? '',
            resultLookup?.buoc2?.moTaKetQua ?? '',
            resultLookup?.buoc3?.moTaKetQua ?? '',
          ]
        : [
            item.step1Result,
            item.step2Result,
            item.step3Result,
          ];

    final statuses = [
      resultLookup?.buoc1?.maKetQua ?? '',
      resultLookup?.buoc2?.maKetQua ?? '',
      resultLookup?.buoc3?.maKetQua ?? '',
    ];

    final stepStates = [
      item.step1Status,
      item.step2Status,
      item.step3Status,
    ];

    final isLastSteps = isNewData
        ? [
            resultLookup?.buoc2?.moTaKetQua ?? '',
            resultLookup?.buoc3?.moTaKetQua ?? '',
            null,
          ]
        : [
            item.step2Result ?? '',
            item.step3Result ?? '',
            null,
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
            3,
            (index) {
              return _buildStatusItem(
                status: statuses[index],
                numberStep: '${index + 1}',
                title: titles[index] ?? '',
                isLastStep: isLastSteps[index],
                isNewData: isNewData,
                stepState: stepStates[index],
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
    required String? status,
    String? isLastStep,
    required bool isNewData,
    bool? stepState,
  }) {
    final indicator = Container(
      width: AppDimens.btnRecommend,
      height: AppDimens.btnRecommend,
      decoration: BoxDecoration(
        color: _getIndicatorColor(
          isNewData: isNewData,
          status: status,
          stepState: stepState,
        ),
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
      thickness: 1.5,
      gap: 6,
      dash: 3,
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
            maxLines: 4,
          ).paddingOnly(
            top: AppDimens.paddingSmallest,
            bottom: AppDimens.defaultPadding,
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
      node: TimelineNode(
        indicator: indicator,
        endConnector: numberStep == "3" ? null : connector,
        indicatorPosition: 0,
      ),
    );
  }

  Color _getIndicatorColor({
    required bool isNewData,
    required String? status,
    required bool? stepState,
  }) {
    if (isNewData) {
      if (status == null || status.isEmpty) return AppColors.dsGray5;
      return ResultValidEnum.isValidCode(status)
          ? AppColors.statusGreen
          : AppColors.statusRed;
    } else {
      if (stepState == true) return AppColors.statusGreen;
      if (stepState == false) return AppColors.statusRed;
      return AppColors.dsGray5;
    }
  }

  Widget _buildButtonLookup() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        top: AppDimens.paddingSmall,
        bottom: AppDimens.padding32,
      ),
      child: UtilWidget.buildSolidButton(
        borderRadius: AppDimens.radius30,
        textStyle: AppTextStyle.font16Re.copyWith(color: AppColors.basicWhite),
        title: LocaleKeys.history_lookup.tr,
        onPressed: () {
          controller.lookupHistoryRegister();
        },
      ),
    );
  }
}
