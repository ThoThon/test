// part of 'select_staff_page.dart';

// extension SelectStaffWidget on SelectStaffPage {
//   Widget _buildBody() {
//     return Column(
//       children: [
//         _buildSearchStaff(),
//         sdsSBHeight12,
//         _staffTitle(),
//         sdsSBHeight12,
//         _buildViewListStaffSelect(),
//       ],
//     ).paddingSymmetric(horizontal: AppDimens.paddingSmallest);
//   }

//   Widget _buildSearchStaff() {
//     return BuildInputText(
//       InputTextModel(
//         controller: controller.searchController,
//         hintText: LocaleKeys.staffList_fillFullName.tr,
//         hintTextColor: AppColors.thumbColorSwitch,
//         prefixIconColor: AppColors.thumbColorSwitch,
//         fillColor: AppColors.colorTransparent,
//         maxLengthInputForm: 100,
//         isShowCounterText: false,
//         hintTextSize: AppDimens.fontSmall(),
//         iconAssets: Assets.ASSETS_ICONS_IC_SEARCH_SVG,
//         onChanged: (_) => controller.functionSearch(),
//         border: _buildOutlineBorder(),
//         focusedBorder: _buildOutlineBorder(),
//         enabledBorder: _buildOutlineBorder(),
//       ),
//     ).paddingSymmetric(horizontal: AppDimens.paddingSmall);
//   }

//   OutlineInputBorder _buildOutlineBorder() => OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppDimens.radius30),
//         borderSide: const BorderSide(
//           width: 1,
//           color: AppColors.thumbColorSwitch,
//         ),
//       );

//   Widget _buildItemStaff(SelectStaffResponse item, int index) {
//     return InkWell(
//       onTap: () {
//         Get.back(result: item);
//       },
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SDSImageSvg(
//             Assets.ASSETS_ICONS_IC_PERSON_2_SVG,
//             height: AppDimens.sizeIcon32,
//             color: AppColors.primaryColor,
//           ).paddingSymmetric(
//             vertical: AppDimens.paddingSmall,
//             horizontal: AppDimens.defaultPadding,
//           ),
//           sdsSBWidth4,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildStaffInfo(item),
//                 if (item.chucVu.isNotEmpty)
//                   SDSBuildText(
//                     item.chucVu,
//                     style: AppTextStyle.font14Re,
//                   ),
//               ],
//             ),
//           ),
//           Icon(
//             Icons.check_outlined,
//             color: controller.selectedID.value == item.id
//                 ? AppColors.primaryColor
//                 : AppColors.colorTransparent,
//           ),
//         ],
//       ).paddingSymmetric(
//         horizontal: AppDimens.paddingSmallest,
//       ),
//     );
//   }

//   Widget _buildStaffInfo(SelectStaffResponse item) {
//     return Row(
//       children: [
//         Expanded(
//           child: SDSBuildText(
//             '${item.hoTen}${item.maSoBHXH.isNotEmpty ? ' (${item.maSoBHXH})' : ''}',
//             maxLines: 4,
//             style: AppTextStyle.font14Re,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildViewListStaffSelect() {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//             color: AppColors.basicWhite,
//             borderRadius: BorderRadius.circular(AppDimens.radius16)),
//         child: baseShowLoading(
//           () => UtilWidget.buildSmartRefresher(
//             refreshController: controller.refreshController,
//             onRefresh: controller.onRefresh,
//             onLoadMore: controller.onLoadMore,
//             enablePullUp: true,
//             child: controller.listStaffSelect.isEmpty
//                 ? UtilWidget.buildEmptyList()
//                 : ListView.separated(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     itemBuilder: (_, index) {
//                       return _buildItemStaff(
//                         controller.listStaffSelect[index],
//                         index,
//                       );
//                     },
//                     separatorBuilder: (context, index) =>
//                         UtilWidget.buildDividerDefault().paddingSymmetric(
//                       horizontal: AppDimens.paddingSmall,
//                     ),
//                     itemCount: controller.listStaffSelect.length,
//                   ),
//           ),
//         ),
//       ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
//     );
//   }

//   Widget _staffTitle() {
//     return SizedBox(
//       width: double.infinity,
//       child: SDSBuildText(
//         LocaleKeys.staffList_listEmployee.tr,
//         style: AppTextStyle.font16Bo,
//         textAlign: TextAlign.start,
//       ),
//     ).paddingSymmetric(
//       horizontal: AppDimens.paddingSmall,
//     );
//   }
// }
