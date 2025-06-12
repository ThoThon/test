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
                sdsSBHeight20,
                _buildCardSignatureInfo(),
              ],
            ),
          ),
        ),
        sdsSBHeight12,
        _buildButtonRegister(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingSmall);
  }

  Widget _buildCardUnitInfo() {
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
          contenTitleLeft: '0123456789',
          titleRight: LocaleKeys.registerService_unitCode.tr,
        ),
        sdsSBHeight12,

        // Tên đơn vị
        _buildSingleItem(
          title: LocaleKeys.registerService_unitName.tr,
        ),
        sdsSBHeight12,

        // Tên cơ quan quản lý
        _buildSingleItem(
          title: LocaleKeys.registerService_manageAgencyName.tr,
        ),
        sdsSBHeight12,

        // Mã cơ quan quản lý
        _buildSingleItem(
          title: LocaleKeys.registerService_manageAgencyCode.tr,
        ),
      ],
    );
  }

  Widget _buildCardSignatureInfo() {
    return Obx(
      () {
        final cert = controller.certificate.value;
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
            // Tên chủ thể CTS
            _buildSingleItem(
              title: LocaleKeys.registerService_subjectNameCert.tr,
              contenTitle: cert?.name,
            ),
            sdsSBHeight12,

            // Tên tổ chức trực thuộc CTS
            _buildSingleItem(
              title: LocaleKeys.registerService_organizationNameOfCert.tr,
              // TODO: Phía BE chưa có thuộc tính này, tạm thời fix cứng
              contenTitle: "Viettel - CA",
            ),
            sdsSBHeight12,

            // Số CTS
            _buildSingleItem(
              title: LocaleKeys.registerService_certificateNumber.tr,
              contenTitle: cert?.serialNumber,
            ),
            sdsSBHeight12,

            // "Thời hạn sử dụng từ" và "Thời hạn sử dụng đến"
            _buildDoubleItem(
              titleLeft: LocaleKeys.registerService_expiryDateFrom.tr,
              contenTitleLeft: cert?.validFrom,
              titleRight: LocaleKeys.registerService_expiryDateTo.tr,
              contenTitleRight: cert?.validTo,
            ),
            sdsSBHeight12,

            // Số điện thoại
            _buildSingleItem(
              title: LocaleKeys.registerService_phoneNumber.tr,
            ),
            sdsSBHeight12,

            // Email
            _buildSingleItem(
              title: LocaleKeys.registerService_email.tr,
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
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // kéo giãn theo chiều dọc
        children: [
          Expanded(
            child: BuildInputText(
              InputTextModel(
                controller: controller.usernameMySignCtrl,
                hintText: LocaleKeys.registerService_inputMySignUsername.tr,
              ),
            ),
          ),
          sdsSBWidth8,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
            ),
            onPressed: () {
              controller.selectCertificate();
            },
            child: const Icon(
              Icons.send,
              color: AppColors.basicWhite,
            ),
          ),
        ],
      ),
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
              contenTitle ?? '',
              style: AppTextStyle.font14Re,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRegister() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.registerService_register.tr,
      borderRadius: AppDimens.radius30,
      onPressed: () {},
    );
  }
}
