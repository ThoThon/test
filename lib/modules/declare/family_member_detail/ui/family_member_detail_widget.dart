part of 'family_member_detail_page.dart';

final GlobalKey<FormRegistryWidgetState> _registeredKey = GlobalKey();

extension FamilyMemberDetailWidget on FamilyMemberDetailPage {
  Widget _buildBody() {
    return Column(
      children: [
        FormRegistryWidget(
          key: _registeredKey,
          autoScrollToFirstInvalid: true,
          child: Form(
            key: controller.formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Họ và tên
                        _buildInputFullName(),
                        sdsSBHeight12,

                        //Mã số BHXH
                        _buildInputBHXHNumber(),
                        sdsSBHeight12,

                        //Loại ngày sinh
                        _buildBirthTypeDropdown(),
                        sdsSBHeight12,

                        //"Ngày sinh" và "Giới tính"
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildSelectDateOfBirth()),
                            sdsSBWidth12,
                            Expanded(child: _buildSelectedGender()),
                          ],
                        ),
                        sdsSBHeight12,

                        //"Dân tộc" và "Quốc tịch"
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildSelectEthnic()),
                            sdsSBWidth12,
                            Expanded(child: _buildSelectNationality()),
                          ],
                        ),

                        //Tỉnh khai sinh
                        _buildSelectProvince(),

                        //Huyện khai sinh
                        _buildSelectDistrict(),

                        //Xã khai sinh
                        _buildSelectWard(),

                        //Mối quan hệ với chủ hộ
                        _buildDropdownRelationship(),

                        //Số CCCD
                        _buildInputCCCDNumber(),
                        sdsSBHeight12,

                        //Ghi chú
                        _buildInputNote(),
                        _buildCheckboxParticipant().paddingSymmetric(
                            vertical: AppDimens.paddingVerySmall),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        _buildBottomButtons(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildCheckboxParticipant() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.familyMember_isParticipant.tr,
      value: controller.isParticipant.value,
      onChanged: (value) {
        controller.isParticipant.value = value;
      },
    );
  }

  Widget _buildInputFullName() {
    return FormFieldRegistrant<String>(
      registrarId: "No. 1",
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_fullNameCannotEmpty.tr;
        }
        return null;
      },
      builder: (
        GlobalKey<FormFieldState<String>> formFieldKey,
        String? Function(String?) validator,
      ) {
        return CardInputTextFormWithLabel(
          fieldKey: formFieldKey,
          labelText: LocaleKeys.familyMember_fullName.tr,
          controller: controller.fullNameTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
          validator: validator,
        );
      },
    );
  }

  Widget _buildInputBHXHNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.familyMember_bhxhCode.tr,
      controller: controller.bhxhNumberTextCtrl,
      maxLengthInputForm: 10,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.digitsOnly,
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.familyMember_bhxhCodeInValid.tr;
        }

        return null;
      },
    );
  }

  Widget _buildBirthTypeDropdown() {
    return CardDropdownWithLabel<BirthTypeEnum>(
      isRequired: true,
      labelText: LocaleKeys.familyMember_selectBirthType.tr,
      hintText: LocaleKeys.familyMember_selectBirthTypeHint.tr,
      items: BirthTypeEnum.values,
      display: (item) => item.title,
      selectedItem: controller.birthType.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.dateOfBirthCtrl.clear();
        controller.birthType.value = value;
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return CardInputSelectDateWithLabel(
      isRequired: true,
      labelText: LocaleKeys.familyMember_dob.tr,
      hintText: controller.birthType.value.pattern,
      inputFormatters: controller.birthType.value.inputFormatter,
      controller: controller.dateOfBirthCtrl,
      onSelectDate: () async {
        KeyBoard.hide();
        final DateTime? selectedDate;

        switch (controller.birthType.value) {
          case BirthTypeEnum.year:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.dateOfBirthCtrl.text, PATTERN_13) ??
                  DateTime.now(),
              onlyYear: true,
            );
            break;
          case BirthTypeEnum.monthYear:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.dateOfBirthCtrl.text, PATTERN_12) ??
                  DateTime.now(),
            );
            break;
          case BirthTypeEnum.full:
            selectedDate = await UtilWidget.showDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                      controller.dateOfBirthCtrl.text, PATTERN_1) ??
                  DateTime.now(),
            );
            break;
        }
        // Khởi tạo dateTime trong DatePicker từ giá trị nhập
        if (selectedDate != null) {
          controller.dateOfBirthCtrl.text = convertDateToStringSafe(
                selectedDate,
                controller.birthType.value.pattern,
              ) ??
              '';
        }
      },
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_dobCannotEmpty.tr;
        }
        switch (controller.birthType.value) {
          case BirthTypeEnum.year:
            // Kiểm tra độ dài chuỗi (yyyy = 4 ký tự)
            if (trimmedValue.length < 4) {
              return LocaleKeys.declareInfo_dobInvalid.tr;
            }
            break;
          case BirthTypeEnum.monthYear:
            // Kiểm tra độ dài chuỗi (MM/yyyy = 7 ký tự)
            if (trimmedValue.length < 7) {
              return LocaleKeys.declareInfo_dobInvalid.tr;
            }
            break;
          case BirthTypeEnum.full:
            // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
            if (trimmedValue.length < 10) {
              return LocaleKeys.declareInfo_dobInvalid.tr;
            }
            break;
        }

        final date = convertStringToDateStrict(
            trimmedValue, controller.birthType.value.pattern);
        if (date == null) {
          return LocaleKeys.declareInfo_dobInvalid.tr;
        }

        // Chỉ được nhập từ năm 1900
        if (date.year <= 1900) {
          return LocaleKeys.declareInfo_dobInvalid.tr;
        }

        //Ngày sinh phải < ngày hiện tại
        if (date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_dobCannotFuture.tr;
        }

        return null;
      },
    );
  }

  Widget _buildSelectedGender() {
    return CardDropdownWithLabel<Gender>(
      key: ValueKey(controller.gender.value),
      labelText: LocaleKeys.declareInfo_gender.tr,
      items: Gender.values,
      display: (item) => item.title,
      isRequired: true,
      selectedItem: controller.gender.value,
      onChanged: (value) {
        if (value != null) {
          controller.gender.value = value;
        }
      },
    );
  }

  Widget _buildSelectEthnic() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<EthnicModel>(
          label: LocaleKeys.familyMember_ethnic.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<EthnicModel>(
                maxLength: 20,
                title: LocaleKeys.familyMember_selectEthnic.tr,
                listFilter: AppData.instance.ethnics.toList(),
                selectedItem: controller.selectedEthnic.value,
                display: (value) => value.text,
                onAccept: (value) {
                  if (value == null) return;
                  controller.selectedEthnic.value = value;
                  didChange(value);
                },
              ),
              isScrollControlled: true,
            );
          },
          selectedItem: controller.selectedEthnic.value,
          display: (ethnic) => ethnic.text,
          validator: (value) {
            if (controller.selectedEthnic.value == null) {
              return LocaleKeys.familyMember_ethnicCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectNationality() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<NationModel>(
          label: LocaleKeys.familyMember_nationality.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<NationModel>(
                maxLength: 20,
                title: LocaleKeys.familyMember_selectNationality.tr,
                listFilter: AppData.instance.nations.toList(),
                selectedItem: controller.selectedNationality.value,
                display: (value) => value.text,
                onAccept: (value) {
                  if (value == null) return;
                  controller.selectedNationality.value = value;
                  didChange(value);
                },
              ),
              isScrollControlled: true,
            );
          },
          selectedItem: controller.selectedNationality.value,
          display: (nation) => nation.text,
          validator: (value) {
            if (controller.selectedNationality.value == null) {
              return LocaleKeys.familyMember_nationalityCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectProvince() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
          label: LocaleKeys.familyMember_provinceOfBirth.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<ProvinceModel>(
                maxLength: 20,
                title: LocaleKeys.familyMember_selectProvince.tr,
                listFilter: AppData.instance.provinces.toList(),
                selectedItem: controller.selectedProvince.value,
                display: (value) => value.name,
                onAccept: (value) {
                  if (value == null) return;

                  if (controller.selectedProvince.value != value) {
                    // Reset district and ward when province changes
                    controller.selectedDistrict.value = null;
                    controller.selectedWard.value = null;
                  }

                  controller.selectedProvince.value = value;

                  didChange(value);
                },
              ),
              isScrollControlled: true,
            );
          },
          selectedItem: controller.selectedProvince.value,
          display: (province) => province.name,
          validator: (value) {
            if (controller.selectedProvince.value == null) {
              return LocaleKeys.familyMember_provinceOfBirthCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectDistrict() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
          label: LocaleKeys.familyMember_districtOfBirth.tr,
          funcSelect: (didChange) async {
            final districtOfBirth = controller.selectedProvince.value;
            if (districtOfBirth == null) {
              controller.showSnackBar(
                  LocaleKeys.declareInfo_provinceOfBirthNotSelected.tr);
              return;
            }

            final result = await Get.bottomSheet<DistrictModel>(
              SelectDistrictBts(
                provinceCode: districtOfBirth.id,
                selectedDistrict: controller.selectedDistrict.value,
              ),
              isScrollControlled: true,
            );

            if (result != null) {
              if (controller.selectedDistrict.value != result) {
                // Reset ward when district changes
                controller.selectedWard.value = null;
              }

              controller.selectedDistrict.value = result;

              didChange(result);
            }
          },
          selectedItem: controller.selectedDistrict.value,
          display: (district) => district.name,
          validator: (value) {
            if (controller.selectedDistrict.value == null) {
              return LocaleKeys.familyMember_districtOfBirthCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectWard() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
          label: LocaleKeys.familyMember_wardOfBirth.tr,
          funcSelect: (didChange) async {
            final provinceOfBirth = controller.selectedProvince.value;
            if (provinceOfBirth == null) {
              controller.showSnackBar(
                  LocaleKeys.declareInfo_provinceOfBirthNotSelected.tr);
              return;
            }

            final districtOfBirth = controller.selectedDistrict.value;
            if (districtOfBirth == null) {
              controller.showSnackBar(
                  LocaleKeys.declareInfo_districtOfBirthNotSelected.tr);
              return;
            }

            final result = await Get.bottomSheet<WardModel>(
              SelectWardBts(
                provinceCode: provinceOfBirth.id,
                districtCode: districtOfBirth.id,
                selectedWard: controller.selectedWard.value,
              ),
              isScrollControlled: true,
            );

            if (result != null) {
              controller.selectedWard.value = result;

              didChange(result);
            }
          },
          selectedItem: controller.selectedWard.value,
          display: (ward) => ward.name,
          validator: (value) {
            if (controller.selectedWard.value == null) {
              return LocaleKeys.familyMember_wardOfBirthCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildDropdownRelationship() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<RelationshipModel>(
          label: LocaleKeys.familyMember_relationshipWithHeadOfHousehold.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<RelationshipModel>(
                maxLength: 20,
                title: LocaleKeys
                    .familyMember_selectRelationshipWithHeadOfHousehold.tr,
                listFilter: AppData.instance.relationships.toList(),
                selectedItem: controller.relationship.value,
                display: (value) => value.text,
                onAccept: (value) {
                  if (value == null) {
                    return;
                  }
                  controller.relationship.value = value;

                  didChange(value);
                },
              ),
              isScrollControlled: true,
            );
          },
          selectedItem: controller.relationship.value,
          display: (province) => province.text,
          validator: (value) {
            if (controller.relationship.value == null) {
              return LocaleKeys
                  .familyMember_relationToHouseholdOwnerCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputCCCDNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.familyMember_cccdNumber.tr,
      controller: controller.cccdNumberTextCtrl,
      isRequired: false,
      hintText: LocaleKeys.familyMember_inputNumberCCCD.tr,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.textNormal,
    );
  }

  Widget _buildInputNote() {
    // return CardInputTextFormWithLabel(
    //   labelText: LocaleKeys.familyMember_note.tr,
    //   controller: controller.noteTextCtrl,
    //   isRequired: false,
    //   inputFormatters: InputFormatterEnum.textNormal,
    //   maxLengthInputForm: 500,
    // );
    return FormFieldRegistrant<String>(
      registrarId: "No. 2",
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_fullNameCannotEmpty.tr;
        }
        return null;
      },
      builder: (
        GlobalKey<FormFieldState<String>> formFieldKey,
        String? Function(String?) validator,
      ) {
        return CardInputTextFormWithLabel(
          fieldKey: formFieldKey,
          labelText: LocaleKeys.familyMember_note.tr,
          controller: controller.noteTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
          validator: validator,
        );
      },
    );
  }

  Widget _buildBottomButtons() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.app_save.tr,
          onPressed: controller.onSubmit,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          borderRadius: AppDimens.radius30,
        ).paddingOnly(bottom: AppDimens.paddingVerySmall);
      },
    );
  }
}
