part of 'declare_info_page.dart';

extension D02TabWidget on DeclareInfoPage {
  Widget _buildD02TabBody() {
    return Form(
      key: controller.d02State.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
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
                _buildSelectDateOfBirth(),
                UtilWidget.sizedBox12,
                _buildSelectGender(
                  onChanged: (value) {
                    controller.d02Tk1State.gender.value = value;
                  },
                ),
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
                UtilWidget.sizedBox16,
                UtilWidget.buildCheckboxWithLabel(
                  label: 'Sinh dữ liệu D01-TS',
                  value: controller.d02State.isGenerateD01Data.value,
                  onChanged: (value) {
                    controller.d02State.isGenerateD01Data.value =
                        value ?? false;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSelectToDate() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.declareInfo_toMonthYear.tr,
      hintText: PATTERN_12,
      date: convertDateToStringSafe(
        controller.d02State.toDate.value,
        PATTERN_12,
      ),
      onTap: () async {
        final selectedDate = await UtilWidget.showPeriodDatePicker();
        if (selectedDate != null) {
          controller.d02State.toDate.value = selectedDate;
        }
      },
    );
  }

  Widget _buildSelectFromDate() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.declareInfo_fromMonthYear.tr,
      hintText: PATTERN_12,
      date: convertDateToStringSafe(
        controller.d02State.fromDate.value,
        PATTERN_12,
      ),
      onTap: () async {
        final selectedDate = await UtilWidget.showPeriodDatePicker();
        if (selectedDate != null) {
          controller.d02State.fromDate.value = selectedDate;
        }
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.declareInfo_dob.tr,
      hintText: PATTERN_1,
      date: convertDateToStringSafe(
        controller.d02Tk1State.dateOfBirth.value,
        PATTERN_1,
      ),
      onTap: () async {
        final selectedDate =
            await UtilWidget.showDateTimePicker(dateTimeInit: DateTime.now());
        if (selectedDate != null) {
          controller.d02Tk1State.dateOfBirth.value = selectedDate;
        }
      },
    );
  }

  Widget _buildSelectDeclareType() {
    return UtilWidget.buildDropDownWithLabel2<DeclarationTypeEnum>(
      label: LocaleKeys.declareInfo_declarationType.tr,
      hintText: LocaleKeys.declareInfo_selectDeclarationType.tr,
      items: DeclarationTypeEnum.values,
      display: (item) => item.title,
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
        final declarationType = controller.d02State.declarationType.value;
        final plans = declarationType?.plans;

        if (plans == null || plans.isEmpty) {
          return UtilWidget.shrink;
        }

        return UtilWidget.buildDropDownWithLabel2<PlanEnum>(
          label: LocaleKeys.declareInfo_declarationType.tr,
          hintText: LocaleKeys.declareInfo_selectDeclarationType.tr,
          items: plans,
          display: (item) => item.title,
          selectedItem: controller.d02State.plan.value,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            controller.d02State.plan.value = value;
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
        controller.d02State.isGenerateTk1Data.value = value ?? false;
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
        controller.d02State.isSalaryCoefficient.value = value ?? false;
      },
    );
  }

  Widget _buildInputSalaryCoefficient() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_salaryCoefficient.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.salaryCoefficientTextCtrl,
          isValidate: true,
          textInputType: TextInputType.number,
        ),
      ),
    );
  }

  Widget _buildInputPositionAllowance() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_positionAllowance.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.positionAllowanceTextCtrl,
          textInputType: TextInputType.number,
          isReadOnly: !controller.d02State.isSalaryCoefficient.value,
        ),
      ),
    );
  }

  Widget _buildInputPCTNN() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_pcTNN.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.pcTNNTextCtrl,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.digitsOnly,
          maxLengthInputForm: 2,
          isReadOnly: !controller.d02State.isSalaryCoefficient.value,
        ),
      ),
    );
  }

  Widget _buildInputPcTNVuotKhung() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_pcTNVuotKhung.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.pcTNVuotKhungTextCtrl,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.digitsOnly,
          maxLengthInputForm: 2,
          isReadOnly: !controller.d02State.isSalaryCoefficient.value,
        ),
      ),
    );
  }

  Widget _buildInputSalaryAllowance() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_salaryAllowance.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.salaryAllowanceTextCtrl,
          textInputType: TextInputType.number,
          isReadOnly: controller.d02State.isSalaryCoefficient.value,
        ),
      ),
    );
  }

  Widget _buildInputOtherAllowance() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_otherAllowance.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02State.otherAllowanceTextCtrl,
          textInputType: TextInputType.number,
          isReadOnly: controller.d02State.isSalaryCoefficient.value,
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
          maxLengthInputForm: 500,
        ),
      ),
    );
  }
}
