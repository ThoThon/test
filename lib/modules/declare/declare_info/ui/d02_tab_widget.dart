part of 'declare_info_page.dart';

extension D02TabWidget on DeclareInfoPage {
  Widget _buildD02TabBody() {
    return Form(
      key: controller.d02State.formKey,
      child: Column(
        children: [
          _buildScanIDButton(
            onTap: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Obx(
                () {
                  return Column(
                    children: [
                      _buildInputFullName(
                        onTapSelectStaff: () {},
                      ),
                      UtilWidget.sizedBox16,
                      _buildInputBHXHNumber(),
                      UtilWidget.sizedBox16,
                      _buildInputCCCD(),
                      UtilWidget.sizedBox16,
                      _buildSelectDate(
                        'Ngày sinh',
                        hintText: PATTERN_1,
                        date: convertDateToStringSafe(
                            controller.d02State.dateOfBirth.value, PATTERN_1),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox12,
                      _buildSelectGender(onChanged: (value) {}),
                      UtilWidget.sizedBox8,
                      _buildBtsEthnic(),
                      _buildBtsNationality(),
                      _buildSelectDate(
                        'Từ tháng/năm',
                        hintText: PATTERN_12,
                        date: convertDateToStringSafe(
                            controller.d02State.fromDate.value, PATTERN_12),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox16,
                      _buildSelectDate(
                        'Đến tháng/năm',
                        hintText: PATTERN_12,
                        date: convertDateToStringSafe(
                            controller.d02State.toDate.value, PATTERN_12),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox16,
                      _buildInputPosition(),
                      UtilWidget.sizedBox16,
                      _buildInputWorkplace(),
                      UtilWidget.sizedBox16,
                      _buildInputSalary(),
                      UtilWidget.sizedBox16,
                      _buildInputPositionAllowance(),
                      UtilWidget.sizedBox16,
                      _buildInputPCTNN(),
                      UtilWidget.sizedBox16,
                      _buildInputPcTNVuotKhung(),
                      UtilWidget.sizedBox16,
                      _buildInputSalaryAllowance(),
                      UtilWidget.sizedBox16,
                      _buildInputOtherAllowance(),
                      UtilWidget.sizedBox16,
                      _buildInputNote(),
                    ],
                  );
                },
              ),
            ),
          ),
          // UtilWidget.buildSolidButton(
          //   title: 'Tiếp theo',
          //   onPressed: () {
          //     if (controller.d02State.formKey.currentState?.validate() ??
          //         false) {
          //       print("Form is valid");
          //     }
          //   },
          // ),
          _buildBottomButtons()
        ],
      ),
    );
  }

  Widget _buildInputCCCD() {
    return BuildInputTextWithLabel(
      label: 'Số CCCD',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.cccdTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputBHXHNumber() {
    return BuildInputTextWithLabel(
      label: 'Mã số BHXH',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.bhxhTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputFullName({
    VoidCallback? onTapSelectStaff,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInputTitle(
                title: 'Họ và tên',
                isRequired: true,
              ),
            ),
            TextButton(
              onPressed: onTapSelectStaff,
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.symmetric(
                  vertical: AppDimens.paddingSmallest,
                  horizontal: AppDimens.paddingSmall,
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: SDSBuildText(
                'Chọn nhân viên',
                style: AppTextStyle.font16Re.copyWith(
                  color: AppColors.primaryColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        BuildInputText(
          InputTextModel(
            controller: controller.d02State.fullNameTextCtrl,
            hintText: 'Nhập thông tin họ tên',
            obscureText: true,
            isValidate: true,
            validator: (value) {
              if (value.isNullOrEmpty) {
                return 'Họ và tên không được để trống';
              }
              return null;
            },
          ),
        ),
      ],
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

  Widget _buildSelectDate(
    String title, {
    String? date,
    String? hintText,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInputTitle(
          title: title,
          isRequired: true,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        Material(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            child: Container(
              padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                border: Border.all(color: AppColors.dsGray4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SDSBuildText(
                    date ?? hintText ?? '',
                    style: AppTextStyle.font16Re.copyWith(
                      color:
                          date != null ? AppColors.dsGray1 : AppColors.dsGray3,
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.ASSETS_ICONS_IC_CALENDAR_SVG,
                    width: AppDimens.sizeIconMedium,
                    height: AppDimens.sizeIconMedium,
                  )
                ],
              ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
            ),
          ),
        ),
      ],
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
              groupValue: controller.d02State.gender.value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
            SDSBuildText(
              'Nam',
              style: AppTextStyle.font16Re,
            ),
            Radio<Gender>(
              value: Gender.female,
              groupValue: controller.d02State.gender.value,
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

  Widget _buildBtsEthnic() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Dân tộc',
      hintText: 'Chọn dân tộc',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn dân tộc',
            listFilter: ['Hà Nội', 'Phú Thọ', 'Bắc Ninh'],
            itemSelect: controller.d02State.selectedEthnic,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.d02State.selectedEthnic.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.d02State.selectedEthnic,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Dân tộc không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildBtsNationality() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Quốc tịch',
      hintText: 'Chọn quốc tịch',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn quốc tịch',
            listFilter: ['Việt Nam', 'Lào', 'Campuchia'],
            itemSelect: controller.d02State.selectedNationality,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.d02State.selectedNationality.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.d02State.selectedNationality,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Quốc tịch không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildInputPosition() {
    return BuildInputTextWithLabel(
      label: 'Cấp bập/chức vụ',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.positionTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputWorkplace() {
    return BuildInputTextWithLabel(
      label: 'Nơi làm việc',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.workplaceTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputSalary() {
    return BuildInputTextWithLabel(
      label: 'Tiền lương/Hệ số',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.salaryTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputPositionAllowance() {
    return BuildInputTextWithLabel(
      label: 'PC chức vụ',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.positionAllowanceTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputPCTNN() {
    return BuildInputTextWithLabel(
      label: 'PC TNN (%)',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.pcTNNTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputPcTNVuotKhung() {
    return BuildInputTextWithLabel(
      label: 'PC TN vượt khung (%)',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.pcTNVuotKhungTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputSalaryAllowance() {
    return BuildInputTextWithLabel(
      label: 'Phụ cấp lương',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.salaryAllowanceTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputOtherAllowance() {
    return BuildInputTextWithLabel(
      label: 'Phụ cấp lương',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.otherAllowanceTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputNote() {
    return BuildInputTextWithLabel(
      label: 'Ghi chú',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.noteTextCtrl,
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Lưu nháp',
            onPressed: () {},
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Tiếp theo',
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
