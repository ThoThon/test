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
                    controller.d02State.isGenerateD01Data.value = value;
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
        final declarationType = controller.d02State.declarationType.value;
        // TODO: Map phương án từ API
        // final plans = declarationType?.plans;
        final plans = null;

        if (plans == null || plans.isEmpty) {
          return UtilWidget.shrink;
        }

        return UtilWidget.buildDropDownWithLabel2<PlanEnum>(
          label: LocaleKeys.declareInfo_plan.tr,
          hintText: LocaleKeys.declareInfo_selectPlan.tr,
          autovalidateMode: AutovalidateMode.always,
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
        controller.onChangeSalaryCoefficient(value: value);
      },
    );
  }

  Widget _buildInputSalaryCoefficient() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_salaryCoefficient.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          inputFormatters: InputFormatterEnum.salaryCurrency,
          controller: controller.d02State.salaryCoefficientTextCtrl,
          isValidate: true,
          textInputType: TextInputType.number,
        ),
      ),
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
            textInputType: TextInputType.number,
            isReadOnly: isReadOnly,
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
          maxLengthInputForm: 500,
        ),
      ),
    );
  }
}
