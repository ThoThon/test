part of '../general_info_tab_page.dart';

extension GeneralInfoTabWidget on GeneralInfoTabPage {
  Widget _buildBody() {
    return Form(
      key: controller.formKeyTabGeneral,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => _buildCardToggle(
              title: LocaleKeys.transaction_unitInfo.tr,
              isEdit: controller.isUnitInfoEdit,
              cardEdit: _buildCardUnitInfoEdit(),
              card: _buildCardUnitInfo(),
            ),
          ),
          Obx(
            () => _buildCardToggle(
              isEdit: controller.isAddressInfoEdit,
              cardEdit: _buildCardAddressInfoEdit(),
              card: _buildCardAddressInfo(),
              title: LocaleKeys.transaction_addressInfo.tr,
            ),
          ),
          // Obx(
          //   () => _buildCardToggle(
          //     isEdit: controller.isRepresentInfoEdit,
          //     cardEdit: _buildCardRepresentInfoEdit(),
          //     card: _buildCardRepresentInfo(),
          //     title: LocaleKeys.transaction_representInfo.tr,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildCardToggle({
    required RxBool isEdit,
    required List<Widget> cardEdit,
    required List<Widget> card,
    required String title,
  }) {
    return UtilWidget.buildCardBase(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndIcon(
            isEdit: isEdit,
            title: title,
            onTap: () {
              isEdit.toggle();
            },
          ),
          ...(isEdit.value ? cardEdit : card),
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  Widget _buildInputItemEdit({
    required TextEditingController controller,
    required String label,
    int? inputFormatters,
    int? maxLengthInputForm,
    final ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return BuildInputTextWithLabel(
      label: label,
      textStyle: StyleEnum.detailRegular,
      buildInputText: BuildInputText(
        InputTextModel(
          validator: validator,
          controller: controller,
          inputFormatters: inputFormatters ?? 0,
          maxLengthInputForm: maxLengthInputForm,
          isShowCounterText: false,
          isValidate: true,
          autovalidateMode: AutovalidateMode.always,
          onChanged: onChanged,
        ),
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  List<Widget> _buildCardUnitInfoEdit() {
    return [
      Column(
        children: [
          _buildInputItemEdit(
            controller: controller.taxCodeController,
            label: LocaleKeys.transaction_inputTaxCode.tr,
            inputFormatters: InputFormatterEnum.taxCode,
          ),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isNotEmpty,
            child: _buildInputItemEdit(
              controller: controller.unitCodeController,
              label: LocaleKeys.transaction_unitCode.tr,
              inputFormatters: InputFormatterEnum.textOnly,
              maxLengthInputForm: 7,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.transaction_unitCodeIsNotEmpty.tr;
                }
                if (value.length < 7) {
                  return LocaleKeys.transaction_unitCodeInValid.tr;
                }
                return null;
              },
              onChanged: (value) {
                controller.unitCodeController.text = value.toUpperCase();
              },
            ),
          ),
          _buildInputItemEdit(
            controller: controller.companyNameController,
            label: LocaleKeys.transaction_unitName.tr,
          ),
          _buildInputItemEdit(
            controller: controller.phoneController,
            label: LocaleKeys.transaction_phone.tr,
            inputFormatters: InputFormatterEnum.phoneNumber,
            maxLengthInputForm: 20,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return LocaleKeys.transaction_phoenNumberIsNotEmpty.tr;
            //   }
            //   if (value.length < 10) {
            //     return LocaleKeys.transaction_phoneNumberInValid.tr;
            //   }
            //   return null;
            // },
          ),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isEmpty,
            child: _buildInputItemEdit(
              controller: controller.businessIndustryController,
              label: LocaleKeys.transaction_businessIndustry.tr,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildCardAddressInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.addressRegisterController,
        label: LocaleKeys.transaction_addressRegister.tr,
      ),
      _buildInputItemEdit(
        controller: controller.addressTransactionController,
        label: LocaleKeys.transaction_addressTransaction.tr,
      ),
    ];
  }

  List<Widget> _buildCardUnitInfo() {
    return [
      _buildText(
          "${LocaleKeys.transaction_inputTaxCode.tr}: ${controller.taxCodeController.text}"),
      Visibility(
        visible: controller.itemInfoCompany.unitCode.isNotEmpty,
        child: _buildText(
            "${LocaleKeys.transaction_unitCode.tr}: ${controller.unitCodeController.text}"),
      ),
      _buildText(
          "${LocaleKeys.transaction_unitName.tr}: ${controller.companyNameController.text}"),
      _buildText(
          "${LocaleKeys.transaction_phone.tr}: ${controller.phoneController.text}"),
      Visibility(
        visible: controller.itemInfoCompany.unitCode.isEmpty,
        child: _buildText(
            "${LocaleKeys.transaction_businessIndustry.tr}: ${controller.businessIndustryController.text}"),
      ),
    ];
  }

  List<Widget> _buildCardAddressInfo() {
    return [
      _buildText(
          "${LocaleKeys.transaction_addressRegisterDKKD.tr} ${controller.addressRegisterController.text}"),
      _buildText(
          "${LocaleKeys.transaction_addressTransaction.tr}: ${controller.addressTransactionController.text}"),
    ];
  }

  // List<Widget> _buildCardRepresentInfo() {
  //   return [
  //     _buildText(
  //       "${LocaleKeys.transaction_represent.tr}: ${controller.nameRepresentController.text}",
  //     ),
  //     _buildText(
  //       "${LocaleKeys.transaction_position.tr}: ${controller.positionController.text}",
  //     ),
  //   ];
  // }

  // List<Widget> _buildCardRepresentInfoEdit() {
  //   return [
  //     _buildInputItemEdit(
  //       controller: controller.nameRepresentController,
  //       label: LocaleKeys.transaction_represent.tr,
  //     ),
  //     _buildInputItemEdit(
  //       controller: controller.positionController,
  //       label: LocaleKeys.transaction_position.tr,
  //     ),
  //   ];
  // }

  Widget _buildTitleAndIcon({
    required String title,
    required RxBool isEdit,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        TextUtils(
          text: title,
          availableStyle: StyleEnum.bodyBold,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: isEdit.value
              ? Icon(
                  Icons.check_outlined,
                  color: AppColors.primaryColor,
                )
              : SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_EDIT_SVG,
                  width: AppDimens.sizeIcon,
                  height: AppDimens.sizeIcon,
                ),
        )
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildText(
    String text, {
    int? maxLines,
  }) {
    return TextUtils(
      text: text,
      availableStyle: StyleEnum.bodyRegular,
      maxLine: maxLines ?? 3,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
}
