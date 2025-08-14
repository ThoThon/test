part of 'declare_info_630a_page.dart';

extension BenefitAccountInfoGroupExt on DeclareInfo630aPage {
  Widget _buildBenefitAccountInfoGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thông tin tài khoản nhập trợ cấp
        _buildTitleInfoAccount(),
        sdsSBHeight12,

        // Hình thức nhận
        _buildReceiveMethodDropDown(),

        // Số tài khoản ngân hàng
        _buildInputBankNumber(),

        // Tên chủ tài khoản
        _buildInputAccountHolderName(),

        // Ngân hàng
        _buildSelectBank(),

        // Thông tin khác
        _buildOtherInfoGroup(),
      ],
    );
  }

  Widget _buildOtherInfoGroup() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin khác
              _buildTitleInfoOther(),
              sdsSBHeight12,

              // "Đợt đã giải quyết" và "Ngày đã giải quyết"
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildInputResolvedPeriod()),
                  sdsSBWidth12,
                  Expanded(child: _buildResolvedDate()),
                ],
              ),
              sdsSBHeight12,

              // Lý do điều chỉnh
              _buildInputAdjustReason(),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTitleInfoAccount() {
    return SDSBuildText(
      LocaleKeys.declareInfo_infoAccountTitle.tr,
      style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
    );
  }

  // Hình thức nhận
  Widget _buildReceiveMethodDropDown() {
    return FormFieldRegistrant<ReceiveFormModel>(
      registrarId: '3ab86dc5-6f4b-4350-bdd4-28aa600ac4ad',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_receiveMethodEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<ReceiveFormModel>(
            fieldKey: formFieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_receiveMethod.tr,
            hintText: LocaleKeys.declareInfo_receiveMethodHint.tr,
            items: AppData.instance.receiveForm.toList(),
            isRequired: true,
            display: (item) => item.text,
            selectedItem: controller.receiveForm.value,
            onChanged: controller.onChangeReceiveMethod,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Số tài khoản ngân hàng
  Widget _buildInputBankNumber() {
    return Obx(
      () {
        if (controller.isATMpayment) {
          return FormFieldRegistrant<String>(
            registrarId: "1068d470-d07d-4e70-b247-4fc9928748dd",
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';

              if (trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_bankNumberEmpty.tr;
              }
              if (trimmedValue.containsVietnamese) {
                return LocaleKeys.declareInfo_bankNumberInCorrectFormat.tr;
              }
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputTextFormWithLabel(
                  fieldKey: fieldKey,
                  validator: validator,
                  autovalidateMode: controller.autoValidateMode.value,
                  isRequired: controller.isATMpayment,
                  hintText: LocaleKeys.declareInfo_bankNumberHint.tr,
                  inputFormatters: InputFormatterEnum.textNormalWithoutSpace,
                  labelText: LocaleKeys.declareInfo_bankNumber.tr,
                  controller: controller.bankNumberCtrl,
                  maxLengthInputForm: 50,
                ).paddingOnly(bottom: AppDimens.paddingSmall),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  // Tên chủ tài khoản
  Widget _buildInputAccountHolderName() {
    return Obx(
      () {
        if (controller.isATMpayment) {
          return FormFieldRegistrant<String>(
            registrarId: "8f85d1ae-f6f6-4656-83b8-c681fe4ce88f",
            validator: (value) {
              final trimmedValue = value?.trim();

              if (trimmedValue == null || trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_accountHolderNameEmpty.tr;
              }

              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputTextFormWithLabel(
                  fieldKey: fieldKey,
                  validator: validator,
                  autovalidateMode: controller.autoValidateMode.value,
                  isRequired: controller.isATMpayment,
                  hintText: LocaleKeys.declareInfo_accountHolderNameHint.tr,
                  labelText: LocaleKeys.declareInfo_accountHolderName.tr,
                  controller: controller.accountHolderNameCtrl,
                  maxLengthInputForm: 100,
                ).paddingOnly(bottom: AppDimens.paddingSmall),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  // Ngân hàng
  Widget _buildSelectBank() {
    return Obx(
      () {
        if (controller.isATMpayment) {
          return FormFieldRegistrant<BankModel>(
            registrarId: '4fd76b7c-3f06-4448-9dc3-481d1569495d',
            validator: (value) {
              if (controller.selectedBank.value == null) {
                return LocaleKeys.declareInfo_bankCannotEmpty.tr;
              }
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () {
                  return UtilWidget.buildCardBottomSheetSelect2<BankModel>(
                    fieldKey: fieldKey,
                    isRequired: controller.isATMpayment,
                    validator: validator,
                    autovalidateMode: controller.autoValidateMode.value,
                    label: LocaleKeys.declareInfo_bank.tr,
                    hintText: LocaleKeys.declareInfo_bankHint.tr,
                    funcSelect: (didChange) async {
                      Get.bottomSheet(
                        BottomSheetSearch<BankModel>(
                          title: LocaleKeys.declareInfo_bankHint.tr,
                          maxLength: 20,
                          hintText: LocaleKeys.declareInfo_inputBankName.tr,
                          listFilter: AppData.instance.bank.toList(),
                          selectedItem: controller.selectedBank.value,
                          display: (value) => '${value.code} - ${value.name}',
                          onAccept: (value) {
                            if (value == null) return;
                            controller.selectedBank.value = value;
                            didChange(value);
                          },
                        ),
                        isScrollControlled: true,
                      );
                    },
                    selectedItem: controller.selectedBank.value,
                    display: (bank) => bank.name,
                  );
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTitleInfoOther() {
    return SDSBuildText(
      LocaleKeys.declareInfo_otherInfoTitle.tr,
      style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
    );
  }

  // Đợt đã giải quyết
  Widget _buildInputResolvedPeriod() {
    return FormFieldRegistrant<String>(
      registrarId: "bfe0fb31-7fa7-4b73-908d-9853227bad8e",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_resolvedPeriodEmpty.tr;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_resolvedPeriodInvalid.tr;
        }
        if (trimmedValue.substring(0, 2) == '00') {
          return LocaleKeys.declareInfo_periodInvalid.tr;
        }
        final month = int.tryParse(trimmedValue.substring(3, 5));
        if (month == null || month < 1 || month > 12) {
          return LocaleKeys.declareInfo_monthYearInvalid.tr;
        }
        final year = int.parse(trimmedValue.substring(6));
        if (year < 1900 || year > 2100) {
          return LocaleKeys.declareInfo_monthYearInvalid.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            inputFormatters: InputFormatterEnum.periodMonthYear,
            isRequired: controller.isAdjustDeclareForm,
            hintText: LocaleKeys.declareInfo_resolvedPeriodHint.tr,
            labelText: LocaleKeys.declareInfo_resolvedPeriod.tr,
            controller: controller.resolvedPeriodCtrl,
            textInputType: TextInputType.number,
          ),
        );
      },
    );
  }

  // Ngày đã giải quyết
  Widget _buildResolvedDate() {
    return FormFieldRegistrant<String>(
      registrarId: '9cb9ed8e-138d-4b5b-b536-e2756ac95979',
      validator: (value) {
        final trimmedValue = value?.trim();

        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_resolvedDateEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (/ddMM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }
        if (date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_resolvedDateLimit.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_resolvedDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.resolvedDateCtrl,
            hintText: PATTERN_1,
            isRequired: controller.isAdjustDeclareForm,
            onSelectDate: () async {
              KeyBoard.hide();
              final selectedDate = await DatePickerUtils.showCalendarPicker(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
                title: LocaleKeys.dialog_selectDayMonthYear.tr,
                dateFormat: PATTERN_1,
                dateTimeInit: convertStringToDateStrict(
                      controller.resolvedDateCtrl.text,
                      PATTERN_1,
                    ) ??
                    DateTime.now(),
              );
              if (selectedDate != null) {
                controller.resolvedDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
          ),
        );
      },
    );
  }

  // Lý do điều chỉnh
  Widget _buildInputAdjustReason() {
    return FormFieldRegistrant<String>(
      registrarId: "eba63cdb-a1b3-439f-bb28-ee0aa64b33d6",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_adjustReasonEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            isRequired: controller.isAdjustDeclareForm,
            hintText: LocaleKeys.declareInfo_adjustReasonHint.tr,
            labelText: LocaleKeys.declareInfo_adjustReason.tr,
            controller: controller.adjustReasonCtrl,
            maxLengthInputForm: 2000,
          ),
        );
      },
    );
  }
}
