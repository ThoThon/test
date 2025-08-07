part of 'declare_info_630b_page.dart';

extension BenefitAccountInfoGroupExt630b on DeclareInfo630bPage {
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
      registrarId: '',
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
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_receiveMethod.tr,
            hintText: LocaleKeys.declareInfo_receiveMethodHint.tr,
            items: AppData.instance.receiveForm.toList(),
            isRequired: true,
            display: (item) => item.text,
            selectedItem: controller.receiveForm.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.receiveForm.value = value;
            },
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
              final trimmedValue = value?.trim();

              if (trimmedValue == null || trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_bankNumberEmpty.tr;
              }
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputTextFormWithLabel(
                  fieldKey: fieldKey,
                  validator: validator,
                  autovalidateMode: controller.autoValidateMode.value,
                  hintText: LocaleKeys.declareInfo_bankNumberHint.tr,
                  inputFormatters:
                      InputFormatterEnum.textNormalWithoutDiacritics,
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
            registrarId: "",
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
          return FormFieldRegistrant(
            registrarId: '',
            validator: (value) {
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () {
                  return UtilWidget.buildCardBottomSheetSelect2<BankModel>(
                    fieldKey: fieldKey,
                    autovalidateMode: controller.autoValidateMode.value,
                    label: LocaleKeys.declareInfo_bank.tr,
                    hintText: LocaleKeys.declareInfo_bankHint.tr,
                    funcSelect: (didChange) async {
                      Get.bottomSheet(
                        BottomSheetSearch(
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
                    display: (bank) => bank.name,
                    selectedItem: controller.selectedBank.value,
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
      registrarId: "",
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
            hintText: LocaleKeys.declareInfo_resolvedPeriodHint.tr,
            labelText: LocaleKeys.declareInfo_resolvedPeriod.tr,
            controller: TextEditingController(),
            textInputType: TextInputType.number,
          ),
        );
      },
    );
  }

  // Ngày đã giải quyết
  Widget _buildResolvedDate() {
    return FormFieldRegistrant<String>(
      registrarId: '',
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

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }
        if (toDate.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
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
            controller: TextEditingController(),
            hintText: PATTERN_1,
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
              if (selectedDate != null) {}
            },
            isRequired: false,
          ),
        );
      },
    );
  }

  // Lý do điều chỉnh
  Widget _buildInputAdjustReason() {
    return FormFieldRegistrant<String>(
      registrarId: "",
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
            isRequired: false,
            hintText: LocaleKeys.declareInfo_adjustReasonHint.tr,
            labelText: LocaleKeys.declareInfo_adjustReason.tr,
            maxLengthInputForm: 2000,
            controller: controller.adjustReasonCtrl,
          ),
        );
      },
    );
  }
}
