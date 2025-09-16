part of 'unit_info_page.dart';

extension UnitInfoExtInput on UnitInfoPage {
  Widget _buildBodyInput() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._buildUnitInfoCardEdit(),
                  ..._buildAddressInfoCardEdit(),
                  ..._buildRepresentInfoCardEdit(),
                  ..._buildTraderInfoCardEdit(),
                  ..._buildOtherInfoCardEdit(),
                ],
              ),
            ),
          ),
          _buildDoubleButton(),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  // Thông tin đơn vị
  List<Widget> _buildUnitInfoCardEdit() {
    return [
      _buildTitle(title: LocaleKeys.unitInfo_unitInfo.tr),
      Row(
        children: [
          Expanded(
            child: _buildInputDisable(
              label: LocaleKeys.unitInfo_inputTaxCode.tr,
              controller: controller.taxCodeController,
            ),
          ),
          sdsSBWidth12,
          Expanded(
            child: _buildInputDisable(
              label: LocaleKeys.unitInfo_unitCode.tr,
              controller: controller.unitCodeController,
            ),
          ),
        ],
      ),
      _buildInputItem(
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

  //Thông tin địa chỉ
  List<Widget> _buildAddressInfoCardEdit() {
    return [
      _buildTitle(title: LocaleKeys.unitInfo_addressInfo.tr),
      _buildInputItem(
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
      _buildInputItem(
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

  //Thông tin người đại diện
  List<Widget> _buildRepresentInfoCardEdit() {
    return [
      _buildTitle(title: LocaleKeys.unitInfo_representInfo.tr),
      _buildInputItem(
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
      _buildInputItem(
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

  //Thông tin người giao dịch
  List<Widget> _buildTraderInfoCardEdit() {
    return [
      _buildTitle(title: LocaleKeys.unitInfo_transactionPersonInfo.tr),
      _buildInputItem(
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
      _buildInputItem(
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
      _buildInputItem(
        controller: controller.emailContactController,
        label: LocaleKeys.unitInfo_emailContact.tr,
        maxLengthInputForm: 250,
        inputFormatters: InputFormatterEnum.textNormalWithoutSpace,
        validator: (value) {
          final trimmedValue = value?.trim() ?? '';
          if (trimmedValue.isEmpty) {
            return LocaleKeys.unitInfo_emailContactIsNotEmpty.tr;
          }
          if (!trimmedValue.isEmailValid) {
            return LocaleKeys.unitInfo_emailContactIncorrectFormat.tr;
          }
          return null;
        },
      ),
    ];
  }

  //Thông tin khác
  List<Widget> _buildOtherInfoCardEdit() {
    return [
      _buildTitle(title: LocaleKeys.unitInfo_otherInfo.tr),
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
            return LocaleKeys.unitInfo_transactionWayIsEmpty.tr;
          }
          return null;
        },
      ),
      sdsSBHeight12,
      _buildInputItem(
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
            return LocaleKeys.unitInfo_receiveMethodIsEmpty.tr;
          }
          return null;
        },
      ),
    ];
  }

  Widget _buildTitle({
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

  Widget _buildInputItem({
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

  Widget _buildDoubleButton() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            Expanded(
              child: UtilWidget.buildSolidButton(
                backgroundColor: AppColors.basicWhite,
                textStyle:
                    AppTextStyle.font16Bo.copyWith(color: AppColors.basicBlack),
                title: LocaleKeys.unitInfo_cancel.tr,
                onPressed: controller.handleCancelEdit,
                borderRadius: AppDimens.radius30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: UtilWidget.buildSolidButton(
                title: LocaleKeys.unitInfo_change.tr,
                onPressed: controller.updateAccountInfo,
                borderRadius: AppDimens.radius30,
              ),
            ),
          ],
        );
      },
    ).paddingOnly(
      bottom: AppDimens.defaultPadding,
      top: AppDimens.paddingSmall,
    );
  }
}
