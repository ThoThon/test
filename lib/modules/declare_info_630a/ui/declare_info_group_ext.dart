part of 'declare_info_630a_page.dart';

extension DeclareInfoGroupWidgetExt on DeclareInfo630aPage {
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

        // "Ngày sinh con" và "Số con"
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildBirthDayChild()),
            sdsSBWidth12,
            Expanded(child: _buildNumberChild()),
          ],
        ),

        // Mã thẻ BHYT của con
        _buildBHYTCardCodeChild(),

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

        // Nghỉ hàng tuần
        _buildWeeklyDayOffDropdown(),
        sdsSBHeight12,

        // Tuyến bệnh viện
        _buildHospitalLine(),

        // Chọn/Nhập mã bệnh
        _buildSelectDiseaseCode(),

        // Tên bệnh
        _buildInputDisseaseName(),

        // Số serial
        _buildInputSerialNumber(),

        // Điều kiện làm việc
        _buildWorkingConditionDropDown(),

        // Nghỉ dưỡng thai
        _buildMaternityRestCheckbox(),

        // Đợt bổ sung
        _buildInputSupplementalPeriod(),

        // Mã hồ sơ
        _buildInputFileCode(),

        // Ghi chú
        _buildInputNote(),
        sdsSBHeight12,
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
    return FormFieldRegistrant<DeclareForm630aModel>(
      registrarId: '1b6c5f61-7b44-418c-94c0-fde7a6e4b892',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declareMethodCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<DeclareForm630aModel>(
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_declareMethod.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectDeclareMethod.tr,
            items: AppData.instance.declareForm.toList(),
            display: (item) => item.text,
            selectedItem: controller.declareForm.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.declareForm.value = value;
            },
            validator: validator,
          ),
        );
      },
    );
  }

  // Mã nhóm hưởng
  Widget _buildBenefitGroupCodeDropdown() {
    return FormFieldRegistrant<BenefitGroup630aModel>(
      registrarId: 'aca45ce6-4a50-4f46-8ca8-3b7e895bd78f',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<BenefitGroup630aModel>(
            validator: validator,
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_benefitGroupCode.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectBenefitGroupCode.tr,
            items: AppData.instance.benefitGroup.toList(),
            display: (item) => '${item.value} - ${item.text}',
            selectedItem: controller.benefitGroup.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
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
      registrarId: 'b6ffeeb4-dc24-419a-b114-083783c6aeef',
      validator: (value) {
        final trimmedValue = value?.trim();
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
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
      registrarId: '54b8971a-9d33-4ab5-8b9c-f54a9f67b4bc',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
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

  // Ngày sinh con
  Widget _buildBirthDayChild() {
    return Obx(
      () {
        if (controller.isSickChild) {
          return FormFieldRegistrant<String>(
            registrarId: 'e3d8c0c2-5265-49d7-b6df-99b8136ab507',
            validator: (value) {
              final trimmedValue = value?.trim();

              if ((trimmedValue == null || trimmedValue.isEmpty)) {
                return LocaleKeys.declareInfo_birthDayChildEmpty.tr;
              }
              // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
              if (trimmedValue.length < 10) {
                return LocaleKeys.declareInfo_birthDayChildInvalid.tr;
              }

              final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
              if (toDate == null) {
                return LocaleKeys.declareInfo_birthDayChildInvalid.tr;
              }

              // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
              if (toDate.year <= 1900 || toDate.year >= 2100) {
                return LocaleKeys.declareInfo_birthDayChildInvalid.tr;
              }

              if (toDate.isAfter(DateTime.now())) {
                return LocaleKeys.declareInfo_dobCannotFuture.tr;
              }
              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputSelectDateWithLabel(
                  fieldKey: fieldKey,
                  autovalidateMode: controller.autoValidateMode.value,
                  validator: validator,
                  labelText: LocaleKeys.declareInfo_birthDayChild.tr,
                  inputFormatters: InputFormatterEnum.dateFullBirthDay,
                  controller: controller.birthDayChildCtrl,
                  hintText: PATTERN_1,
                  isRequired: true,
                  onSelectDate: () async {
                    KeyBoard.hide();
                    final selectedDate =
                        await DatePickerUtils.showCalendarPicker(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.padding32),
                      title: LocaleKeys.dialog_selectDayMonthYear.tr,
                      dateFormat: PATTERN_1,
                      dateTimeInit: convertStringToDateStrict(
                            controller.birthDayChildCtrl.text,
                            PATTERN_1,
                          ) ??
                          DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.birthDayChildCtrl.text =
                          convertDateToString(selectedDate, PATTERN_1);
                    }
                  },
                ).paddingOnly(bottom: AppDimens.paddingSmall),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  // Số con
  Widget _buildNumberChild() {
    return Obx(
      () {
        if (controller.isSickChild) {
          return FormFieldRegistrant<String>(
            registrarId: "86adc9d3-12a1-4f85-855c-8f0e554d3bff",
            validator: (value) {
              final trimmedValue = value?.trim();

              if (trimmedValue == null || trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_numberChildEmpty.tr;
              }

              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputTextFormWithLabel(
                  fieldKey: fieldKey,
                  validator: validator,
                  autovalidateMode: controller.autoValidateMode.value,
                  hintText: LocaleKeys.declareInfo_numberChildHint.tr,
                  labelText: LocaleKeys.declareInfo_numberChild.tr,
                  controller: controller.numberChildCtrl,
                  inputFormatters: InputFormatterEnum.phoneNumber,
                  textInputType: TextInputType.number,
                  isRequired: true,
                  maxLengthInputForm: 1,
                ).paddingOnly(bottom: AppDimens.paddingSmall),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  // Mã thẻ BHYT của con
  Widget _buildBHYTCardCodeChild() {
    return Obx(
      () {
        if (controller.isSickChild) {
          return FormFieldRegistrant<String>(
            registrarId: "7b2c66b1-3e80-44ee-ab32-df5ee70d68ad",
            validator: (value) {
              final trimmedValue = value?.trim();

              if (trimmedValue == null || trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_bhytCardCodeEmpty.tr;
              }

              return null;
            },
            builder: (fieldKey, validator) {
              return Obx(
                () => CardInputTextFormWithLabel(
                  fieldKey: fieldKey,
                  validator: validator,
                  autovalidateMode: controller.autoValidateMode.value,
                  hintText: LocaleKeys.declareInfo_bhytCardCodeHint.tr,
                  labelText: LocaleKeys.declareInfo_bhytCardCode.tr,
                  controller: controller.bhytCardCodeChildCtrl,
                  isRequired: true,
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

  // Tổng số ngày
  Widget _buildCountDay() {
    return FormFieldRegistrant<String>(
      registrarId: "cbeeff96-8f3b-46da-a6b7-f84fa21225fe",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_countDayEmpty.tr;
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
      registrarId: '273609e9-3394-4236-8f83-28be234ea078',
      validator: (value) {
        final trimmedValue = value?.trim();

        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
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

  // Nghỉ hàng tuần
  Widget _buildWeeklyDayOffDropdown() {
    return Container(
      padding: const EdgeInsets.only(
        right: AppDimens.defaultPadding,
        left: AppDimens.defaultPadding,
        top: AppDimens.paddingVerySmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SDSBuildText(
                'Ngày nghỉ tuần',
                style: AppTextStyle.font14Re.copyWith(
                  color: AppColors.dsGray1,
                ),
              ),
            ],
          ),
          Obx(
            () {
              final selectedText = controller.weeklyDayOffs.isEmpty
                  ? 'Chọn ngày nghỉ'
                  : controller.weeklyDayOffString;

              return MultiSelectDialogField<WeeklyDayOffEnum>(
                items: WeeklyDayOffEnum.values
                    .map(
                      (item) => MultiSelectItem<WeeklyDayOffEnum>(
                        item,
                        item.title,
                      ),
                    )
                    .toList(),
                title: SDSBuildText(
                  "Chọn ngày nghỉ trong tuần",
                  style: AppTextStyle.font18Re,
                ),
                listType: MultiSelectListType.LIST,
                backgroundColor: AppColors.basicWhite,
                buttonIcon: SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG,
                  height: AppDimens.sizeIconMedium,
                  width: AppDimens.sizeIconMedium,
                ),
                buttonText: Expanded(
                  child: SDSBuildText(
                    maxLines: 3,
                    selectedText,
                    style: AppTextStyle.font14Re.copyWith(
                      color: controller.weeklyDayOffs.isEmpty
                          ? AppColors.dsGray3
                          : AppColors.colorBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.paddingVerySmall,
                ),
                decoration: const BoxDecoration(border: Border()),
                isDismissible: true,
                onConfirm: (values) {
                  controller.weeklyDayOffs.value = values;
                },
                cancelText: SDSBuildText(
                  LocaleKeys.dialog_cancel.tr,
                  style: AppTextStyle.font14Bo
                      .copyWith(color: AppColors.textColorGrey),
                ),
                confirmText: SDSBuildText(
                  LocaleKeys.dialog_select.tr,
                  style: AppTextStyle.font14Bo
                      .copyWith(color: AppColors.primaryColor),
                ),
                initialValue: controller.weeklyDayOffs,
                chipDisplay: MultiSelectChipDisplay.none(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Tuyến bệnh viện
  Widget _buildHospitalLine() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return Obx(
          () => UtilWidget.buildCardBottomSheetSelect2<HospitalLine630aModel>(
            label: LocaleKeys.declareInfo_hospitalLine.tr,
            hintText: LocaleKeys.declareInfo_hospitalLineSelect.tr,
            isRequired: false,
            funcSelect: (didChange) async {
              Get.bottomSheet(
                BottomSheetSearch<HospitalLine630aModel>(
                  title: LocaleKeys.declareInfo_hospitalLineSelect.tr,
                  maxLength: 20,
                  hintText: LocaleKeys.declareInfo_inputHospitalLine.tr,
                  listFilter: AppData.instance.hospitalLine.toList(),
                  selectedItem: controller.selectHospitalLine.value,
                  display: (value) => '${value.value} - ${value.text}',
                  onAccept: (value) {
                    if (value == null) return;
                    controller.selectHospitalLine.value = value;
                    didChange(value);
                  },
                ),
                isScrollControlled: true,
              );
            },
            selectedItem: controller.selectHospitalLine.value,
            display: (hospital) => '${hospital.value} - ${hospital.text}',
          ),
        );
      },
    );
  }

  // Chọn/Nhập mã bệnh
  Widget _buildSelectDiseaseCode() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return Obx(
          () => UtilWidget.buildCardBottomSheetSelect2<LongDiease630aModel>(
            label: LocaleKeys.declareInfo_selectDiseaseCode.tr,
            hintText: LocaleKeys.declareInfo_selectDiseaseCodeHint.tr,
            isRequired: false,
            funcSelect: (didChange) async {
              Get.bottomSheet(
                BottomSheetSearch<LongDiease630aModel>(
                  title: LocaleKeys.declareInfo_selectDiseaseCode.tr,
                  maxLength: 20,
                  hintText: LocaleKeys.declareInfo_inputDiseaseCode.tr,
                  listFilter: AppData.instance.longDiease.toList(),
                  selectedItem: controller.selectDiseaseCode.value,
                  display: (value) => '${value.code} - ${value.name}',
                  onAccept: (value) {
                    if (value == null) return;
                    controller.selectDiseaseCode.value = value;
                    didChange(value);
                  },
                ),
                isScrollControlled: true,
              );
            },
            selectedItem: controller.selectDiseaseCode.value,
            display: (disease) => '${disease.code} - ${disease.name}',
          ),
        );
      },
    );
  }

  // Tên bệnh
  Widget _buildInputDisseaseName() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return CardInputTextFormWithLabel(
          hintText: LocaleKeys.declareInfo_diseaseNameHint.tr,
          labelText: LocaleKeys.declareInfo_diseaseName.tr,
          controller: controller.diseaseNameTextCtrl,
          maxLengthInputForm: 1000,
        ).paddingOnly(bottom: AppDimens.paddingSmall);
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

  // Điều kiện làm việc
  Widget _buildWorkingConditionDropDown() {
    return Obx(
      () {
        if (controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return CardDropdownWithLabel<WorkCondition630aModel>(
          labelText: LocaleKeys.declareInfo_workingCondition.tr,
          hintText: LocaleKeys.declareInfo_workingConditionHint.tr,
          items: AppData.instance.workCondition.toList(),
          display: (item) => item.text,
          selectedItem: controller.workCondition.value,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            controller.workCondition.value = value;
          },
        ).paddingOnly(bottom: AppDimens.paddingSmall);
      },
    );
  }

  // Nghỉ dưỡng thai
  Widget _buildMaternityRestCheckbox() {
    return Obx(
      () {
        if (controller.isSickChild || controller.isAdjustDeclareForm) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            UtilWidget.buildCheckboxWithLabel(
              label: LocaleKeys.declareInfo_maternityRest.tr,
              value: controller.isMaternityRest.value,
              onChanged: (value) {
                controller.isMaternityRest.value = value;
              },
            ),
          ],
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
          registrarId: "90c966f8-6acb-49f2-96bf-0d800d6e0868",
          validator: (value) {
            final trimmedValue = value?.trim();
            // Địng dạng "xx mm/yyyy"
            if (trimmedValue == null || trimmedValue.isEmpty) {
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
  Widget _buildInputFileCode() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_fileCodeHint.tr,
      labelText: LocaleKeys.declareInfo_fileCode.tr,
      controller: controller.fileCodeTextCtrl,
      maxLengthInputForm: 255,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Ghi chú
  Widget _buildInputNote() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_noteHint.tr,
      labelText: LocaleKeys.declareInfo_note.tr,
      controller: controller.noteTextCtrl,
      maxLengthInputForm: 1000,
    );
  }
}
