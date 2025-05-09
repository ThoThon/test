part of 'profile_page.dart';

extension ProfileWidget on ProfilePage {
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAvatarProfile(),
          sdsSBHeight16,
          _buildCompanyName(),
          _buildTaxCode(),
          _buildUnitCode(),
          _buildPackage(),
          _buildRegisterDay(),
          _buildExpiredDay(),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildAvatarProfile() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.colorBlack, width: 2),
        ),
        child: Icon(
          Icons.person,
          size: 100,
          color: AppColors.dsGray1,
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_companyName.tr,
      content: controller.accountInfo?.tenToChuc ?? '',
    );
  }

  Widget _buildTaxCode() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_taxCode.tr,
      content: controller.accountInfo?.taxCode ?? '',
    );
  }

  Widget _buildUnitCode() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_unitCode.tr,
      content: controller.accountInfo?.maDonVi ?? '',
    );
  }

  Widget _buildPackage() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_package.tr,
      content: controller.accountInfo?.serviceName ?? '',
    );
  }

  Widget _buildRegisterDay() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_registerDay.tr,
      content: controller.accountInfo?.serviceStartDate ?? '',
    );
  }

  Widget _buildExpiredDay() {
    return _buildTitleAccountInfo(
      text: LocaleKeys.profile_expiredDay.tr,
      content: controller.accountInfo?.serviceExpiredDate ?? '',
    );
  }

  Widget _buildTitleAccountInfo({
    required String text,
    required String content,
    // required IconData? icon,
  }) {
    return UtilWidget.buildCardBase(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SDSBuildText(
                text,
                style: AppTextStyle.font14Bo,
              ),
            ],
          ),
          SDSBuildText(
            content,
            maxLines: 3,
          ),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: AppDimens.paddingSmall,
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
}
