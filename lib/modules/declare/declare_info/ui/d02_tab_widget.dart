part of 'declare_info_page.dart';

extension D02TabWidget on DeclareInfoPage {
  Widget _buildD02TabBody() {
    return AppFormRegistry(
      key: controller.d02State.registeredKey,
      child: Column(
        children: [
          UtilWidget.sizedBox8,
          Expanded(
            child: Obx(
              () {
                return Form(
                  key: controller.d02State.formKey,
                  autovalidateMode: controller.d02State.autoValidateMode.value,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thông tin cá nhân
                        _buildInfoPerson(
                          onTapSelectStaff: controller.goToSelectStaffPage,
                        ),
                        sdsSBHeight8,

                        // Họ và tên
                        _buildInputFullName(
                          registrarId: '656f5251-54af-4d8a-b868-bcdd872c157b',
                        ),
                        sdsSBHeight12,

                        // Mã số BHXH
                        _buildInputBHXHCode(
                          registrarId: '162ab5e7-e059-4b85-9171-2e659201e0b8',
                        ),
                        sdsSBHeight12,

                        // Số CCCD
                        _buildInputCCCD(
                          registrarId: 'e374d484-1ccc-48c1-ad67-4594977a736a',
                        ),
                        sdsSBHeight12,

                        // Loại ngày sinh
                        _buildBirthTypeDropdown(),
                        sdsSBHeight12,

                        // Ngày sinh và Giới tính
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: _buildSelectDateOfBirth(
                                    registrarId:
                                        'df4dddc2-010a-4272-bf6d-742f3c24fa43')),
                            sdsSBWidth12,
                            Expanded(child: _buildSelectGender()),
                          ],
                        ),
                        sdsSBHeight8,

                        // Sinh dữ liệu TK1-TS
                        _buildGenerateTk1DataCheckbox(),
                        sdsSBWidth12,
                        SDSBuildText(
                          LocaleKeys.declareInfo_salaryBhxhInfo.tr,
                          style: AppTextStyle.font16Bo,
                        ),

                        // Đóng theo hệ số
                        _buildSalaryCoefficientCheckbox(),
                        sdsSBHeight4,

                        // Tiền lương
                        _buildInputSalaryCoefficient(),
                        sdsSBHeight12,

                        // PC chức vụ
                        _buildInputPositionAllowance(),
                        sdsSBHeight12,

                        // PC thâm niên nghề
                        _buildInputPCTNN(),
                        sdsSBHeight12,

                        // PC thâm niên vượt khung
                        _buildInputPcTNVuotKhung(),
                        sdsSBHeight12,

                        // Phụ cấp lương
                        _buildInputSalaryAllowance(),
                        sdsSBHeight12,

                        // Các khoản bổ sung
                        _buildInputOtherAllowance(),
                        sdsSBHeight12,

                        // Thông tin khác
                        SDSBuildText(
                          LocaleKeys.declareInfo_otherInfo.tr,
                          style: AppTextStyle.font16Bo,
                        ),
                        sdsSBHeight8,
                        // Loại khai báo
                        _buildSelectDeclareType(),
                        sdsSBHeight12,

                        // Phương án
                        _buildSelectPlan(),

                        // Từ tháng/năm và Đến tháng/năm
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildSelectFromDate()),
                            sdsSBWidth12,
                            Expanded(child: _buildSelectToDate()),
                          ],
                        ),
                        sdsSBHeight12,

                        // Cấp bậc/chức vụ
                        _buildInputPosition(),
                        sdsSBHeight12,

                        // Nơi làm việc
                        _buildInputWorkplace(),
                        sdsSBHeight12,

                        // Ghi chú
                        _buildInputNote(),
                        UtilWidget.buildCheckboxWithLabel(
                          label: LocaleKeys.declareInfo_generateD01tsData.tr,
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
      ),
    );
  }

