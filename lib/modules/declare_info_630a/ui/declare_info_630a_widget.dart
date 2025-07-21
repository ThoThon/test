part of 'declare_info_630a_page.dart';

extension DeclareInfo630aWidget on DeclareInfo630aPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thông tin cá nhân
                _buildInfoPerson(),
                sdsSBHeight12,

                // Họ và tên
                _buildInputFullName(),
                sdsSBHeight12,

                // Mã số BHXH
                _buildInputBHXHCode(),
                sdsSBHeight12,

                // Số CCCD
                _buildInputCCCD(),
                sdsSBHeight12,

                // Mã nhân viên
                _buildStaffCode(),
                sdsSBHeight12,

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

                // "Ngày sinh con" và "Số con"
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildBirthDayChild()),
                    sdsSBWidth12,
                    Expanded(child: _buildNumberChild()),
                  ],
                ),
                sdsSBHeight12,

                // Mã thẻ BHYT của con
                _buildBHYTCardCodeChild(),
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
                sdsSBHeight12,

                // Số serial
                _buildInputSerialNumber(),
                sdsSBHeight12,

                // Điều kiện làm việc
                _buildWorkingConditionDropDown(),
                sdsSBHeight12,

                // Nghỉ dưỡng thai
                _buildMaternityRestCheckbox(),
                sdsSBHeight12,

                // Đợt bổ sung
                _buildInputSupplementalPeriod(),
                sdsSBHeight12,

                // Mã hồ sơ
                _buildInputFileCode(),
                sdsSBHeight12,

                // Ghi chú
                _buildInputNote(),
                sdsSBHeight12,

                // Thông tin tài khoản nhập trợ cấp
                _buildTitleInfoAccount(),
                sdsSBHeight12,

                // Hình thức nhận
                _buildReceiveMethodDropDown(),
                sdsSBHeight12,

                // Số tài khoản ngân hàng
                _buildInputBankNumber(),
                sdsSBHeight12,

                // Tên chủ tài khoản
                _buildInputAccountHolderName(),
                sdsSBHeight12,

                // Ngân hàng
                _buildSelectBank(),

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
            ),
          ),
        ),
        _buildButtonSave(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  // Thông tin cá nhân
  Widget _buildInfoPerson() {
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            LocaleKeys.declareInfo_personalInfo.tr,
            style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
          ),
        ),
        TextButton(
          // onPressed: controller.goToSelectStaffPage,
          onPressed: () {},
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

  // Họ và tên
  Widget _buildInputFullName() {
    return FormFieldRegistrant<String>(
      registrarId: "eeee098a-b814-4b72-a6ce-680158ee59f5",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_fullNameEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_fullName.tr,
          controller: controller.fullNameTextCtrl,
          isRequired: true,
          maxLengthInputForm: 100,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Mã số BHXH
  Widget _buildInputBHXHCode() {
    return FormFieldRegistrant<String>(
      registrarId: "862edcd8-8319-4549-a432-2fd886036cc1",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_bhxhCodeInvalid.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          isRequired: true,
          labelText: LocaleKeys.declareInfo_bhxhCode.tr,
          controller: controller.bhxhTextCtrl,
          maxLengthInputForm: 10,
          hintText: LocaleKeys.declareInfo_inputBhxhCode.tr,
          inputFormatters: InputFormatterEnum.digitsOnly,
          textInputType: TextInputType.number,
          onChanged: (value) {},
        );
      },
    );
  }

  // Số CCCD
  Widget _buildInputCCCD() {
    return FormFieldRegistrant<String>(
      registrarId: "28a50d69-b4d0-4c62-bfe1-f313c90a3846",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_cccdEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_cccd.tr,
          // autovalidateMode: controller.autovalidateMode.value,
          controller: controller.cccdTextCtrl,
          hintText: LocaleKeys.declareInfo_inputCCCD.tr,
          maxLengthInputForm: 20,
          inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Mã nhân viên
  Widget _buildStaffCode() {
    return FormFieldRegistrant<String>(
      registrarId: "c6efeb82-2615-4e62-9e11-d2355b2cda4c",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_staffCodeCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_staffCode.tr,
          // autovalidateMode: controller.autovalidateMode.value,
          controller: controller.cccdTextCtrl,
          hintText: LocaleKeys.declareInfo_inputStaffCode.tr,
          maxLengthInputForm: 100,
          inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
          onChanged: (p0) {},
        );
      },
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
    return FormFieldRegistrant<DeclareMethodEnum>(
      registrarId: '1b6c5f61-7b44-418c-94c0-fde7a6e4b892',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_declareMethodCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<DeclareMethodEnum>(
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_declareMethod.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectDeclareMethod.tr,
            items: DeclareMethodEnum.values,
            display: (item) => item.title,
            selectedItem: controller.declareMethod.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.declareMethod.value = value;
            },
            validator: validator,
          ),
        );
      },
    );
  }

  // Mã nhóm hưởng
  Widget _buildBenefitGroupCodeDropdown() {
    return FormFieldRegistrant(
      registrarId: 'aca45ce6-4a50-4f46-8ca8-3b7e895bd78f',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_benefitGroupCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<BenefitGroupCodeEnum>(
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_benefitGroupCode.tr,
            isRequired: true,
            hintText: LocaleKeys.declareInfo_selectBenefitGroupCode.tr,
            items: BenefitGroupCodeEnum.values,
            display: (item) => item.title,
            selectedItem: controller.benefitGroupCode.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.benefitGroupCode.value = value;
            },
          ),
        );
      },
    );
  }

  // Ngày sinh con
  Widget _buildBirthDayChild() {
    return FormFieldRegistrant<String>(
      registrarId: 'e3d8c0c2-5265-49d7-b6df-99b8136ab507',
      validator: (value) {
        final trimmedValue = value?.trim();

        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_birthDayChildEmpty.tr;
        }
        if (trimmedValue.isEmpty) {
          return null;
        }

        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
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
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_birthDayChild.tr,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          controller: controller.birthDayChildCtrl,
          hintText: PATTERN_1,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateSafe(
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
        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_fromDayEmpty.tr;
        }

        if (trimmedValue.isEmpty) {
          // Không bắt buộc
          return null;
        }
        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
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
          controller.toDateTextCtrl.text,
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
          controller: controller.fromDateTextCtrl,
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
              dateTimeInit: convertStringToDateSafe(
                    controller.fromDateTextCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.fromDateTextCtrl.text =
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

        // Nếu bắt buộc và không nhập thì báo lỗi
        if ((trimmedValue == null || trimmedValue.isEmpty)) {
          return LocaleKeys.declareInfo_toDayEmpty.tr;
        }
        if (trimmedValue.isEmpty) {
          return null;
        }

        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
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
          controller.fromDateTextCtrl.text,
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
          controller: controller.toDateTextCtrl,
          hintText: PATTERN_1,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await DatePickerUtils.showCalendarPicker(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding32),
              title: LocaleKeys.dialog_selectDayMonthYear.tr,
              dateFormat: PATTERN_1,
              dateTimeInit: convertStringToDateSafe(
                    controller.toDateTextCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.toDateTextCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  // Số con
  Widget _buildNumberChild() {
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
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_numberChildHint.tr,
          labelText: LocaleKeys.declareInfo_numberChild.tr,
          controller: controller.numberChildCtrl,
          isRequired: true,
          maxLengthInputForm: 1,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Mã thẻ BHYT của con
  Widget _buildBHYTCardCodeChild() {
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
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_bhytCardCodeHint.tr,
          labelText: LocaleKeys.declareInfo_bhytCardCode.tr,
          controller: controller.bhytCardCodeChildCtrl,
          isRequired: true,
          maxLengthInputForm: 50,
          onChanged: (p0) {},
        );
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
          onChanged: (value) {},
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
        if (trimmedValue.isEmpty) {
          return null;
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
              dateTimeInit: convertStringToDateSafe(
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
      () => CardDropdownWithLabel<WeeklyDayOffEnum>(
        labelText: LocaleKeys.declareInfo_weeklyDayOff.tr,
        hintText: LocaleKeys.declareInfo_weeklyDayOffHint.tr,
        items: WeeklyDayOffEnum.values,
        display: (item) => item.title,
        selectedItem: controller.weeklyDayOff.value,
        onChanged: (value) {
          if (value == null) {
            return;
          }
          controller.weeklyDayOff.value = value;
        },
      ),
    );
  }

  Widget _buildHospitalLine() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '18c661be-0348-476e-8eaa-333a621c8e23',
      validator: (value) {
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              // autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_hospitalLine.tr,
              hintText: LocaleKeys.declareInfo_hospitalLineHint.tr,
              funcSelect: (didChange) async {
                // final provinceReceive =
                //     controller.tk1State.provinceReceive.value;
                // if (provinceReceive == null) {
                //   controller.showSnackBar(
                //       LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
                //   return;
                // }

                // final result = await Get.bottomSheet<DistrictModel>(
                //   SelectDistrictBts(
                //     provinceCode: provinceReceive.id,
                //     selectedDistrict: controller.tk1State.districtReceive.value,
                //   ),
                //   isScrollControlled: true,
                // );

                // if (result != null) {
                //   controller.onChangeDistrictReceive(result);
                //   didChange(result);
                // }
              },
              selectedItem: controller.districtReceive.value,
              display: (district) => '${district.id} - ${district.name}',
            );
          },
        );
      },
    );
  }

  // Chọn/Nhập mã bệnh
  Widget _buildSelectDiseaseCode() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '03315ce3-0c9e-46fb-bbcc-fc3756a25f27',
      validator: (value) {
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              // autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_selectDiseaseCode.tr,
              hintText: LocaleKeys.declareInfo_selectDiseaseCodeHint.tr,
              funcSelect: (didChange) async {
                // final provinceReceive =
                //     controller.tk1State.provinceReceive.value;
                // if (provinceReceive == null) {
                //   controller.showSnackBar(
                //       LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
                //   return;
                // }

                // final result = await Get.bottomSheet<DistrictModel>(
                //   SelectDistrictBts(
                //     provinceCode: provinceReceive.id,
                //     selectedDistrict: controller.tk1State.districtReceive.value,
                //   ),
                //   isScrollControlled: true,
                // );

                // if (result != null) {
                //   controller.onChangeDistrictReceive(result);
                //   didChange(result);
                // }
              },
              selectedItem: controller.districtReceive.value,
              display: (district) => '${district.id} - ${district.name}',
            );
          },
        );
      },
    );
  }

  // Tên bệnh
  Widget _buildInputDisseaseName() {
    return FormFieldRegistrant<String>(
      registrarId: "1bdfd509-0fa3-49ff-b03f-772f73371368",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_diseaseNameEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_diseaseNameHint.tr,
          labelText: LocaleKeys.declareInfo_diseaseName.tr,
          controller: controller.diseaseNameTextCtrl,
          maxLengthInputForm: 1000,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Số serial
  Widget _buildInputSerialNumber() {
    return FormFieldRegistrant<String>(
      registrarId: "2b069e7d-a134-4e3c-ad8d-f540efae2bac",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_serialNumberEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_serialNumberHint.tr,
          labelText: LocaleKeys.declareInfo_serialNumber.tr,
          controller: controller.serialNumberCtrl,
          maxLengthInputForm: 30,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Điều kiện làm việc
  Widget _buildWorkingConditionDropDown() {
    return Obx(
      () => CardDropdownWithLabel<WorkingConditionEnum>(
        labelText: LocaleKeys.declareInfo_workingCondition.tr,
        hintText: LocaleKeys.declareInfo_workingConditionHint.tr,
        items: WorkingConditionEnum.values,
        display: (item) => item.title,
        selectedItem: controller.workCondition.value,
        onChanged: (value) {
          if (value == null) {
            return;
          }
          controller.workCondition.value = value;
        },
      ),
    );
  }

  // Nghỉ dưỡng thai
  Widget _buildMaternityRestCheckbox() {
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
    );
  }

  // Đợt bổ sung
  Widget _buildInputSupplementalPeriod() {
    return FormFieldRegistrant<String>(
      registrarId: "90c966f8-6acb-49f2-96bf-0d800d6e0868",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_supplementalPeriodEmpty.tr;
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
          maxLengthInputForm: 2,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Mã hồ sơ
  Widget _buildInputFileCode() {
    return FormFieldRegistrant<String>(
      registrarId: "885dc071-6ea3-47ef-b183-d7466d028d25",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_fileCodeEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_fileCodeHint.tr,
          labelText: LocaleKeys.declareInfo_fileCode.tr,
          controller: controller.fileCodeTextCtrl,
          maxLengthInputForm: 255,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Ghi chú
  Widget _buildInputNote() {
    return FormFieldRegistrant<String>(
      registrarId: "885dc071-6ea3-47ef-b183-d7466d028d25",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_noteEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_noteHint.tr,
          labelText: LocaleKeys.declareInfo_note.tr,
          controller: controller.noteTextCtrl,
          maxLengthInputForm: 1000,
          onChanged: (p0) {},
        );
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
    return FormFieldRegistrant(
      registrarId: '3ab86dc5-6f4b-4350-bdd4-28aa600ac4ad',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.declareInfo_receiveMethodEmpty.tr;
        }
        return null;
      },
      builder: (formFieldKey, validator) {
        return Obx(
          () => CardDropdownWithLabel<ReceiveMethodEnum>(
            fieldKey: formFieldKey,
            labelText: LocaleKeys.declareInfo_receiveMethod.tr,
            hintText: LocaleKeys.declareInfo_receiveMethodHint.tr,
            items: ReceiveMethodEnum.values,
            isRequired: true,
            display: (item) => item.title,
            selectedItem: controller.receiveMethod.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.receiveMethod.value = value;
            },
          ),
        );
      },
    );
  }

  // Số tài khoản ngân hàng
  Widget _buildInputBankNumber() {
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
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_bankNumberHint.tr,
          labelText: LocaleKeys.declareInfo_bankNumber.tr,
          controller: controller.bankNumberCtrl,
          maxLengthInputForm: 50,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Tên chủ tài khoản
  Widget _buildInputAccountHolderName() {
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
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_accountHolderNameHint.tr,
          labelText: LocaleKeys.declareInfo_accountHolderName.tr,
          controller: controller.bankNumberCtrl,
          maxLengthInputForm: 100,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Ngân hàng
  Widget _buildSelectBank() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '4fd76b7c-3f06-4448-9dc3-481d1569495d',
      validator: (value) {
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              // autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_bank.tr,
              hintText: LocaleKeys.declareInfo_bankHint.tr,
              funcSelect: (didChange) async {
                // final provinceReceive =
                //     controller.tk1State.provinceReceive.value;
                // if (provinceReceive == null) {
                //   controller.showSnackBar(
                //       LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
                //   return;
                // }

                // final result = await Get.bottomSheet<DistrictModel>(
                //   SelectDistrictBts(
                //     provinceCode: provinceReceive.id,
                //     selectedDistrict: controller.tk1State.districtReceive.value,
                //   ),
                //   isScrollControlled: true,
                // );

                // if (result != null) {
                //   controller.onChangeDistrictReceive(result);
                //   didChange(result);
                // }
              },
              selectedItem: controller.districtReceive.value,
              display: (district) => '${district.id} - ${district.name}',
            );
          },
        );
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

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_resolvedPeriodHint.tr,
          labelText: LocaleKeys.declareInfo_resolvedPeriod.tr,
          controller: controller.resolvedPeriodCtrl,
          maxLengthInputForm: 2,
          onChanged: (p0) {},
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
        if (trimmedValue.isEmpty) {
          return null;
        }

        // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
        if (trimmedValue.length < 7) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        final toDate = convertStringToDateStrict(trimmedValue, PATTERN_1);
        if (toDate == null) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        // date phải trong khoảng từ 1900 đến 2100 thì mới tạo được xml
        if (toDate.year <= 1900 || toDate.year >= 2100) {
          return LocaleKeys.declareInfo_resolvedDateInvalid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_resolvedDate.tr,
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
              dateTimeInit: convertStringToDateSafe(
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
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_adjustReasonHint.tr,
          labelText: LocaleKeys.declareInfo_adjustReason.tr,
          controller: controller.resolvedPeriodCtrl,
          maxLengthInputForm: 2000,
          onChanged: (p0) {},
        );
      },
    );
  }

  Widget _buildButtonSave() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.declareInfo_saveButton.tr,
      backgroundColor: AppColors.primaryColor,
      borderRadius: AppDimens.radius30,
      onPressed: () {},
    ).paddingOnly(top: AppDimens.paddingSmall);
  }
}
