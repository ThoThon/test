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
    return FormFieldRegistrant<Category>(
      registrarId: '7ab4d569-2ae6-4e79-ab4a-9cb7287595b2',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_receiveMethodEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<Category>(
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
            registrarId: "86e77e01-cad0-451d-b0b4-a63fdca1db89",
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
                  isRequired: controller.isATMpayment,
                  autovalidateMode: controller.autoValidateMode.value,
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
            registrarId: "d7e1b39e-ca34-4447-bc50-e1d5b1f784e3",
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
                  isRequired: controller.isATMpayment,
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
          return FormFieldRegistrant<Bank>(
            registrarId: '1838b9f6-8e6c-40ff-8aa1-1884312fb5b3',
            validator: (value) {
              if (controller.selectedBank.value == null) {
                return LocaleKeys.declareInfo_bankCannotEmpty.tr;
              }
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () {
                  return UtilWidget.buildCardBottomSheetSelect2<Bank>(
                    fieldKey: fieldKey,
                    validator: validator,
                    autovalidateMode: controller.autoValidateMode.value,
                    isRequired: controller.isATMpayment,
                    label: LocaleKeys.declareInfo_bank.tr,
                    hintText: LocaleKeys.declareInfo_bankHint.tr,
                    funcSelect: (didChange) async {
                      nav.bottomSheet(
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
      registrarId: "5a068727-dc58-4dc7-a096-00cef42126d6",
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
      registrarId: '3fe3e16f-70a2-4f68-969c-bc08f9e22be3',
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
        if (date.year <= 1900) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        if (date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_resolvedDateLimit.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_resolvedDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.resolvedDateCtrl,
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
              if (selectedDate != null) {
                controller.resolvedDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
            isRequired: controller.isAdjustDeclareForm,
            validator: validator,
          ),
        );
      },
    );
  }

  // Lý do điều chỉnh
  Widget _buildInputAdjustReason() {
    return FormFieldRegistrant<String>(
      registrarId: 'a99250f5-e7cc-4c8b-8b58-58ebb67ae81f',
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_adjustReasonEmpty.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            validator: validator,
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            isRequired: controller.isAdjustDeclareForm,
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
