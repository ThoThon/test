part of 'register_service_page.dart';

extension RegisterServiceWidget on RegisterServicePage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildCardUnitInfo(),
                sdsSBHeight16,
                _buildCardSignatureInfo(),
              ],
            ),
          ),
        ),
        sdsSBHeight12,
        _buildBottomButtons(),
      ],
    ).paddingOnly(
      right: AppDimens.defaultPadding,
      left: AppDimens.defaultPadding,
      top: AppDimens.defaultPadding,
      bottom: AppDimens.padding32,
    );
  }

  Widget _buildCardUnitInfo() {
    return Obx(
      () {
        final registerInfo = controller.registerServiceInfo.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SDSBuildText(
              LocaleKeys.registerService_unitInfo.tr,
              style: AppTextStyle.font16Bo,
            ),
            sdsSBHeight12,

            // Mã số thuế
            _buildDoubleItem(
              titleLeft: LocaleKeys.registerService_taxCode.tr,
              contenTitleLeft: registerInfo?.maSoThue,
              titleRight: LocaleKeys.registerService_unitCode.tr,
              contenTitleRight: registerInfo?.maDonVi,
            ),
            sdsSBHeight12,

            // Tên đơn vị
            _buildSingleItem(
              title: LocaleKeys.registerService_unitName.tr,
              contenTitle: registerInfo?.tenCongTy,
            ),
            sdsSBHeight12,

            // Tên cơ quan quản lý
            _buildSingleItem(
              title: LocaleKeys.registerService_manageAgencyName.tr,
              contenTitle: registerInfo?.tenCQQL,
            ),
            sdsSBHeight12,

            // Mã cơ quan quản lý
            _buildSingleItem(
              title: LocaleKeys.registerService_manageAgencyCode.tr,
              contenTitle: registerInfo?.maCQQL,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardSignatureInfo() {
    return Obx(
      () {
        final cert = controller.certificate.value;
        final registerInfo = controller.registerServiceInfo.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SDSBuildText(
              LocaleKeys.registerService_signatureInfo.tr,
              style: AppTextStyle.font16Bo,
            ),
            sdsSBHeight12,

            // Ô input nhập username My Sign
            _buildInputUsernameMySign(),
            sdsSBHeight12,
            // DropDown Số serial
            controller.certificate.value == null
                ? _buildDropdownSerialRegister()
                : _buildDropdownSerialCert(),
            sdsSBHeight12,
            // Tên chủ thể CTS
            _buildSingleItem(
              title: LocaleKeys.registerService_subjectNameCert.tr,
              contenTitle: cert?.name ?? registerInfo?.tenChuTheCTS,
            ),
            sdsSBHeight12,

            // Tên tổ chức trực thuộc CTS
            _buildSingleItem(
              title: LocaleKeys.registerService_organizationNameOfCert.tr,
              // TODO: Phía BE chưa có thuộc tính này, tạm thời fix cứng
              contenTitle: controller.hasBeenRegister
                  ? registerInfo?.tenToChucCKS
                  // Fix cứng "Viettel - CA RS" khi chọn xong chứng thư số
                  : (cert == null ? '' : "Viettel - CA RS"),
            ),
            sdsSBHeight12,

            // "Ngày bắt đầu" và "Ngày kết thúc"
            _buildDoubleItem(
              titleLeft: LocaleKeys.registerService_dayStart.tr,
              contenTitleLeft: cert?.validFrom ??
                  convertDateToStringSafe(
                    registerInfo?.thoiHanTuNgay,
                    PATTERN_1,
                  ),
              titleRight: LocaleKeys.registerService_dayEnd.tr,
              contenTitleRight: cert?.validTo ??
                  convertDateToStringSafe(
                    registerInfo?.thoiHanDenNgay,
                    PATTERN_1,
                  ),
            ),
            sdsSBHeight12,

            // Số điện thoại
            _buildSingleItem(
              title: LocaleKeys.registerService_phoneNumber.tr,
              contenTitle: registerInfo?.dienThoai,
            ),
            sdsSBHeight12,

            // Email
            _buildSingleItem(
              title: LocaleKeys.registerService_email.tr,
              contenTitle: registerInfo?.email,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDoubleItem({
    required String titleLeft,
    required String titleRight,
    String? contenTitleLeft,
    String? contenTitleRight,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildCardItem(
            title: titleLeft,
            contenTitle: contenTitleLeft ?? '',
          ),
        ),
        sdsSBWidth12,
        Expanded(
          child: _buildCardItem(
            title: titleRight,
            contenTitle: contenTitleRight ?? '',
          ),
        ),
      ],
    );
  }

  Widget _buildInputUsernameMySign() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CardInputTextFormWithLabel(
            labelText: LocaleKeys.registerService_signature.tr,
            isRequired: true,
            controller: controller.usernameMySignCtrl,
            inputFormatters: InputFormatterEnum.textNormal,
            autovalidateMode: AutovalidateMode.always,
            hintText: LocaleKeys.registerService_inputCCCDregisterMySign.tr,
            onChanged: (value) {
              controller.isUsernameMySignEmpty.value = value.trim().isEmpty;
            },
            validator: (value) {
              final trimmedValue = value?.trim();
              if (trimmedValue.isNullOrEmpty) {
                return LocaleKeys
                    .registerService_inputCCCDregisterMySignCannotEmpty.tr;
              }
              return null;
            },
          ),
        ),
        sdsSBWidth8,
        _buildButtonGetListCert(),
      ],
    );
  }

  Widget _buildSingleItem({
    required String title,
    String? contenTitle,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildCardItem(
            title: title,
            contenTitle: contenTitle ?? '',
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem({
    required String title,
    String? contenTitle,
  }) {
    return UtilWidget.buildCardBase(
      backgroundColor: AppColors.dsGray6,
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingVerySmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SDSBuildText(
              title,
              style: AppTextStyle.font12Re.copyWith(
                color: AppColors.dsGray3,
              ),
            ),
            sdsSBHeight4,
            SDSBuildText(
              maxLines: 5,
              contenTitle ?? '',
              style: AppTextStyle.font14Re,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGetListCert() {
    final isUsernameMySignEmpty = controller.isUsernameMySignEmpty.value;
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isUsernameMySignEmpty
              ? AppColors.primaryColorDisable
              : AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          KeyBoard.hide();
          if (isUsernameMySignEmpty) return;
          controller.fetchListCert();
        },
        child: Center(
          child: SDSImageSvg(Assets.ASSETS_ICONS_IC_LOOKUP_MY_SIGN_SVG),
        ),
      ),
    );
  }

  Widget _buildButtonRegister() {
    return Obx(
      () {
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.registerService_register.tr,
          borderRadius: AppDimens.radius30,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          backgroundColor: controller.isDisableRegisterButton
              ? AppColors.primaryColorDisable
              : AppColors.primaryColor,
          onPressed: () {
            controller.isDisableRegisterButton
                ? null
                : controller.registerNewService();
          },
        );
      },
    );
  }

  Widget _buildBottomButtons() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Obx(
          () {
            if (controller.hasBeenRegister) {
              return _buildChangeInfoAndCancelRegisterButtons();
            } else {
              return _buildButtonRegister();
            }
          },
        );
      },
    );
  }

  Widget _buildChangeInfoAndCancelRegisterButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButton(
            side: BorderSide(
              width: 1,
              color: controller.isDiableChangeInfoButton
                  ? AppColors.colorBorder
                  : AppColors.colorBlack,
            ),
            backgroundColor: controller.isDiableChangeInfoButton
                ? AppColors.basicWhite
                : AppColors.basicWhite,
            textStyle: AppTextStyle.font14Re.copyWith(
              color: controller.isDiableChangeInfoButton
                  ? AppColors.colorBorder
                  : AppColors.colorBlack,
            ),
            title: LocaleKeys.registerService_updateInfo.tr,
            borderRadius: AppDimens.radius30,
            onPressed: () {
              if (controller.certificate.value != null) {
                if (!controller.isDiableChangeInfoButton) {
                  controller.changeInfo();
                }
              }
            },
          ),
        ),
        sdsSBWidth8,
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            backgroundColor: AppColors.primaryColor,
            textStyle:
                AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
            title: LocaleKeys.registerService_cancelRegister.tr,
            borderRadius: AppDimens.radius30,
            onPressed: controller.cancelRegister,
          ),
        ),
      ],
    );
  }

  // Hiện serial từ chứng thư số
  Widget _buildDropdownSerialCert() {
    return CardDropdownWithLabel<CertificateModel>(
      isRequired: true,
      labelText: LocaleKeys.registerService_serialNumber.tr,
      items: controller.listCert,
      display: (cert) => cert.serialNumber,
      selectedItem: controller.certificate.value,
      onChanged: (value) {
        controller.certificate.value = value;
      },
    );
  }

  // Hiện serial từ thông tin đã đăng ký trước đó
  Widget _buildDropdownSerialRegister() {
    return CardDropdownWithLabel<RegisterServiceInfoModel>(
      isRequired: true,
      labelText: LocaleKeys.registerService_serialNumber.tr,
      items: controller.listRegisterInfo,
      display: (cert) => cert.soSerialCTS,
      selectedItem: controller.registerServiceInfo.value,
      onChanged: (value) {
        controller.registerServiceInfo.value = value;
      },
    );
  }
}
