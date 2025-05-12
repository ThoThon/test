part of 'unit_info_page.dart';

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
      key: controller.formKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trạng thái mở/đóng
              //Thông tin đơn vị
              Obx(
                () => _buildCardToggle(
                  title: LocaleKeys.unitInfo_unitInfo.tr,
                  isEdit: controller.isUnitInfoEdit,
                  cardEdit: _buildCardUnitInfoEdit(),
                  card: _buildCardUnitInfo(),
                ),
              ),
              //Thông tin địa chỉ
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isAddressInfoEdit,
                  cardEdit: _buildCardAddressInfoEdit(),
                  card: _buildCardAddressInfo(),
                  title: LocaleKeys.unitInfo_addressInfo.tr,
                ),
              ),
              //Thông tin người đại diện
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isRepresentInfoEdit,
                  cardEdit: _buildCardRepresentInfoEdit(),
                  card: _buildCardRepresentInfo(),
                  title: LocaleKeys.unitInfo_representInfo.tr,
                ),
              ),
              //Thông tin người giao dịch
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isTraderInfoEdit,
                  cardEdit: _buildCardTraderInfoEdit(),
                  card: _buildCardTraderInfo(),
                  title: LocaleKeys.unitInfo_transactionPersonInfo.tr,
                ),
              ),
              //Thông tin khác
              Obx(
                () => _buildCardToggle(
                  isEdit: controller.isOtherInfoEdit,
                  cardEdit: _buildCardOtherInfoEdit(),
                  card: _buildCardOtherInfo(),
                  title: LocaleKeys.unitInfo_otherInfo.tr,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ),
      ),
    );
  }

  //Thông tin đơn vị
  List<Widget> _buildCardUnitInfoEdit() {
    return [
      Column(
        children: [
          _buildInputInfoUnit(
            label: LocaleKeys.unitInfo_inputTaxCode.tr,
            controller: controller.taxCodeController,
          ),
          _buildInputInfoUnit(
            label: LocaleKeys.unitInfo_unitName.tr,
            controller: controller.unitNameController,
          ),
          _buildInputInfoUnit(
            label: LocaleKeys.unitInfo_unitCode.tr,
            controller: controller.unitCodeController,
          ),
          _buildInputInfoUnit(
            label: LocaleKeys.unitInfo_socialAgencyName.tr,
            controller: controller.socialAgencyNameCtrl,
          ),
          _buildInputInfoUnit(
            label: LocaleKeys.unitInfo_socialAgencyCode.tr,
            controller: controller.socialAgencyCodeCtrl,
          ),
        ],
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
      ),
      _buildInputItemEdit(
        controller: controller.addressTransactionController,
        label: LocaleKeys.unitInfo_addressTransaction.tr,
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
      ),
      _buildInputItemEdit(
        controller: controller.positionController,
        label: LocaleKeys.unitInfo_position.tr,
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
      ),
      _buildInputItemEdit(
        controller: controller.phoneContactController,
        label: LocaleKeys.unitInfo_phoneContact.tr,
      ),
      _buildInputItemEdit(
        controller: controller.emailContactController,
        label: LocaleKeys.unitInfo_email.tr,
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
      _buildInputItemEdit(
        controller: controller.personTransactionController,
        label: LocaleKeys.unitInfo_methodClose.tr,
      ),
      _buildInputItemEdit(
        controller: controller.phoneContactController,
        label: LocaleKeys.unitInfo_region.tr,
      ),
      _buildInputItemEdit(
        controller: controller.emailContactController,
        label: LocaleKeys.unitInfo_basicSalary.tr,
      ),
      _buildInputItemEdit(
        controller: controller.emailContactController,
        label: LocaleKeys.unitInfo_basicSalary.tr,
      ),
    ];
  }

  //Thông tin khác
  List<Widget> _buildCardOtherInfo() {
    return [
      _buildText(
        "${LocaleKeys.unitInfo_methodClose.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_region.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_basicSalary.tr}: ${controller.nameRepresentController.text}",
      ),
      _buildText(
        "${LocaleKeys.unitInfo_basicSalary.tr}: ${controller.nameRepresentController.text}",
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
      textStyle: AppTextStyle.font14Re,
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

  Widget _buildTitleAndIcon({
    required String title,
    required RxBool isEdit,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        SDSBuildText(
          title,
          style: AppTextStyle.font16Bo,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: isEdit.value
              ? SDSImageSvg(Assets.ASSETS_ICONS_IC_ARROW_UP_SVG)
              : SDSImageSvg(Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG),
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
    TextStyle? style,
  }) {
    return SDSBuildText(
      text,
      style: style,
      maxLines: maxLines ?? 3,
    ).paddingOnly(bottom: AppDimens.paddingVerySmall);
  }

  Widget _buildButtonChange() {
    return BaseButton(
      text: LocaleKeys.unitInfo_change.tr,
      textColor: AppColors.colorWhite,
      color: AppColors.statusRed,
      radius: AppDimens.radius4,
      onPressed: () {
        controller.updateAccountInfo();
      },
    );
  }

  //Thông tin đơn vị không được sửa, chỉ view thôi
  Widget _buildInputInfoUnit({
    required TextEditingController controller,
    required String label,
  }) {
    return BuildInputTextWithLabel(
      textStyle: AppTextStyle.font14Re,
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
}