  Widget _buildInfoPerson({
    VoidCallback? onTapSelectStaff,
  }) {
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            LocaleKeys.declareInfo_personalInfo.tr,
            style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
          ),
        ),
        if (onTapSelectStaff != null)
          TextButton(
            onPressed: onTapSelectStaff,
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingSmall,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: SDSBuildText(
              LocaleKeys.declareInfo_selectStaff.tr,
              style: AppTextStyle.font14Re.copyWith(
                color: AppColors.primaryColor,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSelectToDate() {
    return FormFieldRegistrant<String>(
      registrarId: '3bf70d45-77a0-4cfe-a666-c0a8f7fdddaa',
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
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_toMonthYear.tr,
            inputFormatters: InputFormatterEnum.dateMonthYear,
            controller: controller.d02State.toDateTextCtrl,
            hintText: PATTERN_12,
            isRequired: controller.isToDateRequired,
            onSelectDate: () async {
              KeyBoard.hide();
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
          ),
        );
      },
    );
  }

  Widget _buildSelectFromDate() {
    return FormFieldRegistrant<String>(
      registrarId: 'b6ffeeb4-dc24-419a-b114-083783c6aeef',
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
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_fromMonthYear.tr,
            controller: controller.d02State.fromDateTextCtrl,
            hintText: PATTERN_12,
            isRequired: controller.isFromDateRequired,
            inputFormatters: InputFormatterEnum.dateMonthYear,
            onSelectDate: () async {
              KeyBoard.hide();
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
          ),
        );
      },
    );
  }

  Widget _buildSelectDeclareType() {
    return FormFieldRegistrant<DeclarationTypeModel>(
      registrarId: '33ca7b1b-4973-43c7-ad19-106a2a75b338',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declarationTypeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardDropdownWithLabel<DeclarationTypeModel>(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_declarationType.tr,
          hintText: LocaleKeys.declareInfo_selectDeclarationType.tr,
          items: AppData.instance.declarationTypes.toList(),
          display: (item) => item.text,
          isRequired: true,
          selectedItem: controller.d02State.declarationType.value,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            controller.d02State.plan.value = null;
            controller.d02State.declarationType.value = value;
          },
        );
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

        return FormFieldRegistrant<AdjustmentPlanModel>(
          registrarId: 'e7247821-4ddc-449a-b6be-6880ad56fa4c',
          validator: (value) {
            if (value == null) {
              return LocaleKeys.declareInfo_planCannotEmpty.tr;
            }
            return null;
          },
          builder: (fieldKey, validator) {
            return CardDropdownWithLabel<AdjustmentPlanModel>(
              fieldKey: fieldKey,
              validator: validator,
              labelText: LocaleKeys.declareInfo_plan.tr,
              hintText: LocaleKeys.declareInfo_selectPlan.tr,
              autovalidateMode: AutovalidateMode.always,
              isRequired: true,
              items: plans.toList(),
              display: (item) => '${item.id} - ${item.name}',
              selectedItem: controller.d02State.plan.value,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                controller.d02State.plan.value = value;
                controller.updateHouseholdInfoRequired();
                controller.d02State.isGenerateTk1Data.value = value
                    .isGenerateTk1(controller.d02State.declarationType.value);
              },
            ).paddingOnly(bottom: AppDimens.paddingSmall);
          },
        );
      },
    );
  }

  Widget _buildGenerateTk1DataCheckbox() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_generateTk1Data.tr,
      value: controller.d02State.isGenerateTk1Data.value,
      onChanged: (value) {
        controller.d02State.isGenerateTk1Data.value = value;
        controller.updateHouseholdInfoRequired();
      },
    );
  }

  Widget _buildInputPosition() {
    return FormFieldRegistrant<String>(
      registrarId: 'cec7caf9-e511-49ac-b1bc-306d43fa4de3',
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_positionCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_position.tr,
          controller: controller.d02State.positionTextCtrl,
          isRequired: true,
          maxLengthInputForm: 500,
          inputFormatters: InputFormatterEnum.textNormal,
          suffixIcon: IconButton(
            onPressed: () {
              KeyBoard.hide();
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
            icon: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG,
              height: AppDimens.sizeIconMedium,
              width: AppDimens.sizeIconMedium,
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputWorkplace() {
    return FormFieldRegistrant<String>(
      registrarId: '843e5285-f6b6-45df-a505-35e9e392ea47',
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_workplaceCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_workplace.tr,
          controller: controller.d02State.workplaceTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        );
      },
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
    return FormFieldRegistrant<String>(
      registrarId: 'ff767840-7713-4c4c-afae-e27447e8bc1b',
      validator: (value) {
        final isSalaryCoefficient =
            controller.d02State.isSalaryCoefficient.value;
        final isCoefficient = controller.d02State.isSalaryCoefficient.value;
        if (value == null || value.trim().isEmpty) {
          return isCoefficient
              ? LocaleKeys.declareInfo_coefficientCannotEmpty.tr
              : LocaleKeys.declareInfo_salaryCannotEmpty.tr;
        }

        if (!isSalaryCoefficient && value.contains(',')) {
          return isCoefficient
              ? LocaleKeys.declareInfo_coefficientMustBeInteger.tr
              : LocaleKeys.declareInfo_salaryMustBeInteger.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            // isSalaryCoefficient: true => Đóng theo hệ số => cho phép nhập số thập phân
            // ngược lại => chỉ cho phép nhập số nguyên
            final isSalaryCoefficient =
                controller.d02State.isSalaryCoefficient.value;
            return CardInputTextFormWithLabel(
              fieldKey: fieldKey,
              validator: validator,
              labelText: isSalaryCoefficient
                  ? LocaleKeys.declareInfo_coefficient.tr
                  : LocaleKeys.declareInfo_salaryCoefficient.tr,
              inputFormatters: isSalaryCoefficient
                  ? InputFormatterEnum.coefficient
                  : InputFormatterEnum.salaryNormal,
              controller: controller.d02State.salaryCoefficientTextCtrl,
              isRequired: true,
              textInputType:
                  const TextInputType.numberWithOptions(decimal: true),
            );
          },
        );
      },
    );
  }

  Widget _buildInputPositionAllowance() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_positionAllowance.tr,
        controller: controller.d02State.positionAllowanceTextCtrl,
        textInputType: const TextInputType.numberWithOptions(decimal: true),
        hintText: LocaleKeys.declareInfo_inputAllowance.tr,
        isReadOnly: isReadOnly,
        inputFormatters: InputFormatterEnum.percent,
      ),
    );
  }

  Widget _buildInputPCTNN() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_pcTNN.tr,
        controller: controller.d02State.pcTNNTextCtrl,
        textInputType: TextInputType.number,
        hintText: LocaleKeys.declareInfo_inputAllowancePercent.tr,
        inputFormatters: InputFormatterEnum.digitsOnly,
        maxLengthInputForm: 2,
        isReadOnly: isReadOnly,
      ),
    );
  }

  Widget _buildInputPcTNVuotKhung() {
    final isReadOnly = !controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_pcTNVuotKhung.tr,
        controller: controller.d02State.pcTNVuotKhungTextCtrl,
        textInputType: TextInputType.number,
        hintText: LocaleKeys.declareInfo_inputAllowancePercent.tr,
        inputFormatters: InputFormatterEnum.digitsOnly,
        maxLengthInputForm: 2,
        isReadOnly: isReadOnly,
      ),
    );
  }

  Widget _buildInputSalaryAllowance() {
    final isReadOnly = controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_salaryAllowance.tr,
        controller: controller.d02State.salaryAllowanceTextCtrl,
        textInputType: TextInputType.number,
        hintText: LocaleKeys.declareInfo_inputAllowance.tr,
        isReadOnly: isReadOnly,
        inputFormatters: InputFormatterEnum.salaryNormal,
      ),
    );
  }

  Widget _buildInputOtherAllowance() {
    final isReadOnly = controller.d02State.isSalaryCoefficient.value;
    return Opacity(
      opacity: isReadOnly ? 0.5 : 1,
      child: CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_otherAllowance.tr,
        controller: controller.d02State.otherAllowanceTextCtrl,
        textInputType: TextInputType.number,
        isReadOnly: isReadOnly,
        inputFormatters: InputFormatterEnum.salaryNormal,
      ),
    );
  }

  Widget _buildInputNote() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_note.tr,
      controller: controller.d02State.noteTextCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 500,
    );
  }
}
