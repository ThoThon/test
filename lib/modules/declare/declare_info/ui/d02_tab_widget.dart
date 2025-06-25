part of 'declare_info_page.dart';

extension D02TabWidget on DeclareInfoPage {
  Widget _buildD02TabBody() {
    return Column(
      children: [
        // Obx(
        //   () {
        //     if (controller.isShowScanIDButton) {
        //       return _buildScanIDButton(
        //         onTap: () {
        //           controller.goToScanCCCD();
        //         },
        //       );
        //     }
        //     return UtilWidget.shrink;
        //   },
        // ),
        UtilWidget.sizedBox8,
        Expanded(
          child: Obx(
            () {
              return Form(
                key: controller.d02State.formKey,
                autovalidateMode: controller.d02State.autoValidateMode.value,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputFullName(
                        onTapSelectStaff: controller.goToSelectStaffPage,
                      ),
                      UtilWidget.sizedBox8,
                      _buildInputBHXHCode(),
                      UtilWidget.sizedBox8,
                      _buildSelectDeclareType(),
                      UtilWidget.sizedBox16,
                      _buildSelectPlan(),
                      _buildGenerateTk1DataCheckbox(),
                      UtilWidget.sizedBox16,
                      _buildInputCCCD(),
                      UtilWidget.sizedBox16,
                      _buildBirthTypeDropdown(),
                      UtilWidget.sizedBox16,
                      _buildSelectDateOfBirth(),
                      UtilWidget.sizedBox12,
                      _buildSelectGender(),
                      UtilWidget.sizedBox8,
                      _buildSelectEthnic(),
                      _buildSelectNationality(),
                      _buildSelectFromDate(),
                      UtilWidget.sizedBox16,
                      _buildSelectToDate(),
                      UtilWidget.sizedBox16,
                      _buildInputPosition(),
                      UtilWidget.sizedBox16,
                      _buildInputWorkplace(),
                      UtilWidget.sizedBox16,
                      _buildSalaryCoefficientCheckbox(),
                      UtilWidget.sizedBox16,
                      _buildInputSalaryCoefficient(),
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
                      UtilWidget.buildCheckboxWithLabel(
                        label: 'Sinh dữ liệu D01-TS',
                        value: controller.d02State.isGenerateD01Data.value,
                        onChanged: (value) {
                          controller.d02State.isGenerateD01Data.value = value;
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSelectToDate() {
    return Obx(
      () => UtilWidget.buildInputSelectDate(
        title: LocaleKeys.declareInfo_toMonthYear.tr,
        inputFormatters: InputFormatterEnum.dateMonthYear,
        controller: controller.d02State.toDateTextCtrl,
        hintText: PATTERN_12,
        isRequired: controller.isToDateRequired,
        onSelectDate: () async {
          final selectedDate = await UtilWidget.showPeriodDatePicker(
            dateTime: convertStringToDateSafe(
              controller.d02State.toDateTextCtrl.text,
              PATTERN_12,
            ),
          );
          if (selectedDate != null) {
            controller.d02State.toDateTextCtrl.text =
                convertDateToString(selectedDate, PATTERN_12);
          }
        },
        validator: (value) {
          final trimmedValue = value?.trim();

          // Nếu bắt buộc và không nhập thì báo lỗi
          if (controller.isToDateRequired &&
              (trimmedValue == null || trimmedValue.isEmpty)) {
            return LocaleKeys.declareInfo_toMonthYearCannotEmpty.tr;
          }
          if (trimmedValue == null || trimmedValue.isEmpty) {
            return null;
          }

          // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
          if (trimmedValue.length < 7) {
            return LocaleKeys.declareInfo_toDateInvalid.tr;
          }

          final toDate = convertStringToDateStrict(trimmedValue, PATTERN_12);
          if (toDate == null) {
            return LocaleKeys.declareInfo_toDateInvalid.tr;
          }

          // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
          if (toDate.year <= 1900 || toDate.year >= 2100) {
            return LocaleKeys.declareInfo_toDateInvalid.tr;
          }

          final fromDate = convertStringToDateStrict(
            controller.d02State.fromDateTextCtrl.text,
            PATTERN_12,
          );

          if (fromDate != null && toDate.isBefore(fromDate)) {
            return LocaleKeys.declareInfo_toDateCannotBeforFromDate.tr;
          }

          return null;
        },
      ),
    );
  }

  Widget _buildSelectFromDate() {
    return Obx(
      () => UtilWidget.buildInputSelectDate(
        title: LocaleKeys.declareInfo_fromMonthYear.tr,
        controller: controller.d02State.fromDateTextCtrl,
        hintText: PATTERN_12,
        isRequired: controller.isFromDateRequired,
        inputFormatters: InputFormatterEnum.dateMonthYear,
        onSelectDate: () async {
          final selectedDate = await UtilWidget.showPeriodDatePicker(
            dateTime: convertStringToDateSafe(
              controller.d02State.fromDateTextCtrl.text,
              PATTERN_12,
            ),
          );
          if (selectedDate != null) {
            controller.d02State.fromDateTextCtrl.text =
                convertDateToStringSafe(selectedDate, PATTERN_12) ?? '';
          }
        },
        validator: (value) {
          final trimmedValue = value?.trim();
          // Nếu bắt buộc và không nhập thì báo lỗi
          if (controller.isFromDateRequired &&
              (trimmedValue == null || trimmedValue.isEmpty)) {
            return LocaleKeys.declareInfo_fromMonthYearCannotEmpty.tr;
          }

          if (trimmedValue == null || trimmedValue.isEmpty) {
            // Không bắt buộc
            return null;
          }
          // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
          if (trimmedValue.length < 7) {
            return LocaleKeys.declareInfo_fromDateInvalid.tr;
          }

          final fromDate = convertStringToDateStrict(trimmedValue, PATTERN_12);

          if (fromDate == null) {
            return LocaleKeys.declareInfo_fromDateInvalid.tr;
          }

          // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
          if (fromDate.year <= 1900 || fromDate.year >= 2100) {
            return LocaleKeys.declareInfo_fromDateInvalid.tr;
          }
          final toDate = convertStringToDateStrict(
            controller.d02State.toDateTextCtrl.text,
            PATTERN_12,
          );

          if (toDate != null && fromDate.isAfter(toDate)) {
            return LocaleKeys.declareInfo_fromDateCannotAfterToDate.tr;
          }

          return null;
        },
      ),
    );
  }

  Widget _buildSelectDeclareType() {
    return UtilWidget.buildDropDownWithLabel2<DeclarationTypeModel>(
      label: LocaleKeys.declareInfo_declarationType.tr,
      hintText: LocaleKeys.declareInfo_selectDeclarationType.tr,
      items: AppData.instance.declarationTypes.toList(),
      display: (item) => item.text,
      selectedItem: controller.d02State.declarationType.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.d02State.plan.value = null;
        controller.d02State.declarationType.value = value;
      },
    );
  }

  Widget _buildSelectPlan() {
    return Obx(
      () {
        final plans = controller.d02State.declarationType.value?.plans;

        if (plans == null || plans.isEmpty) {
          return UtilWidget.shrink;
        }

        return UtilWidget.buildDropDownWithLabel2<AdjustmentPlanModel>(
          label: LocaleKeys.declareInfo_plan.tr,
          hintText: LocaleKeys.declareInfo_selectPlan.tr,
          autovalidateMode: AutovalidateMode.always,
          items: plans.toList(),
          display: (item) => '${item.id} - ${item.name}',
          selectedItem: controller.d02State.plan.value,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            controller.d02State.plan.value = value;
            controller.updateHouseholdInfoRequired();
            controller.d02State.isGenerateTk1Data.value =
                value.isGenerateTk1(controller.d02State.declarationType.value);
          },
        ).paddingOnly(bottom: AppDimens.defaultPadding);
      },
    );
  }

  Widget _buildGenerateTk1DataCheckbox() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_generateTk1Data.tr,
      value: controller.d02State.isGenerateTk1Data.value,
      onChanged: (value) {
        controller.d02State.isGenerateTk1Data.value = value;
      },
    );
  }

  Widget _buildInputPosition() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_position.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.positionTextCtrl,
          isValidate: true,
          maxLengthInputForm: 500,
          inputFormatters: InputFormatterEnum.textNormal,
          suffixIcon: IconButton(
            onPressed: () {
              Get.bottomSheet(
                BottomSheetSearch<PositionModel>(
                  maxLength: 500,
                  title: LocaleKeys.declareInfo_selectPosition.tr,
                  listFilter: AppData.instance.positions.toList(),
                  selectedItem: AppData.instance.positions.firstWhereOrNull(
                    (position) =>
                        position.name ==
                        controller.d02State.positionTextCtrl.text.trim(),
                  ),
                  display: (value) => value.name,
                  onAccept: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.d02State.positionTextCtrl.text = value.name;
                  },
                ),
                isScrollControlled: true,
              );
            },
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.dsGray3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputWorkplace() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_workplace.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.workplaceTextCtrl,
          isValidate: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        ),
      ),
    );
  }

  Widget _buildSalaryCoefficientCheckbox() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_payBySalaryCoefficient.tr,
      value: controller.d02State.isSalaryCoefficient.value,
      onChanged: (value) {
        controller.onChangeSalaryCoefficient(value: value);
      },
    );
  }

  Widget _buildInputSalaryCoefficient() {
    return Obx(
      () {
        // isSalaryCoefficient: true => Đóng theo hệ số => cho phép nhập số thập phân
        // ngược lại => chỉ cho phép nhập số nguyên
        final isSalaryCoefficient =
            controller.d02State.isSalaryCoefficient.value;
        return BuildInputTextWithLabel(
          label: LocaleKeys.declareInfo_salaryCoefficient.tr,
          buildInputText: BuildInputText(
            InputTextModel(
              inputFormatters: isSalaryCoefficient
                  ? InputFormatterEnum.salaryCurrency
                  : InputFormatterEnum.salaryNormal,
              controller: controller.d02State.salaryCoefficientTextCtrl,
              isValidate: true,
              textInputType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Tiền lương/Hệ số không được bỏ trống';
                }

                if (!isSalaryCoefficient && value.contains(',')) {
                  return 'Tiền lương/Hệ số phải là số nguyên';
                }

                return null;
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputPositionAllowance() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: BuildInputTextWithLabel(
        label: LocaleKeys.declareInfo_positionAllowance.tr,
        buildInputText: BuildInputText(
          InputTextModel(
            controller: controller.d02State.positionAllowanceTextCtrl,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            isReadOnly: isReadOnly,
            inputFormatters: InputFormatterEnum.percent,
          ),
        ),
      ),
    );
  }

  Widget _buildInputPCTNN() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: BuildInputTextWithLabel(
        label: LocaleKeys.declareInfo_pcTNN.tr,
        buildInputText: BuildInputText(
          InputTextModel(
            controller: controller.d02State.pcTNNTextCtrl,
            textInputType: TextInputType.number,
            inputFormatters: InputFormatterEnum.digitsOnly,
            maxLengthInputForm: 2,
            isReadOnly: isReadOnly,
          ),
        ),
      ),
    );
  }

  Widget _buildInputPcTNVuotKhung() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: BuildInputTextWithLabel(
        label: LocaleKeys.declareInfo_pcTNVuotKhung.tr,
        buildInputText: BuildInputText(
          InputTextModel(
            controller: controller.d02State.pcTNVuotKhungTextCtrl,
            textInputType: TextInputType.number,
            inputFormatters: InputFormatterEnum.digitsOnly,
            maxLengthInputForm: 2,
            isReadOnly: isReadOnly,
          ),
        ),
      ),
    );
  }

  Widget _buildInputSalaryAllowance() {
    final isReadOnly = controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: BuildInputTextWithLabel(
        label: LocaleKeys.declareInfo_salaryAllowance.tr,
        buildInputText: BuildInputText(
          InputTextModel(
            controller: controller.d02State.salaryAllowanceTextCtrl,
            textInputType: TextInputType.number,
            isReadOnly: isReadOnly,
            inputFormatters: InputFormatterEnum.salaryNormal,
          ),
        ),
      ),
    );
  }

  Widget _buildInputOtherAllowance() {
    final isReadOnly = controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: BuildInputTextWithLabel(
        label: LocaleKeys.declareInfo_otherAllowance.tr,
        buildInputText: BuildInputText(
          InputTextModel(
            controller: controller.d02State.otherAllowanceTextCtrl,
            textInputType: TextInputType.number,
            isReadOnly: isReadOnly,
            inputFormatters: InputFormatterEnum.salaryNormal,
          ),
        ),
      ),
    );
  }

  Widget _buildInputNote() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_note.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.noteTextCtrl,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        ),
      ),
    );
  }
}
