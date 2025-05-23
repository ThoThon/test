part of 'nfc_information_user_page.dart';

Widget _buildListGuild(NfcInformationUserController controller) {
  final infoUser = controller.sendNfcRequestModel;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.dsGray5,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              sdsSBHeight12,
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_CARD_INFO_SVG,
                "${LocaleKeys.infomationUser_id.tr}: ${infoUser.sessionId}",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                "${LocaleKeys.infomationUser_name.tr}: ${infoUser.firstName}",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                "${LocaleKeys.infomationUser_lastName.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_GENDER_SVG,
                "${LocaleKeys.infomationUser_gender.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_MAP_SVG,
                "${LocaleKeys.infomationUser_homeTown.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_MAP_SVG,
                "${LocaleKeys.infomationUser_permanentResident.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
                "${LocaleKeys.infomationUser_nationality.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_NATION_SVG,
                "${LocaleKeys.infomationUser_nation.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
                "${LocaleKeys.infomationUser_religion.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_PERSON_SVG,
                "${LocaleKeys.infomationUser_identification.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_BIRTHDAY_SVG,
                "${LocaleKeys.infomationUser_birthDay.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_START_DAY_SVG,
                "${LocaleKeys.infomationUser_releaseDay.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_START_DAY_SVG,
                "${LocaleKeys.infomationUser_expiryDay.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                "${LocaleKeys.infomationUser_fatherName.tr}: ",
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                "${LocaleKeys.infomationUser_motherName.tr}: ",
              ),
            ],
          ),
        ),
      ),
      UtilWidget.buildSolidButton(
        title: LocaleKeys.infomationUser_continue.tr,
        onPressed: () {
          Get.until(ModalRoute.withName(AppRoutes.declareInfo.path));
        },
      ),
    ],
  ).paddingAll(AppDimens.defaultPadding);
}

Widget _buildTextAndIcon(
  String assetName,
  String text,
) {
  return Row(
    children: [
      SDSImageSvg(assetName),
      sdsSBWidth4,
      SDSBuildText(
        text,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.paddingSmallest);
}
