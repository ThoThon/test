part of 'declare_info_630c_page.dart';

extension DeclareInfoGroupExt630c on DeclareInfo630cPage {
  Widget _buildDeclareInfoGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thông tin kê khai
        _buildTitleDeclareInfo(),
        sdsSBHeight12,

        // Hình thức kê khai
        _buildDeclareMethodDropdown(),
        sdsSBHeight12,

        // Mã nhóm hưởng
        _buildBenefitGroupCodeDropdown(),
        sdsSBHeight12,

        // "Từ ngày" và "Đến ngày"
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildFromDate()),
            sdsSBWidth12,
            Expanded(child: _buildToDate()),
          ],
        ),
        sdsSBHeight12,

        // "Tổng số ngày" và "Từ ngày đơn vị"
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildCountDay()),
            sdsSBWidth12,
            Expanded(child: _buildFromDateUnit()),
          ],
        ),
        sdsSBHeight12,

        // Ngày trở lại làm việc
        _buildReturnToWorkDate(),

        // "Ngày giám định" và "Tỷ lệ suy giảm"
        if (!controller.isAdjustDeclareForm)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildDateToAppraisal()),
              sdsSBWidth12,
              Expanded(child: _buildRateOfDecline()),
            ],
          ),

        // Số serial
        _buildInputSerialNumber(),

        // Đợt bổ sung
        _buildInputSupplementalPeriod(),

        // Mã hồ sơ
        _buildFileCodeText(),

        // Ghi chú
        _buildnoteText(),
      ],
    );
  }

  // Thông tin kê khai
  Widget _buildTitleDeclareInfo() {
    return SDSBuildText(
      LocaleKeys.declareInfo_declareInfo.tr,
      style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
    );
  }

  // Hình thức kê khai
  Widget _buildDeclareMethodDropdown() {
    return FormFieldRegistrant<DeclareForm630>(
      registrarId: '96d3d63a-b8a7-4413-91f6-fbabfacffeb0',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declareMethodCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<DeclareForm630>(
            fieldKey: formFieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_declareMethod.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectDeclareMethod.tr,
            items: AppData.instance.declareForm.toList(),
            display: (item) => item.text,
            selectedItem: controller.declareForm.value,
            onChanged: controller.onChangeDeclareMethod,
          ),
        );
      },
    );
  }

  // Mã nhóm hưởng
  Widget _buildBenefitGroupCodeDropdown() {
    return FormFieldRegistrant<BenefitGroup630>(
      registrarId: '288f21dd-7191-4dd5-8d7d-bb0ff607d2aa',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<BenefitGroup630>(
            validator: validator,
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_benefitGroupCode.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectBenefitGroupCode.tr,
            items: AppData.instance.benefitGroup630c.toList(),
            display: (item) => '${item.value} - ${item.text}',
            selectedItem: controller.benefitGroup.value,
            onChanged: (value) {
              controller.benefitGroup.value = value;
            },
          ),
        );
      },
    );
  }

  // Từ ngày
  Widget _buildFromDate() {
    return FormFieldRegistrant<String>(
      registrarId: '54af24f8-e53f-4a4c-968d-712476ac3f79',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if ((trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_fromDayEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_fromDayInvalid.tr;
        }

        final fromDate = convertStringToDateStrict(trimmedValue, PATTERN_1);

        if (fromDate == null) {
          return LocaleKeys.declareInfo_fromDayInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (fromDate.year <= 1900 || fromDate.year >= 2100) {
          return LocaleKeys.declareInfo_fromDayInvalid.tr;
        }
        final toDate = convertStringToDateStrict(
          controller.toDateCtrl.text,
          PATTERN_1,
        );

        if (toDate != null && fromDate.isAfter(toDate)) {
          return LocaleKeys.declareInfo_fromDayAfterToDay.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_fromDay.tr,
          controller: controller.fromDateCtrl,
          hintText: PATTERN_1,
          isRequired: true,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateStrict(
                    controller.fromDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.fromDateCtrl.text =
                  convertDateToStringSafe(selectedDate, PATTERN_1) ?? '';
            }
          },
        );
      },
    );
  }

  // Đến ngày
  Widget _buildToDate() {
    return FormFieldRegistrant<String>(
      registrarId: '37302f60-4b26-4718-b001-17583856bddc',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if ((trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_toDayEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_toDayInvalid.tr;
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_toDayInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_toDayInvalid.tr;
        }

        final fromDate = convertStringToDateStrict(
          controller.fromDateCtrl.text,
          PATTERN_1,
        );

        if (fromDate != null && toDate.isBefore(fromDate)) {
          return LocaleKeys.declareInfo_toDayBeforeFromDay.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_toDay.tr,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          controller: controller.toDateCtrl,
          hintText: PATTERN_1,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateStrict(
                    controller.toDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.toDateCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  // Tổng số ngày
  Widget _buildCountDay() {
    return FormFieldRegistrant<String>(
      registrarId: 'f95dcd9a-f398-47c4-b982-fe4475af230a',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_countDayEmpty.tr;
        }

        // REF: BHW-3106
        final number = int.tryParse(trimmedValue) ?? 0;
        if (number == 0) {
          return LocaleKeys.declareInfo_countDayInvalid.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          isRequired: true,
          labelText: LocaleKeys.declareInfo_countDay.tr,
          controller: controller.countDayTextCtrl,
          maxLengthInputForm: 3,
          hintText: LocaleKeys.declareInfo_countDayHint.tr,
          inputFormatters: InputFormatterEnum.digitsOnly,
          textInputType: TextInputType.number,
        );
      },
    );
  }

  // Từ ngày đơn vị
  Widget _buildFromDateUnit() {
    return FormFieldRegistrant<String>(
      registrarId: 'a9335fff-2888-4a91-9031-f839d652115e',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_fromDateUnitEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
          return LocaleKeys.declareInfo_fromDateUnitInvalid.tr;
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_fromDateUnitInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_fromDateUnitInvalid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_fromDateUnit.tr,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          controller: controller.fromDateUnitTextCtrl,
          hintText: PATTERN_1,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateStrict(
                    controller.fromDateUnitTextCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.fromDateUnitTextCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  // Ngày trở lại làm việc
  Widget _buildReturnToWorkDate() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return FormFieldRegistrant<String>(
          registrarId: 'e5567996-cc79-402e-8ab0-45447e57c27c',
          validator: (value) {
            final trimmedValue = value?.trim() ?? '';

            // Nếu bắt buộc và không nhập thì báo lỗi
            if ((trimmedValue.isEmpty)) {
              return LocaleKeys.declareInfo_returnToWorkDateCannotEmpty.tr;
            }

            // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
            if (trimmedValue.length < 7) {
              return LocaleKeys.declareInfo_returnToWorkDateInvalid.tr;
            }

            final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
            if (toDate == null) {
              return LocaleKeys.declareInfo_returnToWorkDateInvalid.tr;
            }

            // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
            if (toDate.year <= 1900 || toDate.year >= 2100) {
              return LocaleKeys.declareInfo_returnToWorkDateInvalid.tr;
            }

            return null;
          },
          builder: (fieldKey, validator) {
            return CardInputSelectDateWithLabel(
              fieldKey: fieldKey,
              validator: validator,
              labelText: LocaleKeys.declareInfo_returnToWorkDate.tr,
              inputFormatters: InputFormatterEnum.dateFullBirthDay,
              controller: controller.returnWorkDateCtrl,
              hintText: PATTERN_1,
              isRequired: true,
              onSelectDate: () async {
                KeyBoard.hide();
                final selectedDate = await DatePickerUtils.showCalendarPicker(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.padding32),
                  title: LocaleKeys.dialog_selectDayMonthYear.tr,
                  dateFormat: PATTERN_1,
                  dateTimeInit: convertStringToDateStrict(
                        controller.returnWorkDateCtrl.text,
                        PATTERN_1,
                      ) ??
                      DateTime.now(),
                );
                if (selectedDate != null) {
                  controller.returnWorkDateCtrl.text =
                      convertDateToString(selectedDate, PATTERN_1);
                }
              },
            );
          },
        ).paddingOnly(bottom: AppDimens.paddingSmall);
      },
    );
  }

  // Ngày giám định
  Widget _buildDateToAppraisal() {
    return FormFieldRegistrant<String>(
      registrarId: '4f4466d0-2477-4edc-9ff0-b592dbe46f94',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
          return null;
        }

        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
          return LocaleKeys.declareInfo_appraisalDateInvalid.tr;
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_appraisalDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_appraisalDateInvalid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_appraisalDate.tr,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          controller: controller.appraisalDateCtrl,
          hintText: PATTERN_1,
          isRequired: false,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateStrict(
                    controller.appraisalDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.appraisalDateCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  // Tỷ lệ suy giảm
  Widget _buildRateOfDecline() {
    return FormFieldRegistrant<String>(
      registrarId: '75dba361-fd10-4f43-bbe7-3d13e3a6af79',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        // Nếu trường này là bắt buộc khi isRateToDecline = true
        if (controller.isRateToDecline && trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_rateToDeclineCannotEmpty.tr;
        }

        if (trimmedValue.isNotEmpty) {
          final number = int.parse(trimmedValue);
          if (number < 0 || number > 100) {
            return LocaleKeys.declareInfo_rateToDeclineMax.tr;
          }
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: formFieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            hintText: LocaleKeys.declareInfo_rateToDeclineInput.tr,
            labelText: LocaleKeys.declareInfo_rateToDecline.tr,
            controller: controller.rateToDeclineCtrl,
            inputFormatters: InputFormatterEnum.phoneNumber,
            textInputType: TextInputType.number,
            maxLengthInputForm: 3,
            isRequired: controller.isRateToDecline,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Số serial
  Widget _buildInputSerialNumber() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return CardInputTextFormWithLabel(
          hintText: LocaleKeys.declareInfo_serialNumberHint.tr,
          labelText: LocaleKeys.declareInfo_serialNumber.tr,
          controller: controller.serialNumberCtrl,
          maxLengthInputForm: 30,
        ).paddingOnly(bottom: AppDimens.paddingSmall);
      },
    );
  }

  // Đợt bổ sung
  Widget _buildInputSupplementalPeriod() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return FormFieldRegistrant<String>(
          registrarId: "8c6ff477-1365-4954-8dd1-194c50f98df7",
          validator: (value) {
            final trimmedValue = value?.trim() ?? '';
            // Địng dạng "xx mm/yyyy"
            if (trimmedValue.isEmpty) {
              return null;
            }
            if (trimmedValue.length < 10) {
              return LocaleKeys.declareInfo_supplementalPeriodInvalid.tr;
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
            return CardInputTextFormWithLabel(
              fieldKey: fieldKey,
              validator: validator,
              hintText: LocaleKeys.declareInfo_supplementalPeriodHint.tr,
              labelText: LocaleKeys.declareInfo_supplementalPeriod.tr,
              controller: controller.supplementalPeriodCtrl,
              inputFormatters: InputFormatterEnum.periodMonthYear,
              textInputType: TextInputType.number,
            ).paddingOnly(bottom: AppDimens.paddingSmall);
          },
        );
      },
    );
  }

  // Mã hồ sơ
  Widget _buildFileCodeText() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_fileCodeHint.tr,
      labelText: LocaleKeys.declareInfo_fileCode.tr,
      controller: controller.fileCodeTextCtrl,
      maxLengthInputForm: 255,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
  // Ghi chú

  Widget _buildnoteText() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_noteHint.tr,
      labelText: LocaleKeys.declareInfo_note.tr,
      controller: controller.noteTextCtrl,
      maxLengthInputForm: 1000,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
}
