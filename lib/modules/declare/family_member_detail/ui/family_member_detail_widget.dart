part of 'family_member_detail_page.dart';

extension FamilyMemberDetailWidget on FamilyMemberDetailPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
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
                    UtilWidget.buildCheckboxWithLabel(
                      label: 'Là người tham gia',
                      value: controller.isParticipant.value,
                      onChanged: (value) {
                        controller.isParticipant.value = value ?? false;
                      },
                    ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
                  ],
                );
              },
            ),
          ),
        ),
        _buildBottomButtons(),
      ],
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

  Widget _buildSelectDateOfBirth() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.familyMember_dob.tr,
      hintText: PATTERN_1,
      date: convertDateToStringSafe(
        controller.dateOfBirth.value,
        PATTERN_1,
      ),
      onTap: () async {
        final selectedDate =
            await UtilWidget.showDateTimePicker(dateTimeInit: DateTime.now());
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
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.familyMember_ethnic.tr,
      hintText: LocaleKeys.familyMember_selectEthnic.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.familyMember_selectEthnic.tr,
            listFilter: ['Kinh', 'Thái', 'Tày'],
            itemSelect: controller.selectedEthnic,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedEthnic.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedEthnic,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_ethnicCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectNationality() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.familyMember_nationality.tr,
      hintText: LocaleKeys.familyMember_selectNationality.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.familyMember_selectNationality.tr,
            listFilter: ['Việt Nam', 'Lào', 'Campuchia'],
            itemSelect: controller.selectedNationality,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedNationality.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedNationality,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_nationalityCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectProvince() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.familyMember_provinceOfBirth.tr,
      hintText: LocaleKeys.familyMember_selectProvinceOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.familyMember_selectProvinceOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedProvince,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedProvince.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedProvince,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_provinceOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrict() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.familyMember_districtOfBirth.tr,
      hintText: LocaleKeys.familyMember_selectDistrictOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.familyMember_selectDistrictOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedDistrict,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedDistrict.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedDistrict,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_districtOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectWard() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.familyMember_wardOfBirth.tr,
      hintText: LocaleKeys.familyMember_selectWardOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.familyMember_selectWardOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.selectedWard,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.selectedWard.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.selectedWard,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.familyMember_wardOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildDropdownRelationship() {
    return UtilWidget.buildDropDownWithLabel<String>(
      label: LocaleKeys.familyMember_relationshipWithHeadOfHousehold.tr,
      hintText:
          LocaleKeys.familyMember_selectRelationshipWithHeadOfHousehold.tr,
      items: ['Vợ', 'Con trai', 'Con gái'],
      display: (item) => item,
      selectedItem: controller.relationship.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.relationship.value = value;
      },
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: LocaleKeys.app_save.tr,
            onPressed: () {},
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
