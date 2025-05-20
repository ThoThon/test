part of 'declare_info_page.dart';

extension Tk1TabWidget on DeclareInfoPage {
  Widget _buildTk1TabBody() {
    return Form(
      key: controller.tk1State.formKey,
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
                _buildInputBHXHCode(),
                UtilWidget.sizedBox16,
                _buildInputCCCD(),
                UtilWidget.sizedBox16,
                _buildSelectDateOfBirth(),
                UtilWidget.sizedBox12,
                _buildSelectGender(onChanged: (value) {
                  controller.d02Tk1State.gender.value = value;
                }),
                UtilWidget.sizedBox8,
                _buildSelectEthnic(),
                _buildSelectNationality(),
                _buildSelectProvince(),
                _buildSelectDistrict(),
                _buildSelectWard(),
                _buildInputAddress(),
                _buildCheckboxDuplicateBirthAddress()
                    .paddingSymmetric(vertical: AppDimens.paddingVerySmall),
                _buildSelectProvinceReceive(),
                _buildSelectDistrictReceive(),
                _buildSelectWardReceive(),
                _buildInputAddressReceive(),
                UtilWidget.sizedBox16,
                _buildSelectProvinceKCB(),
                _buildSelectHospitalKCB(),
                _buildInputPhoneNumber(),
                _buildParticipantHeadOfHouseholdCheckbox()
                    .paddingSymmetric(vertical: AppDimens.paddingVerySmall),
                _buildInputHeadOfHousehold(),
                UtilWidget.sizedBox16,
                _buildInputHeadOfHouseholdCCCD(),
                UtilWidget.sizedBox16,
                _buildSelectProvinceTT(),
                _buildSelectDistrictTT(),
                _buildSelectWardTT(),
                _buildInputAddressTTTextCtrl(),
                UtilWidget.sizedBox16,
                _buildFamilyMember(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCheckboxDuplicateBirthAddress() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_duplicateBirthAddress.tr,
      value: controller.tk1State.isDuplicateBirthAddress.value,
      onChanged: (value) {
        controller.onChangeDuplicateBirthAddress(value: value);
      },
    );
  }

  Widget _buildSelectProvince() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_provinceOfBirth.tr,
      hintText: LocaleKeys.declareInfo_selectProvinceOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectProvinceOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.provinceOfBirth.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.changeProvinceOfBirth(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.provinceOfBirth,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_provinceOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrict() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_districtOfBirth.tr,
      hintText: LocaleKeys.declareInfo_selectDistrictOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectDistrictOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.districtOfBirth.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.changeDistrictOfBirth(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.districtOfBirth,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_districtOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectWard() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_wardOfBirth.tr,
      hintText: LocaleKeys.declareInfo_selectWardOfBirth.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectWardOfBirth.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.wardOfBirth.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.changeWardOfBirth(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.wardOfBirth,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_wardOfBirthCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputAddress() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_birthAddress.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.birthAddressTextCtrl,
          isValidate: true,
          maxLengthInputForm: 300,
          onChanged: controller.onChangeBirthAddress,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_provinceReceive.tr,
      hintText: LocaleKeys.declareInfo_selectProvinceReceive.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectProvinceReceive.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.provinceReceive.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.onChangeProvinceReceive(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.provinceReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_provinceReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrictReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_districtReceive.tr,
      hintText: LocaleKeys.declareInfo_selectDistrictReceive.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectDistrictReceive.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.districtReceive.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.onChangeDistrictReceive(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.districtReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_districtReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectWardReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_wardReceive.tr,
      hintText: LocaleKeys.declareInfo_selectWardReceive.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectWardReceive.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.wardReceive.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              didChange(value);
              controller.onChangeWardReceive(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.wardReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_wardReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputAddressReceive() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_addressReceive.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.addressReceiveTextCtrl,
          isValidate: true,
          maxLengthInputForm: 300,
          onChanged: controller.onChangeAddressReceive,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceKCB() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_provinceKCB.tr,
      hintText: LocaleKeys.declareInfo_selectProvinceKCB.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectProvinceKCB.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.provinceKCB.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.provinceKCB.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.provinceKCB,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_provinceKCBCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectHospitalKCB() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_hospitalKCB.tr,
      hintText: LocaleKeys.declareInfo_selectHospitalKCB.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectHospitalKCB.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.hospitalKCB.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.hospitalKCB.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.hospitalKCB,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_hospitalKCBCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputPhoneNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_contactPhoneNumber.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.contactPhoneNumberTextCtrl,
          textInputType: TextInputType.phone,
          maxLengthInputForm: 20,
        ),
      ),
    );
  }

  Widget _buildParticipantHeadOfHouseholdCheckbox() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_participantHeadOfHousehold.tr,
      value: controller.tk1State.participantHeadOfHousehold.value,
      onChanged: (value) {
        controller.tk1State.participantHeadOfHousehold.value = value;
      },
    );
  }

  Widget _buildInputHeadOfHousehold() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_headOfHouseholdFullName.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.headOfHouseholdTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputHeadOfHouseholdCCCD() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_headOfHouseholdCCCD.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.headOfHouseholdCCCDTextCtrl,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_provinceTT.tr,
      hintText: LocaleKeys.declareInfo_selectProvinceTT.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectProvinceTT.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.provinceTT.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.provinceTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.provinceTT,
      display: (ethnic) => ethnic,
    );
  }

  Widget _buildSelectDistrictTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_districtTT.tr,
      hintText: LocaleKeys.declareInfo_selectDistrictTT.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectDistrictTT.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.districtTT.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.districtTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.districtTT,
      display: (ethnic) => ethnic,
    );
  }

  Widget _buildSelectWardTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_wardTT.tr,
      hintText: LocaleKeys.declareInfo_selectWardTT.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectWardTT.tr,
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            selectedItem: controller.tk1State.wardTT.value,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.wardTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.wardTT,
      display: (ethnic) => ethnic,
    );
  }

  Widget _buildInputAddressTTTextCtrl() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_addressTT.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.addressTTTextCtrl,
          maxLengthInputForm: 300,
        ),
      ),
    );
  }

  Widget _buildFamilyMember() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SDSBuildText(
          LocaleKeys.declareInfo_familyMembers.tr,
          style: AppTextStyle.font16Bo,
        ),
        if (controller.tk1State.familyMembers.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingVerySmall),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
              vertical: AppDimens.paddingVerySmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.dsGray3,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: addSeparator(
                spacer: UtilWidget.sizedBox8,
                children: controller.tk1State.familyMembers.map(
                  (member) {
                    return SDSBuildText(
                      '${member.fullName} - ${member.relationship}',
                      style: AppTextStyle.font16Re,
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton.icon(
            onPressed: () {
              Get.toNamed(AppRoutes.familyMemberDetail.path);
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            label: const Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
