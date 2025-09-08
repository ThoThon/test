// part of 'nfc_page.dart';

// extension NfcWidget on NfcPage {
//   Widget _buildBody() {
//     return SDSSafearea(
//       child: SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     UtilWidget.buildCardBase(
//                       Center(
//                         child: Column(
//                           children: [
//                             SDSImageSvg(Assets.ASSETS_ICONS_IC_CCCD_SVG),
//                             sdsSBHeight20,
//                             Image.asset(
//                               Assets.ASSETS_IMAGES_IPHONE_JPG,
//                               height: 400,
//                             ),
//                           ],
//                         ),
//                       ).paddingAll(AppDimens.defaultPadding),
//                     ),
//                     SDSBuildText(
//                       LocaleKeys.nfc_guideScanCCCD.tr,
//                       style: AppTextStyle.font16Bo.copyWith(
//                         color: AppColors.basicBlack,
//                       ),
//                     ).paddingOnly(
//                       bottom: AppDimens.padding5,
//                       top: AppDimens.paddingSmall,
//                     ),
//                     _titleInstruct(
//                       LocaleKeys.nfc_stepOne.tr,
//                       LocaleKeys.nfc_titleStepOne.tr,
//                     ),
//                     _titleInstruct(
//                       LocaleKeys.nfc_stepTwo.tr,
//                       LocaleKeys.nfc_titleStepTwo.tr,
//                     ),
//                     _titleInstruct(
//                       LocaleKeys.nfc_stepThree.tr,
//                       LocaleKeys.nfc_titleStepThree.tr,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             _buildButtonNfcContinue(),
//           ],
//         ).paddingAll(AppDimens.defaultPadding),
//       ),
//     );
//   }

//   Widget _titleInstruct(
//     String step,
//     String title,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         sdsSBHeight8,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               alignment: Alignment.topCenter,
//               child: SDSBuildText("$step. "),
//             ),
//             Expanded(
//               child: SDSBuildText(
//                 title,
//                 maxLines: 4,
//               ),
//             ),
//           ],
//         ),
//         sdsSBHeight8,
//       ],
//     ).paddingOnly(bottom: AppDimens.padding5);
//   }

//   Widget _buildButtonNfcContinue() {
//     return UtilWidget.buildSolidButton(
//       title: LocaleKeys.nfc_start.tr,
//       onPressed: () async {
//         await controller.scanNFC();
//         // Get.bottomSheet(
//         //   UtilWidget.buildBottomSheetFigma(
//         //     title: LocaleKeys.nfc_readyScan.tr,
//         //     textColor: AppColors.basicGrey1,
//         //     child: Column(
//         //       children: [
//         //         SDSImageSvg(Assets.ASSETS_ICONS_ICON_SCAN_NFC_SVG),
//         //         sdsSBHeight16,
//         //         SDSBuildText(
//         //           LocaleKeys.nfc_scanNFC.tr,
//         //           textAlign: TextAlign.center,
//         //         ),
//         //         sdsSBHeight16,
//         //         UtilWidget.buildSolidButtonBack(
//         //           title: LocaleKeys.nfc_cancel.tr,
//         //           width: Get.width,
//         //           onPressed: () {
//         //             Get.back();
//         //           },
//         //         ),
//         //         sdsSBHeight32,
//         //       ],
//         //     ),
//         //   ),
//         // );
//         // await Future.delayed(const Duration(seconds: 3));
//         // Get.toNamed(AppRoutesCl.nfcInformationUser.path);
//       },
//     ).paddingOnly(top: AppDimens.paddingSmall);
//   }
// }
