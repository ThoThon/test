part of 'history_detail_declare_page.dart';

extension HistoryDetailDeclareWidget on HistoryDetailDeclarePage {
  Widget _buildBody() {
    final model = controller.declarationHistoryItem;
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
                _buildProfileInfoCard(model),
                _buildProgressHandleCard(model),
              ],
            ),
          ),
        ),
        _buildButtonLookup(model),
      ],
    );
  }

  Widget _buildProfileInfoCard(
    DeclarationHistoryItem model,
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
            textRight: changeDateString(
              model.thoiGianGui,
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
    DeclarationHistoryItem model,
  ) {
    final newData = controller.resultLookupHistoryDeclare != null;
    final resultLookup = controller.resultLookupHistoryDeclare;
    final titles = newData
        ? [
            resultLookup?.buoc1?.moTaKetQua ?? '',
            resultLookup?.buoc2?.moTaKetQua ?? '',
            resultLookup?.buoc3?.moTaKetQua ?? '',
            resultLookup?.buoc4?.moTaKetQua ?? '',
          ]
        : [
            model.ketQuaBuoc1 ?? '',
            model.ketQuaBuoc2 ?? '',
            model.ketQuaBuoc3 ?? '',
            model.ketQuaBuoc4 ?? '',
          ];

    final statuses = newData
        ? [
            resultLookup?.buoc1?.maKetQua ?? '',
            resultLookup?.buoc2?.maKetQua ?? '',
            resultLookup?.buoc3?.maKetQua ?? '',
            resultLookup?.buoc4?.maKetQua ?? '',
          ]
        : [
            model.maLoiBuoc1 ?? '',
            model.maLoiBuoc2 ?? '',
            model.maLoiBuoc3 ?? '',
            model.maLoiBuoc4 ?? '',
          ];

    final isLastSteps = newData
        ? [
            resultLookup?.buoc2?.maKetQua ?? '',
            resultLookup?.buoc3?.maKetQua ?? '',
            resultLookup?.buoc4?.maKetQua ?? '',
            null,
          ]
        : [
            model.maLoiBuoc2,
            model.maLoiBuoc3,
            model.maLoiBuoc4,
            null,
          ];

    final isFail = [
      resultLookup?.buoc1?.isFail,
      resultLookup?.buoc2?.isFail,
      resultLookup?.buoc3?.isFail,
      resultLookup?.buoc4?.isFail,
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
                status: statuses[index],
                numberStep: '${index + 1}',
                title: titles[index],
                isLastStep: isLastSteps[index],
                isFail: isFail[index],
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
    required String status,
    String? isLastStep,
    bool? isFail,
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
            overflow: TextOverflow.visible,
          ).paddingOnly(
            top: AppDimens.paddingSmallest,
            bottom: AppDimens.defaultPadding,
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
      node: TimelineNode(
        indicator: indicator,
        endConnector: numberStep == "4" ? null : connector,
        indicatorPosition: 0,
      ),
    );
  }

  Widget _buildButtonLookup(DeclarationHistoryItem model) {
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
          model.soHoSo?.isNotEmpty ?? false
              ? controller.lookupProgressHistory(model.soHoSo ?? '')
              : controller.getFileNumber(model.id);
        },
      ),
    );
  }
}
