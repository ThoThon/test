part of 'unit_info_page.dart';

extension UnitInfoExtView on UnitInfoPage {
  Widget _buildBodyView() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildInfoUnitCardView(),
                sdsSBHeight12,
                _buildAddressInfoCardView(),
                sdsSBHeight12,
                _buildRepresentInfoCardView(),
                sdsSBHeight12,
                _buildTraderInfoCardView(),
                sdsSBHeight12,
                _buildOtherInfoCardView(),
              ],
            ),
          ),
        ),
        _buildButtonEditInfo(),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }

  // Thông tin đơn vị
  Widget _buildInfoUnitCardView() {
    return _buildTitleAndCardView(
      title: LocaleKeys.unitInfo_unitInfo.tr,
      children: [
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
      ],
    );
  }

  // Thông tin địa chỉ
  Widget _buildAddressInfoCardView() {
    return _buildTitleAndCardView(
      title: LocaleKeys.unitInfo_addressInfo.tr,
      children: [
        _buildText2(
          top: LocaleKeys.unitInfo_addressRegister.tr,
          bottom: controller.addressRegisterController.text,
        ),
        _buildText2(
          top: LocaleKeys.unitInfo_addressTransaction.tr,
          bottom: controller.addressTransactionController.text,
        ),
      ],
    );
  }

  // Thông tin người đại diện
  Widget _buildRepresentInfoCardView() {
    return _buildTitleAndCardView(
      title: LocaleKeys.unitInfo_representInfo.tr,
      children: [
        _buildText(
          left: LocaleKeys.unitInfo_represent.tr,
          right: controller.nameRepresentController.text,
        ),
        _buildText(
          left: LocaleKeys.unitInfo_position.tr,
          right: controller.positionController.text,
        ),
      ],
    );
  }

  // Thông tin người giao dịch
  Widget _buildTraderInfoCardView() {
    return _buildTitleAndCardView(
      title: LocaleKeys.unitInfo_transactionPersonInfo.tr,
      children: [
        _buildText(
          left: LocaleKeys.unitInfo_transactionPerson.tr,
          right: controller.personTransactionController.text,
        ),
        _buildText(
          left: LocaleKeys.unitInfo_phoneContact.tr,
          right: controller.phoneContactController.text,
        ),
        _buildText(
          left: LocaleKeys.unitInfo_emailContact.tr,
          right: controller.emailContactController.text,
        ),
      ],
    );
  }

  // Thông tin khác
  Widget _buildOtherInfoCardView() {
    return _buildTitleAndCardView(
      title: LocaleKeys.unitInfo_otherInfo.tr,
      children: [
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
      ],
    );
  }

  Widget _buildTitleAndCardView({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          title,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight12,
        UtilWidget.buildCardBase(
          radius: AppDimens.radius12,
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ).paddingSymmetric(
              horizontal: AppDimens.paddingSmall,
              vertical: AppDimens.paddingVerySmall,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonEditInfo() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.unitInfo_fix.tr,
      onPressed: () => controller.isEditAll.value = true,
      borderRadius: AppDimens.radius30,
    ).paddingOnly(
      bottom: AppDimens.defaultPadding,
      top: AppDimens.paddingSmall,
    );
  }

  Widget _buildText({
    required String left,
    required String right,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SDSBuildText(
            left,
            style: AppTextStyle.font14Re.copyWith(
              color: AppColors.dsGray2,
            ),
            maxLines: 3,
          ),
        ),
        Expanded(
          child: SDSBuildText(
            right,
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ).paddingSymmetric(
      vertical: AppDimens.paddingSmallest,
    );
  }

  //Cho riêng thông tin địa chỉ
  Widget _buildText2({
    required String top,
    required String bottom,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          top,
          style: AppTextStyle.font14Re.copyWith(
            color: AppColors.dsGray2,
          ),
          maxLines: 3,
        ),
        if (bottom.trim().isNotEmpty)
          SDSBuildText(
            bottom,
            style: AppTextStyle.font14Re,
            maxLines: 3,
          ),
      ],
    ).paddingOnly(
      bottom: AppDimens.paddingSmallest,
      top: AppDimens.paddingSmallest,
    );
  }
}
