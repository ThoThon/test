part of 'staff_list_page.dart';

extension StaffListWidget on StaffListPage {
  Widget _buildBody() {
    return Column(
      children: [
        sdsSBHeight16,
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: AppDimens.defaultPadding,
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
                    _buildSelectImageSection(),
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

  Widget _buildSelectImageSection() {
    // Với thủ tục 612, không hiển thị phần đính kèm ảnh - BHW-2647
    if (controller.procedureType == ProcedureType.procedure612) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        sdsSBHeight12,
        Row(
          children: [
            SDSBuildText(
              LocaleKeys.staffList_attachFile.tr,
              style: AppTextStyle.font16Bo,
            ),
            sdsSBWidth8,
            const Tooltip(
              verticalOffset: -50,
              margin: EdgeInsets.only(right: AppDimens.padding32),
              message: "Chỉ cho phép chọn tối đa 5 file",
              triggerMode: TooltipTriggerMode.tap,
              child: Icon(
                Icons.help_outline,
                size: 16,
              ),
            ),
          ],
        ),
        sdsSBHeight8,
        AppSelectImageWidget(
          checkMaxImageAttachments: controller.checkMaxImageAttachments,
          onPickImage: controller.pickImage,
          onTakePhoto: controller.takePhoto,
        ),
        _buildAttachImages(),
      ],
    );
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Row(
        children: [
          SDSImageSvg(Assets.ASSETS_ICONS_IC_PERSONAL_SVG),
          sdsSBWidth8,
          Expanded(
            child: SDSBuildText(
              staff.bhxhNumber.isNotEmpty
                  ? '${staff.name} - ${staff.bhxhNumber}'
                  : staff.name,
              maxLines: 3,
              style: AppTextStyle.font16Bo,
            ),
          ),
          _buildMenuPopupOnption(staff),
        ],
      ).paddingSymmetric(
        vertical: AppDimens.paddingSmall,
        horizontal: AppDimens.defaultPadding,
      ),
    );
  }

  Widget _buildMenuPopupOnption(DeclaredStaffModel staff) {
    return PopupMenuButton<ActionPopupStaffEnum>(
      surfaceTintColor: AppColors.basicWhite,
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      color: AppColors.basicWhite,
      icon: const Icon(Icons.more_horiz),
      offset: const Offset(12, 40),
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
              padding: const EdgeInsets.only(left: AppDimens.padding24),
              value: action,
              child: Row(
                children: [
                  SDSImageSvg(
                    action.iconAsset,
                    color: AppColors.colorBlack,
                    height: AppDimens.sizeIconDefault,
                    width: AppDimens.sizeIconDefault,
                  ),
                  sdsSBWidth16,
                  SDSBuildText(action.title),
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
      onPressed: controller.onTapButtonContinue,
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
