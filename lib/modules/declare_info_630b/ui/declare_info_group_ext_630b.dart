part of 'declare_info_630b_page.dart';

extension DeclareInfoGruopExt630b on DeclareInfo630bPage {
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

        // Mã nhóm hưởng cấp 2
        _buildBenefitGroupCodeLv2Dropdown(),

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

        // Ẩn khi "Hình thức kê khai" là "Điều chỉnh"
        Obx(
          () {
            if (controller.isAdjustDeclareForm) {
              return const SizedBox.shrink();
            }
            return Column(
              children: [
                // Số serial
                _buildInputSerialNumber(),

                // Điều kiện khám thai
                _buildIsPregnancyConditionDropdown(),
                sdsSBHeight12,

                // Tuổi thai
                _buildInputPregnancyWeek(),

                // Biện pháp tránh thai
                _buildContraceptionMethodDropdown(),
                sdsSBHeight12,

                // Điều kiện sinh con
                _buildIsChildbirthConditionDropdown(),
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

                // Mã số BHXH của con
                _buildBhxhCodeChild(),

                // Mã thẻ BHYT của con
                _buildBhytCardCodeChild(),

                // "Số con chết" và "Ngày con chết"
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildNumberChildDeath()),
                    sdsSBWidth12,
                    Expanded(child: _buildChildDeathDate()),
                  ],
                ),

                // "Ngày nhận con" và "Ngày đi làm thực tế"
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildAdoptionDate()),
                    sdsSBWidth12,
                    Expanded(child: _buildReturnWorkDate()),
                  ],
                ),

                // Mã số BHXH của mẹ
                _buildBhxhCodeMother(),

                // Mã thẻ BHYT của mẹ
                _buildBhytCardMother(),

                // Số CMND của mẹ
                _buildCccdMother(),
                // Phẫu thuật hoặc thai dưới 32 tuần
                _buildSurgeryOrUnder32WeekDropdown(),
                sdsSBHeight12,
                // "Ngày mẹ chết" và "Ngày kết luận"
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildMotherDeathDate()),
                    sdsSBWidth12,
                    Expanded(child: _buildConclusionDate()),
                  ],
                ),

                // Phí giám định y khoa
                _buildMedicalFee(),

                // Số BHXH của người nuôi dưỡng(TH mẹ chết)
                _buildGuardianBhxh(),

                // Nghỉ dưỡng thai
                _buildMaternityRestDropdown(),
                sdsSBHeight12,

                // Nghỉ chăm con
                _buildChildCareDropdown(),
                sdsSBHeight12,

                // Mang thai hộ
                _buildSurrogacyDropdown(),
                sdsSBHeight12,

                // Đợt bổ sung
                _buildInputSupplementalPeriod(),
              ],
            );
          },
        ),
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
    return FormFieldRegistrant<DeclareForm630Model>(
      registrarId: 'c030669e-725e-4598-b1e8-14083c9b32de',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declareMethodCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<DeclareForm630Model>(
            fieldKey: formFieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_declareMethod.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectDeclareMethod.tr,
            items: AppData.instance.declareForm.toList(),
            display: (item) => item.text,
            selectedItem: controller.declareForm.value,
            onChanged: (value) {
              if (value == null) return;
              controller.declareForm.value = value;
            },
          ),
        );
      },
    );
  }

  // Mã nhóm hưởng
  Widget _buildBenefitGroupCodeDropdown() {
    return FormFieldRegistrant<BenefitGroup630bModel>(
      registrarId: '65d1041d-d071-42f5-9a69-59b3382f6764',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<BenefitGroup630bModel>(
            validator: validator,
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_benefitGroupCode.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectBenefitGroupCode.tr,
            items: AppData.instance.benefitGroup630b.toList(),
            display: (item) => '${item.value} - ${item.text}',
            selectedItem: controller.benefitGroup.value,
            onChanged: controller.onChangeBenefitGroup,
          ),
        );
      },
    );
  }

  // Mã nhóm hưởng cấp 2
  Widget _buildBenefitGroupCodeLv2Dropdown() {
    return Obx(
      () {
        final listBenefitLv2 = controller.benefitGroup.value?.benefitGroupLv2;

        if (listBenefitLv2 == null || listBenefitLv2.isEmpty) {
          return UtilWidget.shrink;
        }
        return FormFieldRegistrant<BenefitGroupLv2Model>(
          registrarId: '862496a1-7059-4921-a936-21623836ba38',
          validator: (value) {
            if (controller.benefitGroupLv2.value == null) {
              return LocaleKeys.declareInfo_benefitGroupCodeLv2CannotEmpty.tr;
            }
            return null;
          },
          builder: (formFieldKey, validator) {
            return Obx(
              () => CardDropdownWithLabel<BenefitGroupLv2Model>(
                autovalidateMode: controller.autoValidateMode.value,
                validator: validator,
                fieldKey: formFieldKey,
                labelText: LocaleKeys.declareInfo_benefitGroupCodeLv2.tr,
                isRequired: true,
                hintText: LocaleKeys.declareInfo_selectBenefitGroupCodeLv2.tr,
                items: listBenefitLv2.toList(),
                display: (item) =>
                    '${item.maNhomHuongC2} - ${item.tenNhomHuongC2}',
                selectedItem: controller.benefitGroupLv2.value,
                onChanged: (value) {
                  if (value == null) return;
                  controller.benefitGroupLv2.value = value;
                },
              ),
            ).paddingOnly(bottom: AppDimens.paddingSmall);
          },
        );
      },
    );
  }

  // Từ ngày
  Widget _buildFromDate() {
    return FormFieldRegistrant<String>(
      registrarId: '7192b349-22fc-4960-ba38-22ff8e40b658',
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
      registrarId: '3af5f97e-2b3c-4146-a614-cfb63bb525cb',
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

  // Tổng số ngày
  Widget _buildCountDay() {
    return FormFieldRegistrant<String>(
      registrarId: "e19fc7c1-084a-4acc-964f-e3aa8198a180",
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
      registrarId: '15e22d22-3e81-4806-9007-74a50effef03',
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
    return Obx(
      () {
        final selectedText = controller.weeklyDayOffs.isEmpty
            ? LocaleKeys.declareInfo_pickDayOff.tr
            : controller.weeklyDayOffString;
        return UtilWidget.buildWeeklyDayOffDropdown<WeeklyDayOffEnum>(
          initialValue: controller.weeklyDayOffs,
          items: WeeklyDayOffEnum.values
              .map(
                (item) => MultiSelectItem<WeeklyDayOffEnum>(
                  item,
                  item.title,
                ),
              )
              .toList(),
          onConfirm: (values) {
            controller.weeklyDayOffs.value = values;
            KeyBoard.hide();
          },
          title: selectedText,
          color: controller.weeklyDayOffs.isEmpty
              ? AppColors.dsGray3
              : AppColors.colorBlack,
        );
      },
    );
  }

  // Số serial
  Widget _buildInputSerialNumber() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_serialNumberHint.tr,
      labelText: LocaleKeys.declareInfo_serialNumber.tr,
      controller: controller.serialNumberCtrl,
      maxLengthInputForm: 30,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Điều kiện khám thai
  Widget _buildIsPregnancyConditionDropdown() {
    return FormFieldRegistrant<PregnancyCheckConditionModel>(
      registrarId: '0fe0020c-fbb7-40a0-9222-a71f8fde457c',
      validator: (value) {
        if (value == null && controller.isRequiredPregnancyCondition) {
          return LocaleKeys.declareInfo_pregnancyConditionCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<PregnancyCheckConditionModel>(
            fieldKey: formFieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            isRequired: controller.isRequiredPregnancyCondition,
            labelText: LocaleKeys.declareInfo_pregnancyCondition.tr,
            hintText: LocaleKeys.declareInfo_pregnancyConditionSelected.tr,
            items: AppData.instance.pregnancyCondition.toList(),
            display: (item) => '${item.value} - ${item.text}',
            selectedItem: controller.pregnancyCondition.value,
            onChanged: (value) {
              if (value == null) return;
              controller.pregnancyCondition.value = value;
            },
          ),
        );
      },
    );
  }

  // Tuổi thai
  Widget _buildInputPregnancyWeek() {
    return FormFieldRegistrant<String>(
      registrarId: 'd8a874cb-7cbd-43ac-b8d3-2bbabf481a23',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        final isEmpty = trimmedValue.isEmpty;
        if (isEmpty && controller.isRequiredPregnancyWeek) {
          return LocaleKeys.declareInfo_pregnancyWeekCannotEmpty.tr;
        }
        if (int.parse(trimmedValue) > 45) {
          return LocaleKeys.declareInfo_pregnancyWeekLimit.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: formFieldKey,
            validator: validator,
            isRequired: controller.isRequiredPregnancyWeek,
            hintText: LocaleKeys.declareInfo_pregnancyWeekHint.tr,
            labelText: LocaleKeys.declareInfo_pregnancyWeek.tr,
            controller: controller.pregnancyWeekCtrl,
            maxLengthInputForm: 2,
            textInputType: TextInputType.number,
            inputFormatters: InputFormatterEnum.digitsOnly,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Biện pháp tránh thai
  Widget _buildContraceptionMethodDropdown() {
    return Obx(
      () => CardDropdownWithLabel<ContraceptionModel>(
        labelText: LocaleKeys.declareInfo_contraception.tr,
        hintText: LocaleKeys.declareInfo_contraceptionHint.tr,
        items: AppData.instance.contraception.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.contraception.value,
        onChanged: (value) {
          if (value == null) return;
          controller.contraception.value = value;
        },
      ),
    );
  }

  // Điềun kiện sinh con
  Widget _buildIsChildbirthConditionDropdown() {
    return Obx(
      () => CardDropdownWithLabel<ChildBirthConditionModel>(
        labelText: LocaleKeys.declareInfo_childBirth.tr,
        hintText: LocaleKeys.declareInfo_childbirthHint.tr,
        items: AppData.instance.childBirthCondition.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.childbirthCondition.value,
        onChanged: (value) {
          if (value == null) return;
          controller.childbirthCondition.value = value;
        },
      ),
    );
  }

  // Ngày sinh con
  Widget _buildBirthDayChild() {
    return FormFieldRegistrant<String>(
      registrarId: '6bedb77d-836e-4409-9da9-062e3ae2aab7',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        final isEmpty = trimmedValue.isEmpty;

        if (isEmpty && controller.isRequiredBirthAndConutChild) {
          return LocaleKeys.declareInfo_birthDayChildEmpty.tr;
        }
        if (isEmpty) return null;
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
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_birthDayChild.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.birthDayChildCtrl,
            hintText: PATTERN_1,
            isRequired: controller.isRequiredBirthAndConutChild,
            validator: validator,
            onSelectDate: () async {
              KeyBoard.hide();
              final selectedDate = await DatePickerUtils.showCalendarPicker(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
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

  // Số con
  Widget _buildNumberChild() {
    return FormFieldRegistrant<String>(
      registrarId: '2af4c72a-2e4c-4286-bbb5-cc908d811bba',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        final isEmpty = trimmedValue.isEmpty;
        if (isEmpty && controller.isRequiredBirthAndConutChild) {
          return LocaleKeys.declareInfo_numberChildEmpty.tr;
        }
        if (trimmedValue == '0') {
          return LocaleKeys.declareInfo_numberChildInvalid.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            hintText: LocaleKeys.declareInfo_numberChildHint.tr,
            labelText: LocaleKeys.declareInfo_numberChild.tr,
            controller: controller.numberChildCtrl,
            inputFormatters: InputFormatterEnum.phoneNumber,
            textInputType: TextInputType.number,
            isRequired: controller.isRequiredBirthAndConutChild,
            maxLengthInputForm: 1,
            validator: validator,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Mã số BHXH của con
  Widget _buildBhxhCodeChild() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_bhxhCodeChildHint.tr,
      labelText: LocaleKeys.declareInfo_bhxhCodeChild.tr,
      controller: controller.bhxhCodeChildCtrl,
      maxLengthInputForm: 10,
      inputFormatters: InputFormatterEnum.digitsOnly,
      textInputType: TextInputType.number,
      validator: (value) {
        final trimmedValue = value?.trim();
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_bhxhCodeInValid.tr;
        }
        return null;
      },
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Mã thẻ BHYT của con
  Widget _buildBhytCardCodeChild() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_bhytCardCodeChildHint.tr,
      labelText: LocaleKeys.declareInfo_bhytCardCodeChild.tr,
      controller: controller.bhytCardCodeChildCtrl,
      inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
      maxLengthInputForm: 50,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số con chết
  Widget _buildNumberChildDeath() {
    return FormFieldRegistrant<String>(
      registrarId: 'b2b84e28-70a9-43a9-bf7d-2dbf1adce5b2',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        final isEmpty = trimmedValue.isEmpty;
        if (isEmpty && controller.isRequiredChildDeathDate) {
          return LocaleKeys.declareInfo_countChildDeathCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: formFieldKey,
            validator: validator,
            autovalidateMode: controller.autoValidateMode.value,
            hintText: LocaleKeys.declareInfo_countChildDeathInput.tr,
            labelText: LocaleKeys.declareInfo_countChildDeath.tr,
            controller: controller.numberChildDeathCtrl,
            textInputType: TextInputType.number,
            inputFormatters: InputFormatterEnum.phoneNumber,
            isRequired: controller.isRequiredChildDeathDate,
            maxLengthInputForm: 1,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Ngày con chết
  Widget _buildChildDeathDate() {
    return FormFieldRegistrant<String>(
      registrarId: '0ce7c7b9-142d-4669-8ddc-f2f033e2bd12',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        final isEmpty = trimmedValue.isEmpty;

        if (isEmpty && controller.isRequiredChildDeathDate) {
          return LocaleKeys.declareInfo_childDeathDateCannotEmpty.tr;
        }
        if (isEmpty) return null;
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_childDeathDateInvalid.tr;
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_childDeathDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_childDeathDateInvalid.tr;
        }

        if (toDate.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_childDeathDateInvalid.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: LocaleKeys.declareInfo_childDeathDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.childDeathDateCtrl,
            hintText: PATTERN_1,
            isRequired: controller.isRequiredChildDeathDate,
            onSelectDate: () async {
              KeyBoard.hide();
              final selectedDate = await DatePickerUtils.showCalendarPicker(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
                title: LocaleKeys.dialog_selectDayMonthYear.tr,
                dateFormat: PATTERN_1,
                dateTimeInit: convertStringToDateStrict(
                      controller.childDeathDateCtrl.text,
                      PATTERN_1,
                    ) ??
                    DateTime.now(),
              );
              if (selectedDate != null) {
                controller.childDeathDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Ngày nhận con
  Widget _buildAdoptionDate() {
    return FormFieldRegistrant<String>(
      registrarId: '4ceeb6a5-b997-4379-9c13-6e5418cd86c9',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        final isEmpty = trimmedValue.isEmpty;

        if (isEmpty && controller.isRequiredAdoptionDate) {
          return LocaleKeys.declareInfo_adoptionDateCannotEmpty.tr;
        }
        if (isEmpty) return null;

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_adoptionDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return LocaleKeys.declareInfo_adoptionDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.declareInfo_adoptionDateInvalid.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: LocaleKeys.declareInfo_adoptionDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.adoptionDateCtrl,
            hintText: PATTERN_1,
            isRequired: controller.isRequiredAdoptionDate,
            onSelectDate: () async {
              KeyBoard.hide();
              final selectedDate = await DatePickerUtils.showCalendarPicker(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
                title: LocaleKeys.dialog_selectDayMonthYear.tr,
                dateFormat: PATTERN_1,
                dateTimeInit: convertStringToDateStrict(
                      controller.adoptionDateCtrl.text,
                      PATTERN_1,
                    ) ??
                    DateTime.now(),
              );
              if (selectedDate != null) {
                controller.adoptionDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Ngày đi làm thực tế
  Widget _buildReturnWorkDate() {
    return FormFieldRegistrant<String>(
      registrarId: '7af22d9d-68e7-4bb5-bdb0-0156e43ac865',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return null;
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_workDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return LocaleKeys.declareInfo_workDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.declareInfo_workDateInvalid.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_workDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.returnWorkDateCtrl,
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
            validator: validator,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Mã số BHXH của mẹ
  Widget _buildBhxhCodeMother() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_bhxhCodeMotherHint.tr,
      labelText: LocaleKeys.declareInfo_bhxhCodeMother.tr,
      controller: controller.bhxhCodeMotherCtrl,
      maxLengthInputForm: 10,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.digitsOnly,
      validator: (value) {
        final trimmedValue = value?.trim();
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_bhxhCodeInValid.tr;
        }
        return null;
      },
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Mã thẻ BHYT của mẹ
  Widget _buildBhytCardMother() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_bhytCardMotherHint.tr,
      labelText: LocaleKeys.declareInfo_bhytCardMother.tr,
      controller: controller.bhytCardMotherCtrl,
      maxLengthInputForm: 50,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số CMND của mẹ
  Widget _buildCccdMother() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_cccdMotherHint.tr,
      labelText: LocaleKeys.declareInfo_cccdMother.tr,
      controller: controller.cccdMotherCtrl,
      maxLengthInputForm: 20,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Phẫu thuật hoặc thai dưới 32 tuần
  Widget _buildSurgeryOrUnder32WeekDropdown() {
    return Obx(
      () => CardDropdownWithLabel<SurgeryPregnancy32wModel>(
        labelText: LocaleKeys.declareInfo_surgeryOrUnder32Week.tr,
        hintText: LocaleKeys.declareInfo_surgeryOrUnder32WeekHint.tr,
        items: AppData.instance.surgeryPregnancy32w.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.surgeryOrUnder32Week.value,
        onChanged: (value) {
          if (value == null) return;
          controller.surgeryOrUnder32Week.value = value;
        },
      ),
    );
  }

  // Ngày mẹ chết
  Widget _buildMotherDeathDate() {
    return FormFieldRegistrant<String>(
      registrarId: '1ab4af68-af0c-4167-a670-6182a2cdecb7',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return null;
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_motherDeathDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return LocaleKeys.declareInfo_motherDeathDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_motherDeathDateInvalid.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_motherDeathDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.motherDeathDateCtrl,
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
                      controller.motherDeathDateCtrl.text,
                      PATTERN_1,
                    ) ??
                    DateTime.now(),
              );
              if (selectedDate != null) {
                controller.motherDeathDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
            validator: validator,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Ngày kết luận
  Widget _buildConclusionDate() {
    return FormFieldRegistrant<String>(
      registrarId: '4e7c8f89-41ef-4a09-86c5-e8228c7fa943',
      validator: (value) {
        final trimmedValue = value?.trim();

        bool isEmpty = trimmedValue == null || trimmedValue.isEmpty;
        if (controller.isRequiredConclusionDate && isEmpty) {
          return LocaleKeys.declareInfo_conclusionDateCannotEmpty.tr;
        }
        if (isEmpty) return null;
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_conclusionDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return LocaleKeys.declareInfo_conclusionDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_conclusionDateInvalid.tr;
        }

        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: formFieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            labelText: LocaleKeys.declareInfo_conclusionDate.tr,
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.conclusionDateCtrl,
            hintText: PATTERN_1,
            isRequired: controller.isRequiredConclusionDate,
            onSelectDate: () async {
              KeyBoard.hide();
              final selectedDate = await DatePickerUtils.showCalendarPicker(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
                title: LocaleKeys.dialog_selectDayMonthYear.tr,
                dateFormat: PATTERN_1,
                dateTimeInit: convertStringToDateStrict(
                      controller.conclusionDateCtrl.text,
                      PATTERN_1,
                    ) ??
                    DateTime.now(),
              );
              if (selectedDate != null) {
                controller.conclusionDateCtrl.text =
                    convertDateToString(selectedDate, PATTERN_1);
              }
            },
            validator: validator,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Phí giám định y khoa
  Widget _buildMedicalFee() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_medicalFeeInput.tr,
      labelText: LocaleKeys.declareInfo_medicalFee.tr,
      controller: controller.medicalFeeCtrl,
      inputFormatters: InputFormatterEnum.phoneNumber,
      textInputType: TextInputType.number,
      maxLengthInputForm: 15,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số BHXH của người nuôi dưỡng(TH mẹ chết)
  Widget _buildGuardianBhxh() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_inputGuardianBhxhHint.tr,
      labelText: LocaleKeys.declareInfo_inputGuardianBhxh.tr,
      controller: controller.guardianBhxhCtrl,
      maxLengthInputForm: 30,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Nghỉ dưỡng thai
  Widget _buildMaternityRestDropdown() {
    return Obx(
      () => CardDropdownWithLabel<MaternityLeaveModel>(
        labelText: LocaleKeys.declareInfo_maternityLeave.tr,
        hintText: LocaleKeys.declareInfo_maternityLeaveHint.tr,
        items: AppData.instance.maternityLeave.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.maternityRest.value,
        onChanged: (value) {
          if (value == null) return;
          controller.maternityRest.value = value;
        },
      ),
    );
  }

  // Nghỉ chăm con
  Widget _buildChildCareDropdown() {
    return Obx(
      () => CardDropdownWithLabel<ParentalLeaveModel>(
        labelText: LocaleKeys.declareInfo_parentalLeave.tr,
        hintText: LocaleKeys.declareInfo_parentalLeaveHint.tr,
        items: AppData.instance.parentalLeave.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.parentalLeave.value,
        onChanged: (value) {
          if (value == null) return;
          controller.parentalLeave.value = value;
        },
      ),
    );
  }

  // Mang thai hộ
  Widget _buildSurrogacyDropdown() {
    return Obx(
      () => CardDropdownWithLabel<SurrogacyModel>(
        labelText: LocaleKeys.declareInfo_surrogacy.tr,
        hintText: LocaleKeys.declareInfo_surrogacyHint.tr,
        items: AppData.instance.surrogacy.toList(),
        display: (item) => '${item.value} - ${item.text}',
        selectedItem: controller.surrogacy.value,
        onChanged: (value) {
          if (value == null) return;
          controller.surrogacy.value = value;
        },
      ),
    );
  }

  // Đợt bổ sung
  Widget _buildInputSupplementalPeriod() {
    return FormFieldRegistrant<String>(
      registrarId: "18d6ea86-bfbb-4b85-a1fe-fcf82222aed4",
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
