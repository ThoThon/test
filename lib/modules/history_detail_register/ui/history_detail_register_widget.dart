part of 'history_detail_register_page.dart';

extension HistoryDetailRegisterWidget on HistoryDetailRegisterPage {
  Widget _buildBody() {
    final itemRegister = controller.historyRegisterItem;
    return Column(
      children: [
        UtilWidget.buildSolidButton(
          title: LocaleKeys.history_lookup.tr,
          onPressed: () {
            controller.lookupHistoryRegister();
          },
        ),
        sdsSBHeight8,
        _buildProfileInfoCard(itemRegister),
        _buildProgressHandleCard(itemRegister),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildProfileInfoCard(
    HistoryRegisterItemModel item,
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
                textRight: item.trangThaiTK.titleStatus,
                color: item.trangThaiTK.historyStatusColor,
              ),
              sdsSBHeight8,
              _buildProfleInfoItem(
                textLeft: LocaleKeys.history_profileNumber.tr,
                textRight: item.soHoSo,
              ),
              sdsSBHeight8,
              _buildProfleInfoItem(
                textLeft: LocaleKeys.history_timeResgiter.tr,
                textRight:
                    changeDateString(item.thoiGianGui, pattern: PATTERN_9),
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
    String? textRight,
    required String textLeft,
    Color? color,
  }) {
    return Row(
      children: [
        SDSBuildText(
          textLeft,
        ),
        const Spacer(),
        SDSBuildText(
          textRight ?? '',
          style: AppTextStyle.font14Bo.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressHandleCard(
    HistoryRegisterItemModel item,
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
            item.kqBuoc1,
            item.kqBuoc2,
            item.kqBuoc3,
          ];

    final statuses = [
      resultLookup?.buoc1?.maKetQua ?? '',
      resultLookup?.buoc2?.maKetQua ?? '',
      resultLookup?.buoc3?.maKetQua ?? '',
    ];

    final stepStates = [
      item.trangThaiBuoc1,
      item.trangThaiBuoc2,
      item.trangThaiBuoc3,
    ];

    final isLastSteps = isNewData
        ? [
            resultLookup?.buoc2?.moTaKetQua ?? '',
            resultLookup?.buoc3?.moTaKetQua ?? '',
            null,
          ]
        : [
            item.kqBuoc2 ?? '',
            item.kqBuoc3 ?? '',
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
          ).paddingAll(AppDimens.paddingSmall),
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
    final indicatorColor = _getIndicatorColor(
      isNewData: isNewData,
      status: status,
      stepState: stepState,
    );

    final indicator = Container(
      width: AppDimens.btnRecommend,
      height: AppDimens.btnRecommend,
      decoration: BoxDecoration(
        color: indicatorColor,
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
          ).paddingOnly(top: AppDimens.paddingSmallest),
        ],
      ).paddingAll(AppDimens.paddingVerySmall),
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
}
