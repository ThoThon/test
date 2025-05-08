part of 'history_register_detail_page.dart';

extension HistoryRegisterDetailWidget on HistoryRegisterDetailPage {
  Widget _buildBody() {
    return GetBuilder<HistoryRegisterDetailControllerICare>(
        init: HistoryRegisterDetailControllerICare(),
        builder: (controller) {
          final HistoryRegisterModel model = controller.historyRegisterModel;
          return Column(
            children: [
              BaseButton(
                text: LocaleKeys.historyRegister_lookup,
                onPressed: () async => await controller.searchProcessDocument(),
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
    HistoryRegisterModel model,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.historyRegister_profileInfo.tr,
          availableStyle: StyleEnum.bodyBold,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        UtilWidget.buildCardBase(
          Column(
            children: [
              _buildProfleInfoItem(
                textLeft: LocaleKeys.historyRegister_profileNumber.tr,
                textRight: model.soHoSo,
              ),
              sdsSBHeight8,
              _buildProfleInfoItem(
                textLeft: LocaleKeys.historyRegister_timeResgiter.tr,
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
  }) {
    return Row(
      children: [
        TextUtils(
          text: textLeft,
          availableStyle: StyleEnum.bodyRegular,
        ),
        Spacer(),
        TextUtils(
          text: textRight,
          availableStyle: StyleEnum.bodyBold,
        ),
      ],
    );
  }

  Widget _buildProgressHandleCard(
    HistoryRegisterModel model,
  ) {
    final QuaTrinhXuLy? quaTrinhXuLy = controller.quaTrinhXuLy1;
    final titles = [
      model.kqBuoc1,
      model.kqBuoc2,
      model.kqBuoc3,
      model.kqBuoc4,
    ];

    final statuses = [
      quaTrinhXuLy?.buoc1?.maKetQua,
      quaTrinhXuLy?.buoc2?.maKetQua,
      quaTrinhXuLy?.buoc3?.maKetQua,
      quaTrinhXuLy?.buoc4?.maKetQua,
    ];

    final isLastSteps = [
      quaTrinhXuLy?.buoc2?.moTaKetQua,
      quaTrinhXuLy?.buoc3?.moTaKetQua,
      quaTrinhXuLy?.buoc4?.moTaKetQua,
      null,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.historyRegister_progressHandle.tr,
          availableStyle: StyleEnum.bodyBold,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        UtilWidget.buildCardBase(
          Column(
            children: List.generate(
              4,
              (index) {
                return _buildStatusItem(
                  status: statuses[index] ?? '',
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
            : (StatusCodeEnum.isValidCode(status))
                ? AppColors.statusGreen
                : AppColors.statusRed,
        borderRadius: BorderRadius.circular(AppDimens.radius30),
      ),
      child: Center(
        child: TextUtils(
          text: numberStep,
          color: AppColors.colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    final connector = DashedLineConnector(
      color: isLastStep != null ? AppColors.statusGreen : AppColors.dsGray5,
    );
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: LocaleKeys.historyRegister_profileCheckResult.tr,
            availableStyle: StyleEnum.bodyBold,
          ),
          TextUtils(
            text: title,
            maxLine: 3,
            availableStyle: StyleEnum.bodyRegular,
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
