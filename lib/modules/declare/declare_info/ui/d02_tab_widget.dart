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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputFullName(
                        onTapSelectStaff: controller.showDialogSelectStaff,
                      ),
                      UtilWidget.sizedBox16,
                      _buildInputBHXHNumber(),
                      UtilWidget.sizedBox16,
                      _buildSelectDeclareType(),
                      UtilWidget.sizedBox16,
                      _buildSelectPlan(),
                      UtilWidget.sizedBox16,
                      UtilWidget.buildCheckboxWithLabel(
                        label: 'SInh dữ liệu TK1-TS',
                        value: controller.d02State.isGenerateTk1Data.value,
                        onChanged: (value) {
                          controller.d02State.isGenerateTk1Data.value =
                              value ?? false;
                        },
                      ),
                      UtilWidget.sizedBox16,
                      _buildInputCCCD(),
                      UtilWidget.sizedBox16,
                      _buildSelectDate(
                        'Ngày sinh',
                        hintText: PATTERN_1,
                        date: convertDateToStringSafe(
                          controller.d02Tk1State.dateOfBirth.value,
                          PATTERN_1,
                        ),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox12,
                      _buildSelectGender(onChanged: (value) {}),
                      UtilWidget.sizedBox8,
                      _buildSelectEthnic(),
                      _buildSelectNationality(),
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
          _buildD02BottomButtons()
        ],
      ),
    );
  }

  Widget _buildSelectDeclareType() {
    return UtilWidget.buildDropDownWithLabel<String>(
      label: 'Loại khai báo',
      hintText: 'Chọn loại khai báo',
      items: ['Tăng lao động', 'Giảm lao động', 'Tăng lương', 'Giảm lương'],
      display: (item) => item,
      selectedItem: controller.d02State.declareType.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.d02State.declareType.value = value;
      },
    );
  }

  Widget _buildSelectPlan() {
    return UtilWidget.buildDropDownWithLabel<String>(
      label: 'Phương án',
      hintText: 'Chọn phương án',
      items: ['A', 'B', 'C', 'D'],
      display: (item) => item,
      selectedItem: controller.d02State.plan.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.d02State.plan.value = value;
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

  Widget _buildD02BottomButtons() {
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
