// part of 'nfc_information_user_page.dart';

// Widget _buildListGuild(NfcInformationUserController controller) {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         Visibility(
//           visible: controller.image != "",
//           child: Image.memory(
//             base64Decode(controller.image ?? ""),
//             width: 150,
//           ),
//         ),
//         sdsSBHeight12,
//         _buildItemText(
//           '${LocaleKeys.infomationUser_id.tr}: ${controller.sendNfcRequestModel.number}',
//           Assets.ASSETS_ICONS_ICON_CARD_INFO_SVG,
//           visible: controller.sendNfcRequestModel.number != "",
//         ),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_name.tr}: ${controller.sendNfcRequestModel.otherPaper}',
//             Assets.ASSETS_ICONS_ICON_CARD_INFO_SVG,
//             visible: (controller.sendNfcRequestModel.otherPaper != "" &&
//                 controller.sendNfcRequestModel.otherPaper != null)),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_lastName.tr}: ${controller.sendNfcRequestModel.nameVNM}',
//             Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
//             visible: controller.sendNfcRequestModel.nameVNM != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_gender.tr}: ${controller.sendNfcRequestModel.sexVMN}',
//             Assets.ASSETS_ICONS_ICON_GENDER_SVG,
//             visible: controller.sendNfcRequestModel.sexVMN != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_homeTown.tr}: ${controller.sendNfcRequestModel.nationalityVMN}',
//             Assets.ASSETS_ICONS_ICON_MAP_SVG,
//             visible: controller.sendNfcRequestModel.nationalityVMN != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_permanentResident.tr}: ${controller.sendNfcRequestModel.religionVMN}',
//             Assets.ASSETS_ICONS_ICON_MAP_SVG,
//             visible: controller.sendNfcRequestModel.religionVMN != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_nationality.tr}: ${controller.sendNfcRequestModel.nationVNM}',
//             Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
//             visible: controller.sendNfcRequestModel.nationVNM != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_nation.tr}: ${controller.sendNfcRequestModel.homeTownVMN}',
//             Assets.ASSETS_ICONS_IC_NATION_SVG,
//             visible: controller.sendNfcRequestModel.homeTownVMN != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_religion.tr}: ${controller.sendNfcRequestModel.residentVMN}',
//             Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
//             visible: controller.sendNfcRequestModel.residentVMN != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_identification.tr}: ${controller.sendNfcRequestModel.identificationSignsVNM}',
//             Assets.ASSETS_ICONS_IC_PERSON_SVG,
//             visible:
//                 controller.sendNfcRequestModel.identificationSignsVNM != ""),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_birthDay.tr}: ${controller.dateOfBirth}',
//             Assets.ASSETS_ICONS_ICON_BIRTHDAY_SVG,
//             visible: controller.dateOfBirth != null),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_releaseDay.tr}: ${controller.dateOfExpiry}',
//             Assets.ASSETS_ICONS_IC_START_DAY_SVG,
//             visible: controller.dateOfExpiry != null),
//         _buildItemText(
//             '${LocaleKeys.infomationUser_expiryDay.tr}: ${controller.sendNfcRequestModel.registrationDateVMN}',
//             Assets.ASSETS_ICONS_IC_START_DAY_SVG,
//             visible: true),
//       ],
//     ),
//   );
// }

// SizedBox sizeBoxHeight12() {
//   return const SizedBox(
//     height: 12,
//   );
// }

// Widget _buildItemText(
//   String title,
//   String assetIcon, {
//   required bool visible,
// }) {
//   return Visibility(
//     visible: visible,
//     child: Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             buildBaseIcon(assetIcon).paddingOnly(right: AppDimens.padding5),
//             Expanded(
//               child: buildBaseText(title),
//             ),
//           ],
//         ),
//         sizeBoxHeight12(),
//       ],
//     ),
//   );
// }

// Widget buildBaseText(String text) {
//   return SDSBuildText(
//     text,
//     maxLines: 3,
//   );
// }

// Widget buildBaseIcon(String assetIcon) {
//   return SvgPicture.asset(
//     assetIcon,
//     width: 16,
//     height: 16,
//   );
// }
