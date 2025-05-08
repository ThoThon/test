part of '../unit_info_page.dart';

extension UnitInfoWidget on UnitInfoPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildViewInfoItem(),
          _buildButtonChange(),
        ],
      ),
    );
  }

  Widget _buildViewInfoItem() {
    return Form(
      key: controller.formKeyTabGeneral,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardUnitInfo(),
              // Obx(
              //   () => _buildCardToggle(
              //     title: LocaleKeys.unitInfo_unitInfo.tr,
              //     isEdit: controller.isUnitInfoEdit,
              //     cardEdit: _buildCardUnitInfoEdit(),
              //     card: _buildCardUnitInfo(),
              //   ),
              // ),
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isAddressInfoEdit,
                  cardEdit: _buildCardAddressInfoEdit(),
                  card: _buildCardAddressInfo(),
                  title: LocaleKeys.unitInfo_addressInfo.tr,
                ),
              ),
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isRepresentInfoEdit,
                  cardEdit: _buildCardRepresentInfoEdit(),
                  card: _buildCardRepresentInfo(),
                  title: LocaleKeys.unitInfo_representInfo.tr,
                ),
              ),
              Obx(
                () => _buildCardToggle(
                  isEdit: false.obs,
                  cardEdit: _buildCardTraderInfo(),
                  card: _buildCardTraderInfo(),
                  title: LocaleKeys.unitInfo_transactionPersonInfo.tr,
                ),
              ),
              Obx(
                () => _buildCardToggle(
                  isEdit: false.obs,
                  cardEdit: _buildCardTraderInfo(),
                  card: _buildCardTraderInfo(),
                  title: LocaleKeys.unitInfo_transactionPersonInfo.tr,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ),
      ),
    );
  }

  Widget _buildCardUnitInfo() {
    return UtilWidget.buildCardBase(
      Column(
        children: [
          _buildInputWithLabel(
            label: LocaleKeys.unitInfo_inputTaxCode.tr,
            controller: controller.taxCodeController,
          ),
          _buildInputWithLabel(
            label: LocaleKeys.unitInfo_unitName.tr,
            controller: controller.companyNameController,
          ),
          _buildInputWithLabel(
            label: LocaleKeys.unitInfo_unitCode.tr,
            controller: controller.unitCodeController,
          ),
          _buildInputWithLabel(
            label: LocaleKeys.unitInfo_socialAgencyCode.tr,
            controller: controller.socialAgencyNameCtrl,
          ),
          _buildInputWithLabel(
            label: LocaleKeys.unitInfo_inputTaxCode.tr,
            controller: controller.socialAgencyNameCtrl,
          ),
        ],
      ).paddingOnly(
        top: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        left: AppDimens.defaultPadding,
        bottom: AppDimens.paddingSmallest,
      ),
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  Widget _buildInputWithLabel({
    required TextEditingController controller,
    required String label,
  }) {
    return BuildInputTextWithLabel(
      label: label,
      buildInputText: BuildInputText(
        InputTextModel(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.dsGray7)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.dsGray7)),
          isShowBorder: false,
          isReadOnly: true,
          fillColor: AppColors.dsGray7,
          controller: controller,
          showIconClear: false,
          isShowCounterText: false,
          isValidate: false,
        ),
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
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

  // List<Widget> _buildCardUnitInfo() {
  //   return [
  //     _buildText(
  //         "${LocaleKeys.unitInfo_inputTaxCode.tr}: ${controller.taxCodeController.text}"),
  //     _buildText(
  //         "${LocaleKeys.unitInfo_unitName.tr}: ${controller.companyNameController.text}"),
  //     _buildText(
  //         "${LocaleKeys.unitInfo_unitCode.tr}: ${controller.unitCodeController.text}"),
  //     _buildText(
  //         "${LocaleKeys.unitInfo_socialAgencyName.tr}: ${controller.socialAgencyNameCtrl.text}"),
  //     _buildText(
  //         "${LocaleKeys.unitInfo_socialAgencyCode.tr}: ${controller.socialAgencyNameCtrl.text}"),
  //   ];
  // }

  List<Widget> _buildCardAddressInfo() {
    return [
      _buildText(
          "${LocaleKeys.unitInfo_addressRegisterDKKD.tr} ${controller.addressRegisterController.text}"),
      _buildText(
          "${LocaleKeys.unitInfo_addressTransaction.tr}: ${controller.addressTransactionController.text}"),
    ];
  }

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

  List<Widget> _buildCardTraderInfo() {
    return [
      _buildText(
        "${LocaleKeys.unitInfo_transactionPerson.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_phoneContact.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_email.tr}: ${controller.nameRepresentController.text}",
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
  }) {
    return BuildInputTextWithLabel(
      label: label,
      // textStyle: StyleEnum.detailRegular,
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
            label: LocaleKeys.unitInfo_inputTaxCode.tr,
            inputFormatters: InputFormatterEnum.taxCode,
          ),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isNotEmpty,
            child: _buildInputItemEdit(
              controller: controller.unitCodeController,
              label: LocaleKeys.unitInfo_unitCode.tr,
              inputFormatters: InputFormatterEnum.textOnly,
              maxLengthInputForm: 7,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.unitInfo_unitCodeIsNotEmpty.tr;
                }
                if (value.length < 7) {
                  return LocaleKeys.unitInfo_unitCodeInValid.tr;
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
            label: LocaleKeys.unitInfo_unitName.tr,
          ),
          _buildInputItemEdit(
            controller: controller.phoneController,
            label: LocaleKeys.unitInfo_phone.tr,
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
              label: LocaleKeys.unitInfo_businessIndustry.tr,
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
        label: LocaleKeys.unitInfo_addressRegister.tr,
      ),
      _buildInputItemEdit(
        controller: controller.addressTransactionController,
        label: LocaleKeys.unitInfo_addressTransaction.tr,
      ),
    ];
  }

  List<Widget> _buildCardRepresentInfoEdit() {
    return [
      _buildInputItemEdit(
        controller: controller.nameRepresentController,
        label: LocaleKeys.unitInfo_represent.tr,
      ),
      _buildInputItemEdit(
        controller: controller.positionController,
        label: LocaleKeys.unitInfo_position.tr,
      ),
    ];
  }

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
    ).paddingOnly(
      top: AppDimens.paddingSmall,
      bottom: AppDimens.paddingVerySmall,
    );
  }

  Widget _buildText(
    String text, {
    int? maxLines,
  }) {
    return TextUtils(
      text: text,
      availableStyle: StyleEnum.bodyRegular,
      maxLine: maxLines ?? 3,
    ).paddingOnly(bottom: AppDimens.paddingVerySmall);
  }

  Widget _buildButtonChange() {
    return BaseButton(
      text: LocaleKeys.unitInfo_change.tr,
      textColor: AppColors.colorWhite,
      color: AppColors.statusRed,
      radius: AppDimens.radius4,
      onPressed: () {
        // controller.validateAndSubmit();
      },
    );
  }
}
