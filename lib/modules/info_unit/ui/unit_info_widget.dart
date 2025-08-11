part of 'unit_info_page.dart';

extension UnitInfoWidget on UnitInfoPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildViewInfoItem(),
          _buildButtonChange(),
        ],
      ).paddingOnly(
          top: AppDimens.paddingMedium,
          right: AppDimens.paddingSmallest,
          left: AppDimens.paddingSmallest,
          bottom: AppDimens.paddingSmallest),
    );
  }

  Widget _buildViewInfoItem() {
    return Expanded(
      child: SingleChildScrollView(
        child: Obx(() {
          final isEdit = controller.isEditAll;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndIcon(title: LocaleKeys.unitInfo_unitInfo.tr),
              _buildCardToggle(
                isEdit: isEdit,
                cardEdit: _buildCardUnitInfoEdit(),
                card: _buildCardUnitInfo(),
              ),
              _buildTitleAndIcon(title: LocaleKeys.unitInfo_addressInfo.tr),
              _buildCardToggle(
                isEdit: isEdit,
                cardEdit: _buildCardAddressInfoEdit(),
                card: _buildCardAddressInfo(),
              ),
              _buildTitleAndIcon(title: LocaleKeys.unitInfo_representInfo.tr),
              _buildCardToggle(
                isEdit: isEdit,
                cardEdit: _buildCardRepresentInfoEdit(),
                card: _buildCardRepresentInfo(),
              ),
              _buildTitleAndIcon(
                  title: LocaleKeys.unitInfo_transactionPersonInfo.tr),
              _buildCardToggle(
                isEdit: isEdit,
                cardEdit: _buildCardTraderInfoEdit(),
                card: _buildCardTraderInfo(),
              ),
              _buildTitleAndIcon(title: LocaleKeys.unitInfo_otherInfo.tr),
              _buildCardToggle(
                isEdit: isEdit,
                hasBottomPadding: false,
                cardEdit: _buildCardOtherInfoEdit(),
                card: _buildCardOtherInfo(),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
        }),
      ),
    );
  }

  // Thông tin đơn vị

  List<Widget> _buildCardUnitInfoEdit() {
    return [
      Row(
        children: [
          Expanded(
            child: _buildInputDisable(
              label: LocaleKeys.unitInfo_inputTaxCode.tr,
              controller: controller.taxCodeController,
            ),
          ),
          const SizedBox(width: AppDimens.paddingSmall),
          Expanded(
            child: _buildInputDisable(
              label: LocaleKeys.unitInfo_unitCode.tr,
              controller: controller.unitCodeController,
            ),
          ),
        ],
      ),
      _buildInputItemEdit(
        controller: controller.unitNameController,
        label: LocaleKeys.unitInfo_unitName.tr,
        maxLengthInputForm: 250,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_unitNameCannotEmpty.tr;
          }
          return null;
        },
      ),
      _buildInputDisable(
        label: LocaleKeys.unitInfo_socialAgencyName.tr,
        controller: controller.socialAgencyNameCtrl,
      ),
      _buildInputDisable(
        label: LocaleKeys.unitInfo_socialAgencyCode.tr,
        controller: controller.socialAgencyCodeCtrl,
      ),
    ];
  }

  //Thông tin đơn vị
  List<Widget> _buildCardUnitInfo() {
    return [
      _buildText(
        left: LocaleKeys.unitInfo_inputTaxCode.tr,
        right: controller.taxCodeController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_unitName.tr,
        right: controller.unitNameController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_unitCode.tr,
        right: controller.unitCodeController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_socialAgencyName.tr,
        right: controller.socialAgencyNameCtrl.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_socialAgencyCode.tr,
        right: controller.socialAgencyCodeCtrl.text,
      ),
    ];
  }

  //Thông tin địa chỉ
  List<Widget> _buildCardAddressInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.addressRegisterController,
        label: LocaleKeys.unitInfo_addressRegister.tr,
        maxLengthInputForm: 255,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_addressRegisterCannotEmpty.tr;
          }
          return null;
        },
      ),
      _buildInputItemEdit(
        controller: controller.addressTransactionController,
        label: LocaleKeys.unitInfo_addressTransaction.tr,
        maxLengthInputForm: 255,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_addressTransactionCannotEmpty.tr;
          }
          return null;
        },
      ),
    ];
  }

  //Thông tin địa chỉ
  List<Widget> _buildCardAddressInfo() {
    return [
      _buildText2(
        left: LocaleKeys.unitInfo_addressRegister.tr,
        right: controller.addressRegisterController.text,
      ),
      _buildText2(
        left: LocaleKeys.unitInfo_addressTransaction.tr,
        right: controller.addressTransactionController.text,
      ),
    ];
  }

  //Thông tin người đại diện
  List<Widget> _buildCardRepresentInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.nameRepresentController,
        label: LocaleKeys.unitInfo_represent.tr,
        maxLengthInputForm: 100,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_representCannotEmpty.tr;
          }
          return null;
        },
      ),
      _buildInputItemEdit(
        controller: controller.positionController,
        label: LocaleKeys.unitInfo_position.tr,
        maxLengthInputForm: 50,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_positionCannotEmpty.tr;
          }
          return null;
        },
      ),
    ];
  }

  //Thông tin người đại diện
  List<Widget> _buildCardRepresentInfo() {
    return [
      _buildText(
        left: LocaleKeys.unitInfo_represent.tr,
        right: controller.nameRepresentController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_position.tr,
        right: controller.positionController.text,
      ),
    ];
  }

  //Thông tin người giao dịch
  List<Widget> _buildCardTraderInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.personTransactionController,
        label: LocaleKeys.unitInfo_transactionPerson.tr,
        maxLengthInputForm: 100,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_transactionPersonCannotEmpty.tr;
          }
          return null;
        },
      ),
      _buildInputItemEdit(
        controller: controller.phoneContactController,
        label: LocaleKeys.unitInfo_phoneContact.tr,
        inputFormatters: InputFormatterEnum.phoneNumber,
        maxLengthInputForm: 20,
        textInputType: TextInputType.number,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_phoneContactCannotEmpty.tr;
          }
          return null;
        },
      ),
      _buildInputItemEdit(
        controller: controller.emailContactController,
        label: LocaleKeys.unitInfo_email.tr,
        maxLengthInputForm: 250,
        inputFormatters: InputFormatterEnum.email,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_emailContactIsNotEmpty.tr;
          }
          if (!trimmedValue.isEmailValid) {
            return LocaleKeys.unitInfo_emailIsNotValid.tr;
          }
          return null;
        },
      ),
    ];
  }

  //Thông tin người giao dịch
  List<Widget> _buildCardTraderInfo() {
    return [
      _buildText(
        left: LocaleKeys.unitInfo_transactionPerson.tr,
        right: controller.personTransactionController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_phoneContact.tr,
        right: controller.phoneContactController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_email.tr,
        right: controller.emailContactController.text,
      ),
    ];
  }

  //Thông tin khác
  List<Widget> _buildCardOtherInfoEdit() {
    return [
      CardDropdownWithLabel<PaymentMethodEnum>(
        isRequired: true,
        labelText: LocaleKeys.unitInfo_methodClose.tr,
        textStyle: AppTextStyle.font14Re,
        items: PaymentMethodEnum.values,
        display: (p0) => p0.title.tr,
        selectedItem: controller.selectedMethod.value,
        onChanged: (value) {
          controller.selectedMethod.value = value;
        },
        autovalidateMode: AutovalidateMode.always,
        validator: (value) {
          if (value == null) {
            return "Không được để trống";
          }
          return null;
        },
      ),
      sdsSBHeight12,
      _buildInputItemEdit(
        controller: controller.basicSalaryController,
        label: LocaleKeys.unitInfo_basicSalary.tr,
        inputFormatters: InputFormatterEnum.salaryNormal,
        textInputType: TextInputType.number,
        maxLengthInputForm: 11,
        validator: (value) {
          final trimmedValue = value?.trim();
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_basicSalaryCannotEmpty.tr;
          }
          return null;
        },
      ),
      CardDropdownWithLabel<ReceiveResultEnum>(
        isRequired: true,
        labelText: LocaleKeys.unitInfo_receiveResult.tr,
        textStyle: AppTextStyle.font14Re,
        items: ReceiveResultEnum.values,
        display: (p0) => p0.receive.tr,
        selectedItem: controller.selectedReceive.value,
        onChanged: (value) {
          controller.selectedReceive.value = value;
        },
        autovalidateMode: AutovalidateMode.always,
        validator: (value) {
          if (value == null) {
            return "Không được để trống";
          }
          return null;
        },
      ),
    ];
  }

  //Thông tin khác
  List<Widget> _buildCardOtherInfo() {
    return [
      _buildText(
        left: LocaleKeys.unitInfo_methodClose.tr,
        right: controller.selectedMethod.value?.title.tr ?? '',
      ),
      _buildText(
        left: LocaleKeys.unitInfo_basicSalary.tr,
        right: controller.basicSalaryController.text,
      ),
      _buildText(
        left: LocaleKeys.unitInfo_registerResult.tr,
        right: controller.selectedReceive.value?.receive.tr ?? '',
      ),
    ];
  }

  Widget _buildInputItemEdit({
    required TextEditingController controller,
    required String label,
    int? inputFormatters,
    int? maxLengthInputForm,
    final ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextInputType? textInputType,
  }) {
    return CardInputTextFormWithLabel(
      labelText: label,
      textStyle: AppTextStyle.font14Re,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters ?? InputFormatterEnum.textNormal,
      maxLengthInputForm: maxLengthInputForm,
      isShowCounterText: false,
      isRequired: true,
      autovalidateMode: AutovalidateMode.always,
      onChanged: onChanged,
      textInputType: textInputType ?? TextInputType.text,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  Widget _buildTitleAndIcon({
    required String title,
  }) {
    return Row(
      children: [
        SDSBuildText(
          title,
          style: AppTextStyle.font16Bo,
        ),
      ],
    ).paddingOnly(
      bottom: AppDimens.paddingSmall,
    );
  }

  Widget _buildText({
    int? maxLines,
    TextStyle? style,
    required String left,
    required String right,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SDSBuildText(
            left,
            style: (style ?? AppTextStyle.font14Re).copyWith(
              color: AppColors.dsGray2,
            ),
            maxLines: maxLines ?? 3,
          ),
        ),
        Expanded(
          child: SDSBuildText(
            right,
            style: style ?? AppTextStyle.font14Re,
            maxLines: maxLines ?? 3,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ).paddingOnly(
        bottom: AppDimens.paddingSmallest, top: AppDimens.paddingSmallest);
  }

  //Cho riêng thông tin địa chỉ
  Widget _buildText2({
    int? maxLines,
    TextStyle? style,
    required String left,
    required String right,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          left,
          style: (style ?? AppTextStyle.font14Re).copyWith(
            color: AppColors.dsGray2,
          ),
          maxLines: maxLines ?? 3,
        ),
        if (right.trim().isNotEmpty)
          SDSBuildText(
            right,
            style: style ?? AppTextStyle.font14Re,
            maxLines: maxLines ?? 3,
          ),
      ],
    ).paddingOnly(
      bottom: AppDimens.paddingSmallest,
      top: AppDimens.paddingSmallest,
    );
  }

  Widget _buildButtonChange() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Obx(
          () => Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.defaultPadding,
              right: AppDimens.defaultPadding,
            ),
            child: controller.isEditAll.value
                ? Row(
                    children: [
                      Expanded(
                        child: UtilWidget.buildSolidButton(
                          backgroundColor: AppColors.basicWhite,
                          textStyle: AppTextStyle.font16Bo
                              .copyWith(color: AppColors.basicBlack),
                          title: LocaleKeys.unitInfo_cancel.tr,
                          onPressed: () {
                            controller.handleCancelEdit();
                          },
                          borderRadius: AppDimens.radius30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: UtilWidget.buildSolidButton(
                          title: LocaleKeys.unitInfo_change.tr,
                          onPressed: () async {
                            if (controller.inputIsNotValid() ||
                                controller.isInputUnchanged) {
                              controller.inputInfoIsEmpty();
                              return;
                            }
                            await controller.updateAccountInfo();
                            // controller.isEditAll.value = false;
                          },
                          borderRadius: AppDimens.radius30,
                        ),
                      ),
                    ],
                  )
                : UtilWidget.buildSolidButton(
                    title: LocaleKeys.unitInfo_fix.tr,
                    onPressed: () {
                      controller.isEditAll.value = true;
                    },
                    borderRadius: AppDimens.radius30,
                  ),
          ),
        );
      },
    );
  }

  //Thông tin đơn vị không được sửa, chỉ view thôi
  Widget _buildInputDisable({
    required TextEditingController controller,
    required String label,
  }) {
    return CardInputTextFormWithLabel(
            labelText: label,
            textStyle: AppTextStyle.font14Re,
            controller: controller,
            isReadOnly: true,
            fillColor: AppColors.dsGray6)
        .paddingOnly(bottom: AppDimens.paddingSmall);
  }

  Widget _buildCardToggle({
    required RxBool isEdit,
    required List<Widget> cardEdit,
    required List<Widget> card,
    bool hasBottomPadding = true,
  }) {
    return Padding(
      padding: hasBottomPadding
          ? const EdgeInsets.only(bottom: AppDimens.defaultPadding)
          : EdgeInsets.zero,
      child: isEdit.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cardEdit,
            )
          : UtilWidget.buildCardBase(
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: card,
                ).paddingSymmetric(
                  horizontal: AppDimens.defaultPadding,
                  vertical: AppDimens.paddingSmall,
                ),
              ),
            ),
    );
  }
}
