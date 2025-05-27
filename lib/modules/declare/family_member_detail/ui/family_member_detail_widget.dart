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
                      _buildSelectGender(onChanged: (value) {
                        controller.gender.value = value;
                      }),
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
          controller: controller.bhxhTextCtrl,
          maxLengthInputForm: 10,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.digitsOnly,
        ),
      ),
    );
  }

  Widget _buildInputTitle({
    required String title,
    bool isRequired = false,
  }) {
    return RichText(
      text: TextSpan(
        text: title,
        style: AppTextStyle.font16Bo,
        children: [
          if (isRequired)
            TextSpan(
              text: ' (*)',
              style: AppTextStyle.font12Re.copyWith(
                color: AppColors.statusRed,
              ),
            ),
        ],
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
        controller.birthType.value = value;
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.familyMember_dob.tr,
      hintText: controller.birthType.value.pattern,
      date: convertDateToStringSafe(
        controller.dateOfBirth.value,
        controller.birthType.value.pattern,
      ),
      onTap: () async {
        final DateTime? selectedDate;

        switch (controller.birthType.value) {
          case BirthTypeEnum.year:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: controller.dateOfBirth.value,
              onlyYear: true,
            );
            break;
          case BirthTypeEnum.monthYear:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: controller.dateOfBirth.value,
            );
            break;
          case BirthTypeEnum.full:
            selectedDate = await UtilWidget.showDateTimePicker(
                dateTimeInit: DateTime.now());
            break;
        }

        if (selectedDate != null) {
          controller.dateOfBirth.value = selectedDate;
        }
      },
    );
  }

  Widget _buildSelectGender({
    ValueChanged<Gender>? onChanged,
  }) {
    return Column(
      children: [
        Row(
          children: [
            _buildInputTitle(
              title: LocaleKeys.declareInfo_gender.tr,
              isRequired: true,
            ),
            Expanded(
              child: RadioListTile<Gender>(
                value: Gender.male,
                groupValue: controller.gender.value,
                title: SDSBuildText(
                  LocaleKeys.declareInfo_male.tr,
                  style: AppTextStyle.font16Re,
                ),
                onChanged: (value) {
                  if (value == null) return;
                  onChanged?.call(value);
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
            Expanded(
              child: RadioListTile<Gender>(
                value: Gender.female,
                groupValue: controller.gender.value,
                title: SDSBuildText(
                  LocaleKeys.declareInfo_female.tr,
                  style: AppTextStyle.font16Re,
                ),
                onChanged: (value) {
                  if (value == null) return;
                  onChanged?.call(value);
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
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
            if (value == null) {
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
            if (value == null) {
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
                title: LocaleKeys.familyMember_selectProvinceOfBirth.tr,
                listFilter: AppData.instance.provinces.toList(),
                selectedItem: controller.selectedProvince.value,
                display: (value) => value.name,
                onAccept: (value) {
                  if (value == null) return;
                  didChange(value);

                  if (controller.selectedProvince.value != value) {
                    // Reset district and ward when province changes
                    controller.selectedDistrict.value = null;
                    controller.selectedWard.value = null;
                  }

                  controller.selectedProvince.value = value;
                },
              ),
              isScrollControlled: true,
            );
          },
          selectedItem: controller.selectedProvince.value,
          display: (province) => province.name,
          validator: (value) {
            if (value == null) {
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
              didChange(result);

              if (controller.selectedDistrict.value != result) {
                // Reset ward when district changes
                controller.selectedWard.value = null;
              }

              controller.selectedDistrict.value = result;
            }
          },
          selectedItem: controller.selectedDistrict.value,
          display: (district) => district.name,
          validator: (value) {
            if (value == null) {
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
              didChange(result);
              controller.selectedWard.value = result;
            }
          },
          selectedItem: controller.selectedWard.value,
          display: (ward) => ward.name,
          validator: (value) {
            if (value == null) {
              return LocaleKeys.familyMember_wardOfBirthCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildDropdownRelationship() {
    return UtilWidget.buildDropDownWithLabel2<RelationshipModel>(
      label: LocaleKeys.familyMember_relationshipWithHeadOfHousehold.tr,
      hintText:
          LocaleKeys.familyMember_selectRelationshipWithHeadOfHousehold.tr,
      items: AppData.instance.relationships.toList(),
      display: (item) => item.text,
      selectedItem: controller.relationship.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.relationship.value = value;
      },
    );
  }

  Widget _buildInputCCCDNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.familyMember_cccdNumber.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.cccdTextCtrl,
          maxLengthInputForm: 20,
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
          maxLengthInputForm: 500,
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: LocaleKeys.app_save.tr,
            onPressed: controller.onSubmit,
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: LocaleKeys.app_cancel.tr,
            onPressed: () {},
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
