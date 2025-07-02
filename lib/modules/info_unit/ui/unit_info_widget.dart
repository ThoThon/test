part of 'unit_info_page.dart';

extension UnitInfoWidget on UnitInfoPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildViewInfoItem(),
          _buildButtonChange(),
        ],
      ).paddingSymmetric(
          vertical: AppDimens.paddingSmallest,
          horizontal: AppDimens.paddingSmallest),
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
                cardEdit: _buildCardOtherInfoEdit(),
                card: _buildCardOtherInfo(),
              ),
            ],
          )
              .paddingSymmetric(horizontal: AppDimens.defaultPadding)
              .paddingOnly();
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
          "${LocaleKeys.unitInfo_inputTaxCode.tr}: ${controller.taxCodeController.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_unitName.tr}: ${controller.unitNameController.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_unitCode.tr}: ${controller.unitCodeController.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_socialAgencyName.tr}: ${controller.socialAgencyNameCtrl.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_socialAgencyCode.tr}: ${controller.socialAgencyCodeCtrl.text}"),
    ];
  }

  //Thông tin địa chỉ
  List<Widget> _buildCardAddressInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.addressRegisterController,
        label: LocaleKeys.unitInfo_addressRegister.tr,
        maxLengthInputForm: 255,
      ),
      _buildInputItemEdit(
        controller: controller.addressTransactionController,
        label: LocaleKeys.unitInfo_addressTransaction.tr,
        maxLengthInputForm: 255,
      ),
    ];
  }

  //Thông tin địa chỉ
  List<Widget> _buildCardAddressInfo() {
    return [
      _buildText(
          "${LocaleKeys.unitInfo_addressRegisterDKKD.tr} ${controller.addressRegisterController.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_addressTransaction.tr}: ${controller.addressTransactionController.text}"),
    ];
  }

  //Thông tin người đại diện
  List<Widget> _buildCardRepresentInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.nameRepresentController,
        label: LocaleKeys.unitInfo_represent.tr,
        maxLengthInputForm: 100,
      ),
      _buildInputItemEdit(
        controller: controller.positionController,
        label: LocaleKeys.unitInfo_position.tr,
        maxLengthInputForm: 50,
      ),
    ];
  }

  //Thông tin người đại diện
  List<Widget> _buildCardRepresentInfo() {
    return [
      _buildText(
        "${LocaleKeys.unitInfo_represent.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_position.tr}: ${controller.positionController.text}",
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
      ),
      _buildInputItemEdit(
        controller: controller.phoneContactController,
        label: LocaleKeys.unitInfo_phoneContact.tr,
        inputFormatters: InputFormatterEnum.phoneNumber,
        maxLengthInputForm: 20,
        textInputType: TextInputType.number,
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
        "${LocaleKeys.unitInfo_transactionPerson.tr}: ${controller.personTransactionController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_phoneContact.tr}: ${controller.phoneContactController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_email.tr}: ${controller.emailContactController.text}",
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
      ),
      sdsSBHeight12,
      _buildInputItemEdit(
        controller: controller.basicSalaryController,
        label: LocaleKeys.unitInfo_basicSalary.tr,
        inputFormatters: InputFormatterEnum.salaryNormal,
        textInputType: TextInputType.number,
        maxLengthInputForm: 11,
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
      ),
      sdsSBHeight12,
    ];
  }

  //Thông tin khác
  List<Widget> _buildCardOtherInfo() {
    return [
      _buildText(
        "${LocaleKeys.unitInfo_methodClose.tr}: ${controller.selectedMethod.value?.title.tr ?? ''}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_basicSalary.tr}: ${controller.basicSalaryController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_registerResult.tr}: ${controller.selectedReceive.value?.receive.tr ?? ''}",
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
      bottom: AppDimens.defaultPadding,
    );
  }

  Widget _buildText(
    String text, {
    int? maxLines,
    TextStyle? style,
  }) {
    final int colonIndex = text.indexOf(':');
    String left = text;
    String right = '';
    if (colonIndex != -1) {
      left = text.substring(0, colonIndex + 1);
      right = text.substring(colonIndex + 1).trim();
    }

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

  Widget _buildButtonChange() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(
            left: AppDimens.defaultPadding,
            right: AppDimens.defaultPadding,
          ),
          child: UtilWidget.buildSolidButton(
            title: controller.isEditAll.value
                ? LocaleKeys.unitInfo_change.tr
                : LocaleKeys.unitInfo_fix.tr,
            onPressed: () async {
              if (controller.isEditAll.value) {
                await controller.updateAccountInfo();
                controller.isEditAll.value = false;
              } else {
                controller.isEditAll.value = true;
              }
            },
            borderRadius: AppDimens.radius30,
          ),
        ));
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
