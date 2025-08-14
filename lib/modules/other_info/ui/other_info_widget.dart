part of 'other_info_page.dart';

extension OtherInfoWidget on OtherInfoPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SDSBuildText(
                      LocaleKeys.otherInfo_title.tr,
                      style: AppTextStyle.font16Bo,
                    ),
                    sdsSBWidth8,
                    Tooltip(
                      verticalOffset: -45,
                      margin: const EdgeInsets.only(right: AppDimens.padding32),
                      message: LocaleKeys.otherInfo_titleTooltip.tr,
                      triggerMode: TooltipTriggerMode.tap,
                      child: const Icon(
                        Icons.help_outline,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                UtilWidget.buildCheckboxWithLabel(
                  label: LocaleKeys.declareInfo_attachPaper.tr,
                  value: controller.isAttachPaper.value,
                  onChanged: (value) {
                    controller.isAttachPaper.value = value;
                  },
                ),
                sdsSBHeight12,
                _buildReviewPeriodInput(),
                sdsSBHeight12,
                _buildPhoneNumberInput(),
                sdsSBHeight12,
                _buildAccountNumberInput(),
                sdsSBHeight12,
                _buildBankNameInput(),
                sdsSBHeight12,
                _buildBranchBankInput(),
                sdsSBHeight12,
                _buildUnitHeadInput(),
                sdsSBHeight12,
                _buildReasonExplanationInput(),
              ],
            ),
          ),
        ),
        _buildBottomButton(),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget _buildBottomButton() {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.otherInfo_next.tr,
          onPressed: controller.onTapContinueButton,
          borderRadius: AppDimens.radius30,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
        ).paddingSymmetric(vertical: AppDimens.defaultPadding);
      },
    );
  }

  Widget _buildReviewPeriodInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_reviewPeriod.tr,
      maxLengthInputForm: 2,
      inputFormatters: InputFormatterEnum.phoneNumber,
      textInputType: TextInputType.number,
      controller: controller.reviewPeriodCtrl,
    );
  }

  Widget _buildPhoneNumberInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_phoneNumber.tr,
      hintText: LocaleKeys.otherInfo_inputPhoneNumber.tr,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.phoneNumber,
      textInputType: TextInputType.number,
      controller: controller.phoneNumberCtrl,
    );
  }

  Widget _buildAccountNumberInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_accountNumber.tr,
      maxLengthInputForm: 100,
      hintText: LocaleKeys.otherInfo_inputAccountNumber.tr,
      inputFormatters: InputFormatterEnum.textNormalWithoutSpace,
      controller: controller.accountNumberCtrl,
      validator: (value) {
        final trimmedValue = value?.trim() ?? ' ';

        if (TiengViet.parse(trimmedValue) != trimmedValue) {
          return LocaleKeys.otherInfo_accountNumberIncorrectFormat.tr;
        }
        return null;
      },
    );
  }

  Widget _buildBankNameInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_bankName.tr,
      maxLengthInputForm: 255,
      hintText: LocaleKeys.otherInfo_inputBankName.tr,
      controller: controller.bankNameCtrl,
    );
  }

  Widget _buildBranchBankInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_branch.tr,
      maxLengthInputForm: 255,
      hintText: LocaleKeys.otherInfo_inputBranch.tr,
      controller: controller.branchBankCtrl,
    );
  }

  Widget _buildUnitHeadInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_unitHead.tr,
      maxLengthInputForm: 100,
      hintText: LocaleKeys.otherInfo_inputUnitHead.tr,
      controller: controller.unitHeadCtrl,
    );
  }

  Widget _buildReasonExplanationInput() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.otherInfo_reason.tr,
      maxLengthInputForm: 3000,
      hintText: LocaleKeys.otherInfo_inputReason.tr,
      controller: controller.reasonExplanationCtrl,
    );
  }
}
