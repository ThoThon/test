part of 'family_member_detail_page.dart';

extension FamilyMemberDetailWidget on FamilyMemberDetailPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
            ),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputFullName(),
                    UtilWidget.sizedBox16,
                    _buildInputBHXHNumber(),
                    UtilWidget.sizedBox16,
                    UtilWidget.buildSelectDate(
                      'Ngày sinh',
                      hintText: PATTERN_1,
                      date: convertDateToStringSafe(
                        controller.dateOfBirth.value,
                        PATTERN_1,
                      ),
                      onTap: () {},
                    ),
                    UtilWidget.sizedBox12,
                    _buildSelectGender(onChanged: (value) {}),
                    UtilWidget.sizedBox8,
                    _buildSelectEthnic(),
                    _buildSelectNationality(),
                    _buildSelectProvince(),
                    _buildSelectDistrict(),
                    _buildSelectWard(),
                    _buildDropdownRelationship(),
                    UtilWidget.buildCheckboxWithLabel(
                      label: 'Là người tham gia',
                      value: controller.isParticipant.value,
                      onChanged: (value) {
                        controller.isParticipant.value = value ?? false;
                      },
                    ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
                  ],
                );
              },
            ),
          ),
        ),
        _buildBottomButtons(),
      ],
    );
  }

  Widget _buildInputFullName() {
    return BuildInputTextWithLabel(
      label: 'Họ và tên',
      buildInputText: BuildInputText(
        InputTextModel(
            controller: controller.fullNameTextCtrl, isValidate: true),
      ),
    );
  }

  Widget _buildInputBHXHNumber() {
    return BuildInputTextWithLabel(
      label: 'Mã số BHXH',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.bhxhTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputTitle({
    required String title,
    bool isRequired = false,
  }) {
    return RichText(
      text: TextSpan(
        text: title,
        style: AppTextStyle.font16Bo,
        children: [
          if (isRequired)
            TextSpan(
              text: ' (*)',
              style: AppTextStyle.font12Re.copyWith(
                color: AppColors.statusRed,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSelectGender({
    ValueChanged<Gender?>? onChanged,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInputTitle(
              title: 'Giới tính',
              isRequired: true,
            ),
            Radio<Gender>(
              value: Gender.male,
              groupValue: controller.gender.value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
            SDSBuildText(
              'Nam',
              style: AppTextStyle.font16Re,
            ),
            Radio<Gender>(
              value: Gender.female,
              groupValue: controller.gender.value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
            SDSBuildText(
              'Nữ',
              style: AppTextStyle.font16Re,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectEthnic() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Dân tộc',
      hintText: 'Chọn dân tộc',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn dân tộc',
            listFilter: ['Kinh', 'Thái', 'Tày'],
            itemSelect: controller.selectedEthnic,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedEthnic.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedEthnic,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Dân tộc không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectNationality() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Quốc tịch',
      hintText: 'Chọn quốc tịch',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn quốc tịch',
            listFilter: ['Việt Nam', 'Lào', 'Campuchia'],
            itemSelect: controller.selectedNationality,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedNationality.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedNationality,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Quốc tịch không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectProvince() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Tỉnh khai sinh',
      hintText: 'Chọn tỉnh khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn tỉnh khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedProvince,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedProvince.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedProvince,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Tỉnh khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrict() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Huyện khai sinh',
      hintText: 'Chọn huyện khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn huyện khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedDistrict,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedDistrict.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedDistrict,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Huyện khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectWard() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Xã khai sinh',
      hintText: 'Chọn xã khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn xã khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedWard,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedWard.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedWard,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Xã khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildDropdownRelationship() {
    return UtilWidget.buildDropDownWithLabel<String>(
      label: 'Mối quan hệ với chủ hộ',
      hintText: 'Chọn mối quan hệ với chủ hộ',
      items: ['Vợ', 'Con trai', 'Con gái'],
      display: (item) => item,
      selectedItem: controller.selectedRelationship.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.selectedRelationship.value = value;
      },
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Lưu',
            onPressed: () {},
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Hủy bỏ',
            onPressed: () {},
          ),
        ),
      ],
    ).paddingOnly(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      top: AppDimens.defaultPadding,
    );
  }
}
