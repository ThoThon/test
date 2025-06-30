part of 'family_member_detail_page.dart';

extension FamilyMemberDetailWidget on FamilyMemberDetailPage {
  Widget _buildBody() {
    return Column(
      children: [
        Form(
          key: controller.formKey,
          child: Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputFullName(),
                      UtilWidget.sizedBox16,
                      _buildInputBHXHNumber(),
                      UtilWidget.sizedBox8,
                      _buildBirthTypeDropdown(),
                      UtilWidget.sizedBox16,
                      _buildSelectDateOfBirth(),
                      UtilWidget.sizedBox12,
                      _buildSelectedGender(),
                      UtilWidget.sizedBox8,
                      _buildSelectEthnic(),
                      _buildSelectNationality(),
                      _buildSelectProvince(),
                      _buildSelectDistrict(),
                      _buildSelectWard(),
                      _buildDropdownRelationship(),
                      UtilWidget.sizedBox16,
                      _buildInputCCCDNumber(),
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
        _buildBottomButtons(),
      ],
    );
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
    return BuildInputTextWithLabel(
      label: LocaleKeys.familyMember_fullName.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.fullNameTextCtrl,
          isValidate: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys.familyMember_fullNameCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputBHXHNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.familyMember_bhxhCode.tr,
      buildInputText: BuildInputText(
        InputTextModel(
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
        ),
      ),
    );
  }

  Widget _buildBirthTypeDropdown() {
    return UtilWidget.buildDropDownWithLabel2<BirthTypeEnum>(
      label: LocaleKeys.familyMember_selectBirthType.tr,
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
    return UtilWidget.buildInputSelectDate(
      title: LocaleKeys.familyMember_dob.tr,
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
    return UtilWidget.buildListRadio<Gender>(
      options: [
        Gender.male,
        Gender.female,
      ],
      getTitle: (gender) => gender.title,
      selectedItem: controller.gender.value,
      onChanged: (value) {
        controller.gender.value = value;
      },
      validator: (value) {
        if (value == null) {
          return LocaleKeys.familyMember_selectGender.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectEthnic() {
    return Obx(
      () {
        return UtilWidget.buildBottomSheetSelect<EthnicModel>(
          label: LocaleKeys.familyMember_ethnic.tr,
          hintText: LocaleKeys.familyMember_selectEthnic.tr,
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
        return UtilWidget.buildBottomSheetSelect<NationModel>(
          label: LocaleKeys.familyMember_nationality.tr,
          hintText: LocaleKeys.familyMember_selectNationality.tr,
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
        return UtilWidget.buildBottomSheetSelect<ProvinceModel>(
          label: LocaleKeys.familyMember_provinceOfBirth.tr,
          hintText: LocaleKeys.familyMember_selectProvinceOfBirth.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<ProvinceModel>(
                maxLength: 20,
                title: LocaleKeys.familyMember_selectProvinceOfBirth.tr,
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
        return UtilWidget.buildBottomSheetSelect<DistrictModel>(
          label: LocaleKeys.familyMember_districtOfBirth.tr,
          hintText: LocaleKeys.familyMember_selectDistrictOfBirth.tr,
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
        return UtilWidget.buildBottomSheetSelect<WardModel>(
          label: LocaleKeys.familyMember_wardOfBirth.tr,
          hintText: LocaleKeys.familyMember_selectWardOfBirth.tr,
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
        return UtilWidget.buildBottomSheetSelect<RelationshipModel>(
          label: LocaleKeys.familyMember_relationshipWithHeadOfHousehold.tr,
          hintText:
              LocaleKeys.familyMember_selectRelationshipWithHeadOfHousehold.tr,
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
              return "Mối quan hệ với chủ hộ không được bỏ trống";
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputCCCDNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.familyMember_cccdNumber.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.cccdNumberTextCtrl,
          maxLengthInputForm: 20,
          inputFormatters: InputFormatterEnum.textNormal,
        ),
      ),
    );
  }

  Widget _buildInputNote() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.familyMember_note.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.noteTextCtrl,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: LocaleKeys.app_cancel.tr,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: LocaleKeys.app_save.tr,
            onPressed: controller.onSubmit,
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
