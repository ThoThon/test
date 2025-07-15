part of 'declare_info_page.dart';

extension Tk1TabWidget on DeclareInfoPage {
  Widget _buildTk1TabBody() {
    return AppFormRegistry(
      key: controller.tk1State.registeredKey,
      child: Obx(
        () {
          return Form(
            key: controller.tk1State.formKey,
            autovalidateMode: controller.tk1State.autoValidateMode.value,
            child: SingleChildScrollView(
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sdsSBHeight8,

                      //Thông tin cá nhân
                      _buildInfoPerson(),
                      sdsSBHeight8,

                      //Họ và tên
                      _buildInputFullName(
                        registrarId: '52ffe6f6-fb1e-436c-91ff-faeb0a3e5609',
                      ),
                      sdsSBHeight12,

                      //Mã số BHXH
                      _buildInputBHXHCode(
                        registrarId: '0d1d709e-cbeb-4804-b6a1-7949e2dd0947',
                      ),
                      sdsSBHeight12,

                      //Số CCCD
                      _buildInputCCCD(
                        registrarId: '64a6d6fd-3fce-4861-9282-42451a164f3a',
                      ),
                      sdsSBHeight12,

                      //Loại ngày sinh
                      _buildBirthTypeDropdown(),
                      sdsSBHeight12,

                      //Ngày sinh và giới tính
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildSelectDateOfBirth(
                              registrarId:
                                  '4e874e0c-1c67-4a47-b3bf-ddb23c39166b',
                            ),
                          ),
                          sdsSBWidth12,
                          Expanded(child: _buildSelectGender())
                        ],
                      ),
                      sdsSBHeight12,

                      //Dân tộc và quốc tịch
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildSelectEthnic()),
                          sdsSBWidth12,
                          Expanded(child: _buildSelectNationality()),
                        ],
                      ),

                      //Số điện thoại liên hệ
                      _buildInputPhoneNumber(),
                      sdsSBHeight12,

                      //Thông tin địa chỉ
                      SDSBuildText(
                        LocaleKeys.declareInfo_addressInfo.tr,
                        style: AppTextStyle.font16Bo
                            .copyWith(color: AppColors.colorBlack),
                      ),
                      sdsSBHeight12,

                      //Tỉnh khai sinh
                      _buildSelectProvince(),

                      //Huyện khai sinh
                      _buildSelectDistrict(),

                      //Xã khai sinh
                      _buildSelectWard(),

                      //Địa chỉ khai sinh
                      _buildInputAddress(),

                      //Trùng thông tin nơi khai sinh
                      _buildCheckboxDuplicateBirthAddress().paddingSymmetric(
                          vertical: AppDimens.paddingVerySmall),

                      //Tỉnh nơi nhận
                      _buildSelectProvinceReceive(),

                      //Huyện nơi nhận
                      _buildSelectDistrictReceive(),

                      //Xã nơi nhận
                      _buildSelectWardReceive(),

                      //Địa chỉ nơi nhận
                      _buildInputAddressReceive(),
                      sdsSBHeight12,

                      //Thông tin nơi khám chữa bệnh
                      SDSBuildText(
                        LocaleKeys.declareInfo_medicalFacilityInfo.tr,
                        style: AppTextStyle.font16Bo
                            .copyWith(color: AppColors.colorBlack),
                      ),
                      UtilWidget.sizedBox16,

                      //Tỉnh nơi khám chữa bệnh
                      _buildSelectProvinceKCB(),

                      //Bệnh viện nơi khám chữa bệnh
                      _buildSelectHospitalKCB(),

                      //Thông tin chủ hộ
                      SDSBuildText(
                        LocaleKeys.declareInfo_householdOwnerInfo.tr,
                        style: AppTextStyle.font16Bo
                            .copyWith(color: AppColors.colorBlack),
                      ),

                      //Người tham gia là chủ hộ
                      _buildParticipantHeadOfHouseholdCheckbox()
                          .paddingSymmetric(
                              vertical: AppDimens.paddingVerySmall),

