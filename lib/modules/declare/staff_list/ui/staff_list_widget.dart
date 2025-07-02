part of 'staff_list_page.dart';

extension StaffListWidget on StaffListPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.defaultPadding,
            ),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      LocaleKeys.staffList_listEmployee.tr,
                      style: AppTextStyle.font16Bo,
                    ),
                    sdsSBHeight8,
                    _buildListStaff(),
                    sdsSBHeight12,
                    SDSBuildText(
                      LocaleKeys.staffList_attachFile.tr,
                      style: AppTextStyle.font16Bo,
                    ),
                    sdsSBHeight8,
                    AppSelectImageWidget(
                      onPickImage: controller.pickImage,
                      onTakePhoto: controller.takePhoto,
                    ),
                    _buildAttachImages(),
                  ],
                );
              },
            ),
          ),
        ),
        _buildAddNewStaffButton(),
        sdsSBHeight16,
        _buildSubmitButton(),
        sdsSBHeight32,
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildAttachImages() {
    return Obx(
      () {
        if (controller.listAttachImage.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: AppDimens.paddingSmall),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.basicWhite,
              borderRadius: BorderRadius.circular(AppDimens.radius10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.listAttachImage.length,
                (index) {
                  final imageAttach = controller.listAttachImage[index];
                  return Row(
                    children: [
                      Image.network(
                        imageAttach.imgPath,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      sdsSBWidth8,
                      Expanded(
                        child: SDSBuildText(
                          controller.getFileName(imageAttach.fileName),
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deleteImage(imageAttach.imgPath, index);
                        },
                        icon: SDSImageSvg(
                          Assets.ASSETS_ICONS_IC_REMOVE_SVG,
                          color: AppColors.colorBlack,
                          width: AppDimens.sizeIconMedium,
                          height: AppDimens.sizeIconMedium,
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: AppDimens.paddingSmall);
                },
              ),
            ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
          ),
        );
      },
    );
  }

  Widget _buildListStaff() {
    final isListStaffEmpty = controller.declaredStaffs.isEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isListStaffEmpty)
          SDSBuildText(
            LocaleKeys.staffList_noEmployeeDeclaredMessage.tr,
            style: AppTextStyle.font16Re,
          ).paddingAll(AppDimens.defaultPadding),
        ...addSeparator(
          spacer: sdsSBHeight12,
          children: controller.declaredStaffs.map(
            (staff) {
              return _buildStaffItem(staff);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStaffItem(DeclaredStaffModel staff) {
    return Slidable(
      key: ValueKey(staff.id),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (ctx) {
              controller.showDialogDeleteStaff(staff);
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            child: SDSBuildText(
              LocaleKeys.app_delete.tr,
              style: AppTextStyle.font20Bo.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(AppDimens.radius16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_IC_PERSONAL_SVG),
                sdsSBWidth8,
                SDSBuildText(
                  staff.name,
                  style: AppTextStyle.font16Bo,
                ),
                if (staff.bhxhNumber.isNotEmpty)
                  SDSBuildText(
                    ' - ${staff.bhxhNumber}',
                    style: AppTextStyle.font16Bo,
                  ),
                const Spacer(),
                // SDSImageSvg(Assets.ASSETS_ICONS_IC_DELETE_SVG),
                _buildMenuPopupOnption(staff),
              ],
            ),
          ],
        ).paddingSymmetric(
          vertical: AppDimens.paddingSmall,
          horizontal: AppDimens.defaultPadding,
        ),
      ),
    );
  }

  Widget _buildMenuPopupOnption(DeclaredStaffModel staff) {
    return PopupMenuButton<ActionPopupStaffEnum>(
      surfaceTintColor: AppColors.basicWhite,
      constraints: const BoxConstraints(),
      color: AppColors.basicWhite,
      icon: const Icon(Icons.more_horiz),
      onSelected: (action) {
        if (action == ActionPopupStaffEnum.edit) {
          // Gọi hàm sửa
          controller.updateStaff(staff);
        } else if (action == ActionPopupStaffEnum.delete) {
          // Gọi hàm xóa
          controller.showDialogDeleteStaff(staff);
        }
      },
      itemBuilder: (ctx) {
        return ActionPopupStaffEnum.values.map(
          (action) {
            return PopupMenuItem<ActionPopupStaffEnum>(
              value: action,
              child: Row(
                children: [
                  SDSBuildText(action.title),
                  sdsSBWidth16,
                  Icon(
                    action.icon,
                    color: AppColors.dsGray3,
                  ),
                ],
              ),
            );
          },
        ).toList();
      },
    );
  }

  Widget _buildSubmitButton() {
    return AppSolidButton(
      title: LocaleKeys.staffList_continue.tr,
      onPressed: controller.saveXml,
    );
  }

  Widget _buildAddNewStaffButton() {
    return AppOutlineButton(
      title: LocaleKeys.staffList_addNewStaff.tr,
      throttleKey: 'createStaff',
      onPressed: controller.createStaff,
    );
  }
}
