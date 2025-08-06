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

        // Nghỉ hàng tuần
        _buildWeeklyDayOffDropdown(),
        sdsSBHeight12,

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
            Expanded(child: _buildAdoptionDatee()),
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

        // Mã hồ sơ
        _buildFileCodeText(),

        // Ghi chú
        _buildnoteText(),

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
    return FormFieldRegistrant(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declareMethodCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<DeclareForm630aModel>(
          fieldKey: formFieldKey,
          labelText: LocaleKeys.declareInfo_declareMethod.tr,
          isRequired: true,
          hintText: LocaleKeys.declareInfo_selectDeclareMethod.tr,
          items: AppData.instance.declareForm.toList(),
          display: (item) => item.text,
          // selectedItem: controller.declareForm.value,
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Mã nhóm hưởng
  Widget _buildBenefitGroupCodeDropdown() {
    return FormFieldRegistrant<BenefitGroup630aModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<BenefitGroup630aModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: LocaleKeys.declareInfo_benefitGroupCode.tr,
          isRequired: true,
          hintText: LocaleKeys.declareInfo_selectBenefitGroupCode.tr,
          items: AppData.instance.benefitGroup.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Mã nhóm hưởng cấp 2
  Widget _buildBenefitGroupCodeLv2Dropdown() {
    return FormFieldRegistrant<BenefitGroup630aModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<BenefitGroup630aModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Mã nhóm hưởng cấp 2',
          isRequired: true,
          hintText: 'Chọn mã nhóm hưởng cấp 2',
          items: AppData.instance.benefitGroup.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Từ ngày
  Widget _buildFromDate() {
    return FormFieldRegistrant<String>(
      registrarId: '',
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
      registrarId: '',
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
      registrarId: "",
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
      registrarId: '',
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
              final selectedText =
                  controller.weeklyDayOffs.isEmpty ? 'Chọn ngày nghỉ' : '';
              // : controller.weeklyDayOffString;

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
                isDismissible: false,
                onConfirm: (values) {
                  controller.weeklyDayOffs.value = values;
                  KeyBoard.hide();
                },
                confirmText: SDSBuildText(
                  LocaleKeys.dialog_select.tr,
                  style: AppTextStyle.font14Bo
                      .copyWith(color: AppColors.primaryColor),
                ),
                cancelText: GestureDetector(
                  onTap: () {
                    Get.back();
                    KeyBoard.hide();
                  },
                  child: SDSBuildText(
                    LocaleKeys.dialog_cancel.tr,
                    style: AppTextStyle.font14Bo
                        .copyWith(color: AppColors.textColorGrey),
                  ),
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
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<PregnancyCheckConditionModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Điều kiện khám thai',
          hintText: 'Chọn điều kiện khám thai',
          items: AppData.instance.pregnancyCondition.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Tuổi thai
  Widget _buildInputPregnancyWeek() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập số tuần tuổi thai',
      labelText: 'Tuổi thai',
      controller: controller.pregnancyWeekCtrl,
      maxLengthInputForm: 2,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Biện pháp tránh thai
  Widget _buildContraceptionMethodDropdown() {
    return FormFieldRegistrant<ContraceptionModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<ContraceptionModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Biện pháp tránh thai',
          hintText: 'Chọn biện pháp',
          items: AppData.instance.contraception.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Điềun kiện sinh con
  Widget _buildIsChildbirthConditionDropdown() {
    return FormFieldRegistrant<ChildBirthConditionModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<ChildBirthConditionModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Điều kiện sinh con',
          hintText: 'Chọn điều kiện sinh con',
          items: AppData.instance.childBirthCondition.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Ngày sinh con
  Widget _buildBirthDayChild() {
    return FormFieldRegistrant<String>(
      registrarId: '',
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
            isRequired: false,
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
      registrarId: "",
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
            isRequired: false,
            maxLengthInputForm: 1,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Mã số BHXH của con
  Widget _buildBhxhCodeChild() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập mã số BHXH của con',
      labelText: 'Mã số BHXH của con',
      controller: controller.bhxhCodeChildCtrl,
      maxLengthInputForm: 10,
      inputFormatters: InputFormatterEnum.phoneNumber,
      textInputType: TextInputType.number,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Mã thẻ BHYT của con
  Widget _buildBhytCardCodeChild() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập mã thẻ BHYT của con',
      labelText: 'Mã thẻ BHYT của con',
      controller: controller.bhytCardCodeChildCtrl,
      inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
      maxLengthInputForm: 15,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số con chết
  Widget _buildNumberChildDeath() {
    return CardInputTextFormWithLabel(
      autovalidateMode: controller.autoValidateMode.value,
      hintText: 'Nhập số con chết',
      labelText: 'Số con chết',
      controller: controller.numberChildDeathCtrl,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.phoneNumber,
      isRequired: false,
      maxLengthInputForm: 1,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Ngày con chết
  Widget _buildChildDeathDate() {
    return FormFieldRegistrant<String>(
      registrarId: '',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return '';
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return 'Ngày con chết không hợp lệ';
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return 'Ngày con chết không hợp lệ';
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return 'Ngày con chết không hợp lệ';
        }

        if (toDate.isAfter(DateTime.now())) {
          return 'Ngày con chết không được lớn hơn ngày hôm nay';
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: 'Ngày con chết',
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.childDeathDateCtrl,
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
  Widget _buildAdoptionDatee() {
    return FormFieldRegistrant<String>(
      registrarId: '',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return '';
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return 'Ngày nhận con không hợp lệ';
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return 'Ngày nhận con không hợp lệ';
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.year >= 2100) {
          return 'Ngày nhận con không hợp lệ';
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: 'Ngày nhận con',
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.adoptionDateCtrl,
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
      registrarId: '',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return '';
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return 'Ngày đi làm thực tế không hợp lệ';
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (date == null) {
          return 'Ngày đi làm thực tế không hợp lệ';
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (date.year <= 1900 || date.year >= 2100) {
          return 'Ngày đi làm thực tế không hợp lệ';
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: 'Ngày đi làm thực tế',
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
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Mã số BHXH của mẹ
  Widget _buildBhxhCodeMother() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập mã số BHXH của mẹ',
      labelText: 'Mã số BHXH của mẹ',
      controller: controller.bhxhCodeMotherCtrl,
      maxLengthInputForm: 10,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Mã thẻ BHYT của mẹ
  Widget _buildBhytCardMother() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập mã số BHXH của mẹ',
      labelText: 'Mã thẻ BHYT của mẹ',
      controller: controller.bhytCardMotherCtrl,
      maxLengthInputForm: 15,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số CMND của mẹ
  Widget _buildCccdMother() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập số CMND của mẹ',
      labelText: 'Số CMND của mẹ',
      controller: controller.cccdMotherCtrl,
      maxLengthInputForm: 20,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Phẫu thuật hoặc thai dưới 32 tuần
  Widget _buildSurgeryOrUnder32WeekDropdown() {
    return FormFieldRegistrant<SurgeryPregnancy32wModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<SurgeryPregnancy32wModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Phẫu thuật hoặc thai dưới 32 tuần',
          hintText: 'Chọn',
          items: AppData.instance.surgeryPregnancy32w.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Ngày mẹ chết
  Widget _buildMotherDeathDate() {
    return FormFieldRegistrant<String>(
      registrarId: '',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return '';
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return 'Ngày mẹ chết không hợp lệ';
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return '';
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return 'Ngày mẹ chết không hợp lệ';
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: 'Ngày mẹ chết',
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
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Ngày kết luận
  Widget _buildConclusionDate() {
    return FormFieldRegistrant<String>(
      registrarId: '',
      validator: (value) {
        final trimmedValue = value?.trim();

        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return '';
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return 'Ngày kết luận không hợp lệ';
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return '';
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return 'Ngày kết luận không hợp lệ';
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputSelectDateWithLabel(
            fieldKey: fieldKey,
            autovalidateMode: controller.autoValidateMode.value,
            validator: validator,
            labelText: 'Ngày kết luận',
            inputFormatters: InputFormatterEnum.dateFullBirthDay,
            controller: controller.conclusionDateCtrl,
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
          ).paddingOnly(bottom: AppDimens.paddingSmall),
        );
      },
    );
  }

  // Phí giám định y khoa
  Widget _buildMedicalFee() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập phí giám định y khoa',
      labelText: 'Phí giám định y khoa',
      controller: controller.cccdMotherCtrl,
      inputFormatters: InputFormatterEnum.phoneNumber,
      maxLengthInputForm: 18,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Số BHXH của người nuôi dưỡng(TH mẹ chết)
  Widget _buildGuardianBhxh() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập số BHXH',
      labelText: 'Số BHXH của người nuôi dưỡng(TH mẹ chết)',
      controller: controller.cccdMotherCtrl,
      maxLengthInputForm: 30,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  // Nghỉ dưỡng thai
  Widget _buildMaternityRestDropdown() {
    return FormFieldRegistrant<MaternityLeaveModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<MaternityLeaveModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Nghỉ dưỡng thai',
          hintText: 'Chọn nghỉ dưỡng thai',
          items: AppData.instance.maternityLeave.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Nghỉ chăm con
  Widget _buildChildCareDropdown() {
    return FormFieldRegistrant<ParentalLeaveModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<ParentalLeaveModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Nghỉ chăm con',
          hintText: 'Chọn nghỉ chăm con',
          items: AppData.instance.parentalLeave.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Mang thai hộ
  Widget _buildSurrogacyDropdown() {
    return FormFieldRegistrant<SurrogacyModel>(
      registrarId: '',
      validator: (value) {
        if (value == null) {
          return '';
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return CardDropdownWithLabel<SurrogacyModel>(
          validator: validator,
          fieldKey: formFieldKey,
          labelText: 'Mang thai hộ',
          hintText: 'Chọn mang thai hộ',
          items: AppData.instance.surrogacy.toList(),
          display: (item) => '${item.value} - ${item.text}',
          onChanged: (value) {
            if (value == null) {
              return;
            }
          },
        );
      },
    );
  }

  // Đợt bổ sung
  Widget _buildInputSupplementalPeriod() {
    return FormFieldRegistrant<String>(
      registrarId: "",
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
      hintText: 'Nhập mã hồ sơ',
      labelText: 'Mã hồ sơ',
      controller: controller.fileCodeTextCtrl,
      maxLengthInputForm: 255,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
  // Ghi chú

  Widget _buildnoteText() {
    return CardInputTextFormWithLabel(
      hintText: 'Nhập ghi chú',
      labelText: 'Ghi chú',
      controller: controller.noteTextCtrl,
      maxLengthInputForm: 50,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
}