                      // Họ và tên chủ hộ
                      _buildInputHeadOfHousehold(),
                      sdsSBHeight12,

                      //Số CCCD/ĐDCN của chủ hộ
                      _buildInputHeadOfHouseholdCCCD(),
                      sdsSBHeight12,

                      //Tỉnh thường trú
                      _buildSelectProvinceTT(),

                      //Huyện thường trú
                      _buildSelectDistrictTT(),

                      //Xã thường trú
                      _buildSelectWardTT(),

                      //Địa chỉ thường trú
                      _buildInputAddressTTTextCtrl(),
                      sdsSBHeight12,

                      //Thêm thành viên
                      _buildFamilyMember(),
                      sdsSBHeight4,
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectEthnic() {
    return FormFieldRegistrant<EthnicModel>(
      registrarId: 'a7e14df2-572a-4cf6-bc07-dc9a23ca307e',
      validator: (value) {
        if (controller.d02Tk1State.selectedEthnic.value == null) {
          return LocaleKeys.declareInfo_ethnicCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<EthnicModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_ethnic.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<EthnicModel>(
                    title: LocaleKeys.declareInfo_selectEthnic.tr,
                    maxLength: 20,
                    hintText: LocaleKeys.declareInfo_inputEthnic.tr,
                    listFilter: AppData.instance.ethnics.toList(),
                    selectedItem: controller.d02Tk1State.selectedEthnic.value,
                    display: (value) => value.text,
                    onAccept: (value) {
                      if (value == null) return;
                      controller.d02Tk1State.selectedEthnic.value = value;
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.d02Tk1State.selectedEthnic.value,
              display: (ethnic) => ethnic.text,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectNationality() {
    return FormFieldRegistrant<NationModel>(
      registrarId: 'deb786de-fc3b-49fa-b75e-6558db23474f',
      validator: (value) {
        if (controller.d02Tk1State.selectedNationality.value == null) {
          return LocaleKeys.declareInfo_nationalityCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<NationModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_nationality.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<NationModel>(
                    title: LocaleKeys.declareInfo_selectNationality.tr,
                    maxLength: 20,
                    hintText: LocaleKeys.declareInfo_inputNationality.tr,
                    listFilter: AppData.instance.nations.toList(),
                    selectedItem:
                        controller.d02Tk1State.selectedNationality.value,
                    display: (value) => value.text,
                    onAccept: (value) {
                      if (value == null) return;
                      controller.d02Tk1State.selectedNationality.value = value;
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.d02Tk1State.selectedNationality.value,
              display: (nation) => nation.text,
            );
          },
        );
      },
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
    return FormFieldRegistrant<ProvinceModel>(
      registrarId: '8798e7db-5e6c-4e10-b251-1866c4c2ef9a',
      validator: (value) {
        if (controller.tk1State.provinceOfBirth.value == null) {
          return LocaleKeys.declareInfo_provinceOfBirthCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_provinceOfBirth.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceOfBirth.value,
                    display: (value) => '${value.id} - ${value.name}',
                    onAccept: (value) {
                      if (value == null) return;
                      controller.changeProvinceOfBirth(value);
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.provinceOfBirth.value,
              display: (province) => '${province.id} - ${province.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildSelectDistrict() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '82c2daab-5dbe-47b9-adda-1f04a086a4ed',
      validator: (value) {
        if (controller.tk1State.districtOfBirth.value == null) {
          return LocaleKeys.declareInfo_districtOfBirthCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_districtOfBirth.tr,
              funcSelect: (didChange) async {
                final districtOfBirth =
                    controller.tk1State.provinceOfBirth.value;
                if (districtOfBirth == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceOfBirthNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<DistrictModel>(
                  SelectDistrictBts(
                    provinceCode: districtOfBirth.id,
                    selectedDistrict: controller.tk1State.districtOfBirth.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.changeDistrictOfBirth(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.districtOfBirth.value,
              display: (district) => '${district.id} - ${district.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildSelectWard() {
    return FormFieldRegistrant<WardModel>(
      registrarId: 'b4150241-a388-41bd-af26-a6a4271ad90a',
      validator: (value) {
        if (controller.tk1State.wardOfBirth.value == null) {
          return LocaleKeys.declareInfo_wardOfBirthCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_wardOfBirth.tr,
              funcSelect: (didChange) async {
                final provinceOfBirth =
                    controller.tk1State.provinceOfBirth.value;
                if (provinceOfBirth == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceOfBirthNotSelected.tr);
                  return;
                }

                final districtOfBirth =
                    controller.tk1State.districtOfBirth.value;
                if (districtOfBirth == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_districtOfBirthNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<WardModel>(
                  SelectWardBts(
                    provinceCode: provinceOfBirth.id,
                    districtCode: districtOfBirth.id,
                    selectedWard: controller.tk1State.wardOfBirth.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.changeWardOfBirth(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.wardOfBirth.value,
              display: (ward) => '${ward.id} - ${ward.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildInputAddress() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_birthAddress.tr,
      hintText: LocaleKeys.declareInfo_inputAddress.tr,
      isRequired: false,
      controller: controller.tk1State.birthAddressTextCtrl,
      maxLengthInputForm: 300,
      inputFormatters: InputFormatterEnum.textNormal,
      onChanged: controller.onChangeBirthAddress,
    );
  }

  Widget _buildSelectProvinceReceive() {
    return FormFieldRegistrant<ProvinceModel>(
      registrarId: 'bd81e980-bb2e-404e-bc49-d270d09bcfd6',
      validator: (value) {
        if (controller.tk1State.provinceReceive.value == null) {
          return LocaleKeys.declareInfo_provinceReceiveCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_provinceReceive.tr,
              // hintText: LocaleKeys.declareInfo_selectProvinceReceive.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceReceive.value,
                    display: (value) => '${value.id} - ${value.name}',
                    onAccept: (value) {
                      if (value == null) return;
                      controller.onChangeProvinceReceive(value);
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.provinceReceive.value,
              display: (province) => '${province.id} - ${province.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildSelectDistrictReceive() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '4e29893f-f636-4137-9767-11e4e5b2dba0',
      validator: (value) {
        if (controller.tk1State.districtReceive.value == null) {
          return LocaleKeys.declareInfo_districtReceiveCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_districtReceive.tr,
              // hintText: LocaleKeys.declareInfo_selectDistrictReceive.tr,
              funcSelect: (didChange) async {
                final provinceReceive =
                    controller.tk1State.provinceReceive.value;
                if (provinceReceive == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<DistrictModel>(
                  SelectDistrictBts(
                    provinceCode: provinceReceive.id,
                    selectedDistrict: controller.tk1State.districtReceive.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeDistrictReceive(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.districtReceive.value,
              display: (district) => '${district.id} - ${district.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildSelectWardReceive() {
    return FormFieldRegistrant<WardModel>(
      registrarId: '8e1c9c60-f3e6-472d-80bb-17cde5ac2093',
      validator: (value) {
        if (controller.tk1State.wardReceive.value == null) {
          return LocaleKeys.declareInfo_wardReceiveCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_wardReceive.tr,
              // hintText: LocaleKeys.declareInfo_selectWardReceive.tr,
              funcSelect: (didChange) async {
                final provinceReceive =
                    controller.tk1State.provinceReceive.value;
                if (provinceReceive == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
                  return;
                }

                final districtReceive =
                    controller.tk1State.districtReceive.value;
                if (districtReceive == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_districtReceiveNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<WardModel>(
                  SelectWardBts(
                    provinceCode: provinceReceive.id,
                    districtCode: districtReceive.id,
                    selectedWard: controller.tk1State.wardReceive.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeWardReceive(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.wardReceive.value,
              display: (ward) => '${ward.id} - ${ward.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildInputAddressReceive() {
    return FormFieldRegistrant<String>(
      registrarId: 'c3f0b1d2-4a5e-4c8b-9f6d-7c8e1f3b2a1c',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_addressReceiveCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: LocaleKeys.declareInfo_inputAddress.tr,
          labelText: LocaleKeys.declareInfo_addressReceive.tr,
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          controller: controller.tk1State.addressReceiveTextCtrl,
          maxLengthInputForm: 300,
          onChanged: controller.onChangeAddressReceive,
        );
      },
    );
  }

  Widget _buildSelectProvinceKCB() {
    return FormFieldRegistrant<ProvinceModel>(
      registrarId: '5a875c27-24a8-405e-89c8-155d916bb0ca',
      validator: (value) {
        if (controller.tk1State.provinceKCB.value == null) {
          return LocaleKeys.declareInfo_provinceKCBCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_provinceKCB.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceKCB.value,
                    display: (value) => '${value.id} - ${value.name}',
                    onAccept: (value) {
                      if (value == null) return;
                      controller.onChangeProvinceKCB(value);
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.provinceKCB.value,
              display: (province) => '${province.id} - ${province.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildSelectHospitalKCB() {
    return FormFieldRegistrant<Hospital>(
      registrarId: 'fbccb0ef-18cc-4826-95d5-c5036d368913',
      validator: (value) {
        if (controller.tk1State.hospitalKCB.value == null) {
          return LocaleKeys.declareInfo_hospitalKCBCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<Hospital>(
              fieldKey: fieldKey,
              validator: validator,
              label: LocaleKeys.declareInfo_hospitalKCB.tr,
              funcSelect: (didChange) async {
                final provinceKCB = controller.tk1State.provinceKCB.value;
                if (provinceKCB == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceKCBNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<Hospital>(
                  SelectHospitalBts(
                    provinceCode: provinceKCB.id,
                    selectedHospital: controller.tk1State.hospitalKCB.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.tk1State.hospitalKCB.value = result;
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.hospitalKCB.value,
              display: (hospital) => '${hospital.id} - ${hospital.name}',
            );
          },
        );
      },
    );
  }

  Widget _buildInputPhoneNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_contactPhoneNumber.tr,
      controller: controller.tk1State.contactPhoneNumberTextCtrl,
      textInputType: TextInputType.phone,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.phoneNumber,
    );
  }

  Widget _buildParticipantHeadOfHouseholdCheckbox() {
    return UtilWidget.buildCheckboxWithLabel(
      label: LocaleKeys.declareInfo_participantHeadOfHousehold.tr,
      value: controller.tk1State.isParticipantHeadOfHousehold.value,
      onChanged: controller.onChangeParticipantHeadOfHousehold,
    );
  }

  Widget _buildInputHeadOfHousehold() {
    return FormFieldRegistrant<String>(
      registrarId: 'bcf31692-843c-4d02-94f9-5a3a675e230b',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty &&
            controller.tk1State.isHouseholdInfoRequired.value) {
          return LocaleKeys.declareInfo_headOfHouseholdFullNameCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_headOfHouseholdFullName.tr,
            autovalidateMode: controller.tk1State.autoValidateMode.value,
            isRequired: controller.tk1State.isHouseholdInfoRequired.value,
            controller: controller.tk1State.headOfHouseholdTextCtrl,
            onChanged: controller.onChangeHeadOfHouseholdFullName,
            inputFormatters: InputFormatterEnum.textNormal,
            maxLengthInputForm: 100,
          ),
        );
      },
    );
  }

  Widget _buildInputHeadOfHouseholdCCCD() {
    return FormFieldRegistrant<String>(
      registrarId: '5ef5d7c3-b998-49f0-b29a-9c0cf43c9ada',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty &&
            controller.tk1State.isHouseholdInfoRequired.value) {
          return LocaleKeys.declareInfo_headOfHouseholdCCCDCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            hintText: LocaleKeys.declareInfo_inputHeadOfHouseholdCCCD.tr,
            labelText: LocaleKeys.declareInfo_headOfHouseholdCCCD.tr,
            autovalidateMode: controller.tk1State.autoValidateMode.value,
            isRequired: controller.tk1State.isHouseholdInfoRequired.value,
            controller: controller.tk1State.headOfHouseholdCCCDTextCtrl,
            inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
            onChanged: controller.onChangeHeadOfHouseholdCCCD,
            maxLengthInputForm: 20,
          ),
        );
      },
    );
  }

  Widget _buildSelectProvinceTT() {
    return FormFieldRegistrant<ProvinceModel>(
      registrarId: 'a3146c83-edd7-466c-a3cf-c71e9bc0133f',
      validator: (value) {
        if (controller.tk1State.isHouseholdInfoRequired.value &&
            controller.tk1State.provinceTT.value == null) {
          return LocaleKeys.declareInfo_provinceTTCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_provinceTT.tr,
              // hintText: LocaleKeys.declareInfo_selectProvinceTT.tr,
              isRequired: controller.tk1State.isHouseholdInfoRequired.value,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceTT.value,
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
                    display: (value) => '${value.id} - ${value.name}',
                    onAccept: (value) {
                      if (value == null) return;
                      controller.onChangeProvinceTT(value);
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.provinceTT.value,
              display: (province) => '${province.id} - ${province.name}',
              enableClearIcon: controller.enableClearTTIcon.value,
              onTapClear: controller.onTapClearProvinceTT,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectDistrictTT() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: '7b1c7f5f-b4c7-4f1f-bb8b-acde5bf029ef',
      validator: (value) {
        if (controller.tk1State.isHouseholdInfoRequired.value &&
            controller.tk1State.districtTT.value == null) {
          return LocaleKeys.declareInfo_districtTTCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_districtTT.tr,
              isRequired: controller.tk1State.isHouseholdInfoRequired.value,
              funcSelect: (didChange) async {
                final provinceTT = controller.tk1State.provinceTT.value;
                if (provinceTT == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceTTNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<DistrictModel>(
                  SelectDistrictBts(
                    provinceCode: provinceTT.id,
                    selectedDistrict: controller.tk1State.districtTT.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeDistrictTT(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.districtTT.value,
              display: (district) => '${district.id} - ${district.name}',
              enableClearIcon: controller.enableClearTTIcon.value,
              onTapClear: controller.onTapClearDistrictTT,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectWardTT() {
    return FormFieldRegistrant<WardModel>(
      registrarId: '4fe74ca4-8f53-46ca-acf2-f978568d1519',
      validator: (value) {
        if (controller.tk1State.isHouseholdInfoRequired.value &&
            controller.tk1State.wardTT.value == null) {
          return LocaleKeys.declareInfo_wardTTCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
              fieldKey: fieldKey,
              validator: validator,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_wardTT.tr,
              // hintText: LocaleKeys.declareInfo_selectWardTT.tr,
              isRequired: controller.tk1State.isHouseholdInfoRequired.value,
              funcSelect: (didChange) async {
                final provinceTT = controller.tk1State.provinceTT.value;
                if (provinceTT == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_provinceTTNotSelected.tr);
                  return;
                }

                final districtTT = controller.tk1State.districtTT.value;
                if (districtTT == null) {
                  controller.showSnackBar(
                      LocaleKeys.declareInfo_districtTTNotSelected.tr);
                  return;
                }

                final result = await Get.bottomSheet<WardModel>(
                  SelectWardBts(
                    provinceCode: provinceTT.id,
                    districtCode: districtTT.id,
                    selectedWard: controller.tk1State.wardTT.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeWardTT(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.wardTT.value,
              display: (ward) => '${ward.id} - ${ward.name}',
              enableClearIcon: controller.enableClearTTIcon.value,
              onTapClear: controller.onTapClearWardTT,
            );
          },
        );
      },
    );
  }

  Widget _buildInputAddressTTTextCtrl() {
    return FormFieldRegistrant<String>(
      registrarId: 'c389bcb0-0040-4a9d-bfb1-7aedf2e37e89',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty &&
            controller.tk1State.isHouseholdInfoRequired.value) {
          return LocaleKeys.declareInfo_addressTTCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () => CardInputTextFormWithLabel(
            fieldKey: fieldKey,
            validator: validator,
            labelText: LocaleKeys.declareInfo_addressTT.tr,
            hintText: LocaleKeys.declareInfo_inputAddress.tr,
            autovalidateMode: controller.tk1State.autoValidateMode.value,
            isRequired: controller.tk1State.isHouseholdInfoRequired.value,
            controller: controller.tk1State.addressTTTextCtrl,
            inputFormatters: InputFormatterEnum.textNormal,
            onChanged: controller.onChangeAddressTT,
            maxLengthInputForm: 300,
            textInputAction: TextInputAction.done,
          ),
        );
      },
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
        controller.tk1State.familyMembers.isNotEmpty
            ? Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppDimens.paddingSmall,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.dsGray4,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: addSeparator(
                    spacer: const Divider(
                      height: 1,
                    ),
                    children: controller.tk1State.familyMembers.map(
                      (member) {
                        return _buildFamilyMemberItem(member);
                      },
                    ).toList(),
                  ),
                ),
              )
            : UtilWidget.sizedBox8,
        _buildFamilyMemberError(),
        InkWell(
          onTap: controller.addFamilyMember,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.basicWhite,
                  size: AppDimens.sizeIcon28,
                ),
              ),
              sdsSBWidth12,
              SDSBuildText(
                LocaleKeys.declareInfo_addFamilyMember.tr,
                style: AppTextStyle.font16Re.copyWith(color: AppColors.dsGray1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFamilyMemberError() {
    return FormFieldRegistrant<String>(
      registrarId: '2c183525-5aae-44ad-91f2-78d08e14caf1',
      validator: (value) {
        if (controller.tk1State.familyMembers.isEmpty &&
            controller.d02Tk1State.bhxhTextCtrl.text.trim().isEmpty) {
          return 'Vui lòng thêm thành viên gia đình';
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return FormField<String>(
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              key: fieldKey,
              validator: validator,
              builder: (FormFieldState<String> state) {
                final hasError = state.hasError;

                if (!hasError) {
                  return const SizedBox.shrink();
                }

                return SDSBuildText(
                  state.errorText ?? '',
                  maxLines: 2,
                  style: AppTextStyle.font12Re.copyWith(
                    color: AppColors.statusRed,
                  ),
                ).paddingOnly(
                  bottom: AppDimens.paddingSmall,
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFamilyMemberItem(FamilyMember member) {
    return InkWell(
      onTap: () {
        controller.editFamilyMember(member);
      },
      child: Row(
        children: [
          sdsSBWidth12,
          Expanded(
            child: SDSBuildText(
              '${member.fullName} - ${member.relationship?.text ?? ''}',
              style: AppTextStyle.font16Re,
            ),
          ),
          IconButton(
            onPressed: () {
              ShowDialog.showDialogConfirm2(
                backgroundColorBack: AppColors.basicWhite,
                textStyleBack: AppTextStyle.font14Re
                    .copyWith(color: AppColors.primaryColor),
                title: LocaleKeys.declareInfo_deleteSelectedMember.tr,
                confirmTitle: LocaleKeys.declareInfo_delete.tr,
                onConfirm: () {
                  controller.deleteFamilyMember(member);
                },
              );
            },
            icon: const Icon(
              Icons.clear,
              color: AppColors.statusRed,
            ),
          ),
        ],
      ),
    );
  }
}
