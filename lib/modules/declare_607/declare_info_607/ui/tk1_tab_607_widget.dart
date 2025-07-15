part of 'declare_info_607_page.dart';

extension Tk1Tab607Widget on DeclareInfo607Page {
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
                      _buildInputFullName(),
                      sdsSBHeight12,

                      //Mã số BHXH
                      _buildInputBHXHCode(),
                      sdsSBHeight12,

                      //Số CCCD
                      _buildInputCCCD(),
                      sdsSBHeight12,

                      //Loại ngày sinh
                      _buildBirthTypeDropdown(),
                      sdsSBHeight12,

                      //Ngày sinh và giới tính
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildSelectDateOfBirth()),
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
                      sdsSBHeight12,

                      //Tỉnh nơi khám chữa bệnh
                      _buildSelectProvinceKCB(),

                      //Bệnh viện nơi khám chữa bệnh
                      _buildSelectHospitalKCB(),

                      // Thông tin hồ sơ
                      _buildProfileInfo(),
                      sdsSBHeight12,

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
                      UtilWidget.buildCheckboxWithLabel(
                        label: LocaleKeys.declareInfo_generateD01tsData.tr,
                        value: controller.tk1State.isGenerateD01Data.value,
                        onChanged: (value) {
                          controller.tk1State.isGenerateD01Data.value = value;
                        },
                      ),
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
          onPressed: controller.goToSelectStaffPage,
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

  Widget _buildInputFullName() {
    return FormFieldRegistrant<String>(
      registrarId: "6e83bc1b-b6bb-4fc9-8f3a-b191b0cfee47",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_fullNameCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_fullName.tr,
          controller: controller.tk1State.fullNameTextCtrl,
          isRequired: true,
          maxLengthInputForm: 100,
          onChanged: controller.onChangeFullName,
        );
      },
    );
  }

  Widget _buildInputBHXHCode() {
    return FormFieldRegistrant<String>(
      registrarId: "944707c5-8ddf-48d5-9113-25fd66e7e9b5",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declareInfo_bhxhCodeInValid.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_bhxhCode.tr,
          controller: controller.tk1State.bhxhTextCtrl,
          maxLengthInputForm: 10,
          hintText: LocaleKeys.declareInfo_inputBhxhCode.tr,
          inputFormatters: InputFormatterEnum.digitsOnly,
          textInputType: TextInputType.number,
          onChanged: (value) {
            controller.updateHouseholdInfoRequired();
          },
        );
      },
    );
  }

  Widget _buildInputCCCD() {
    return FormFieldRegistrant<String>(
      registrarId: "65ae4c88-428a-4851-9a0f-b8791754ebd8",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_cccdNumberIsNotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_cccdNumber.tr,
          autovalidateMode: controller.autovalidateMode.value,
          controller: controller.tk1State.cccdTextCtrl,
          hintText: LocaleKeys.declareInfo_inputCCCD.tr,
          isRequired: true,
          maxLengthInputForm: 20,
          inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
          onChanged: controller.onChangeCCCD,
        );
      },
    );
  }

  Widget _buildBirthTypeDropdown() {
    return CardDropdownWithLabel<BirthTypeEnum>(
      labelText: LocaleKeys.familyMember_selectBirthType.tr,
      isRequired: true,
      hintText: LocaleKeys.familyMember_selectBirthTypeHint.tr,
      items: BirthTypeEnum.values,
      display: (item) => item.title,
      selectedItem: controller.tk1State.birthType.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.tk1State.dateOfBirthTextCtrl.clear();
        controller.tk1State.birthType.value = value;
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return FormFieldRegistrant<String>(
      registrarId: "2bbe6dda-86d3-4d02-9204-ee6807a3e9b6",
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_dobCannotEmpty.tr;
        }
        switch (controller.tk1State.birthType.value) {
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
          trimmedValue,
          controller.tk1State.birthType.value.pattern,
        );

        if (date == null) {
          return LocaleKeys.declareInfo_dobInvalid.tr;
        }
        // Chỉ được nhập từ năm 1900
        if (date.year <= 1900) {
          return LocaleKeys.declareInfo_dobInvalid.tr;
        }
        if (date.isAfter(DateTime.now())) {
          return LocaleKeys.declareInfo_dobCannotFuture.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          validator: validator,
          fieldKey: fieldKey,
          labelText: LocaleKeys.declareInfo_dob.tr,
          isRequired: true,
          borderRadius: AppDimens.radius10,
          controller: controller.tk1State.dateOfBirthTextCtrl,
          hintText: controller.tk1State.birthType.value.pattern,
          inputFormatters: controller.tk1State.birthType.value.inputFormatter,
          onSelectDate: () async {
            KeyBoard.hide();
            final DateTime? selectedDate;

            switch (controller.tk1State.birthType.value) {
              case BirthTypeEnum.year:
                selectedDate = await DatePickerUtils.showCalendarPicker(
                  title: LocaleKeys.dialog_selectYear.tr,
                  dateFormat: PATTERN_13,
                  dateTimeInit: convertStringToDateSafe(
                          controller.tk1State.dateOfBirthTextCtrl.text,
                          PATTERN_13) ??
                      DateTime.now(),
                );
                break;
              case BirthTypeEnum.monthYear:
                selectedDate = await DatePickerUtils.showCalendarPicker(
                  title: LocaleKeys.dialog_selectMonthYear.tr,
                  dateFormat: PATTERN_12,
                  dateTimeInit: convertStringToDateSafe(
                          controller.tk1State.dateOfBirthTextCtrl.text,
                          PATTERN_12) ??
                      DateTime.now(),
                );
                break;
              case BirthTypeEnum.full:
                selectedDate = await DatePickerUtils.showCalendarPicker(
                  title: LocaleKeys.dialog_selectDayMonthYear.tr,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding32,
                  ),
                  dateFormat: PATTERN_1,
                  dateTimeInit: convertStringToDateSafe(
                          controller.tk1State.dateOfBirthTextCtrl.text,
                          PATTERN_1) ??
                      DateTime.now(),
                );
                break;
            }
            if (selectedDate != null) {
              controller.tk1State.dateOfBirthTextCtrl.text =
                  convertDateToStringSafe(
                        selectedDate,
                        controller.tk1State.birthType.value.pattern,
                      ) ??
                      '';
            }
          },
        );
      },
    );
  }

  Widget _buildSelectGender() {
    return CardDropdownWithLabel<Gender>(
      labelText: LocaleKeys.declareInfo_gender.tr,
      items: Gender.values,
      display: (item) => item.title,
      autovalidateMode: controller.autovalidateMode.value,
      isRequired: true,
      selectedItem: controller.tk1State.gender.value,
      onChanged: (value) {
        if (value != null) {
          controller.tk1State.gender.value = value;
        }
      },
    );
  }

  Widget _buildSelectEthnic() {
    return FormFieldRegistrant<EthnicModel>(
      registrarId: 'f4bf206f-a1c2-42a4-a163-048713c50082',
      validator: (value) {
        if (controller.tk1State.selectedEthnic.value == null) {
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
                    listFilter: AppData.instance.ethnics.toList(),
                    selectedItem: controller.tk1State.selectedEthnic.value,
                    display: (value) => value.text,
                    onAccept: (value) {
                      if (value == null) return;
                      controller.tk1State.selectedEthnic.value = value;
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.selectedEthnic.value,
              display: (ethnic) => ethnic.text,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectNationality() {
    return FormFieldRegistrant<NationModel>(
      registrarId: '97f3fc63-77eb-4de0-8b3f-b8e66ac58963',
      validator: (value) {
        if (controller.tk1State.selectedNationality.value == null) {
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
                    listFilter: AppData.instance.nations.toList(),
                    selectedItem: controller.tk1State.selectedNationality.value,
                    display: (value) => value.text,
                    onAccept: (value) {
                      if (value == null) return;
                      controller.tk1State.selectedNationality.value = value;
                      didChange(value);
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              selectedItem: controller.tk1State.selectedNationality.value,
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
      registrarId: '154c0b4c-d696-4997-81b5-541c10fea486',
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
              // hintText: LocaleKeys.declareInfo_selectProvinceOfBirth.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceOfBirth.value,
                    display: (value) => '${value.id} - ${value.name}',
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
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
      registrarId: 'f3b96333-610d-4bda-9081-6f843344439e',
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
              // hintText: LocaleKeys.declareInfo_selectDistrictOfBirth.tr,
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
      registrarId: '97cc0bcb-a423-4f90-9d54-b99754230075',
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
              // hintText: LocaleKeys.declareInfo_selectWardOfBirth.tr,
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
      registrarId: 'b615bb4f-a1ac-4f28-aa39-44530c7845f3',
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
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceReceive.value,
                    display: (value) => '${value.id} - ${value.name}',
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
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
      registrarId: '507641c2-8f74-4bc4-b143-692a37dfa33a',
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
      registrarId: '81de63f5-e93b-48bd-8bec-e6b93dd2481b',
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
      registrarId: '2bae4bf8-f958-47da-8906-2ee1722a3490',
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
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
      registrarId: '40420b9a-4cc6-429c-b28d-6de0a6f48f5a',
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
              // hintText: LocaleKeys.declareInfo_selectProvinceKCB.tr,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceKCB.value,
                    display: (value) => '${value.id} - ${value.name}',
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
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

  /// Thông tin hồ sơ
  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SDSBuildText(
          LocaleKeys.declareInfo_profileInfo.tr,
          style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorBlack),
        ),
        sdsSBHeight12,
        _buildContentChanges(),
        sdsSBHeight12,
        _buildAttachedProfile(),
        sdsSBHeight12,
        _buildSelectReceiveResult(),
        sdsSBHeight12,
        _buildSelectProvinceReceivePaper(),
        _buildSelectDistrictReceivePaper(),
        _buildSelectWardReceivePaper(),
        _buildInputAddressReceivePaper(),
      ],
    );
  }

  /// Nội dung thay đổi
  Widget _buildContentChanges() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_contentChanges.tr,
      hintText: LocaleKeys.declareInfo_enterContentChanges.tr,
      isRequired: false,
      controller: controller.tk1State.contentChangesTextCtrl,
      maxLengthInputForm: 500,
      inputFormatters: InputFormatterEnum.textNormal,
    );
  }

  /// Hồ sơ kèm theo
  Widget _buildAttachedProfile() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_attachedProfile.tr,
      hintText: LocaleKeys.declareInfo_enterAttachedProfile.tr,
      isRequired: false,
      controller: controller.tk1State.attachedProfileTextCtrl,
      maxLengthInputForm: 500,
      inputFormatters: InputFormatterEnum.textNormal,
    );
  }

  /// Nhận kết quả hồ sơ
  Widget _buildSelectReceiveResult() {
    return CardDropdownWithLabel<ReceiveProfileResultEnum>(
      key: ValueKey(controller.tk1State.receiveResult.value),
      labelText: LocaleKeys.declareInfo_receiveProfileResult.tr,
      items: ReceiveProfileResultEnum.values,
      display: (item) => item.title,
      autovalidateMode: controller.autovalidateMode.value,
      isRequired: true,
      selectedItem: controller.tk1State.receiveResult.value,
      onTap: () {
        KeyBoard.hide();
      },
      onChanged: (value) {
        if (value != null) {
          controller.onChangeReceiveResult(value);
        }
      },
    );
  }

  /// Tỉnh nhận hồ sơ giấy
  Widget _buildSelectProvinceReceivePaper() {
    return FormFieldRegistrant<ProvinceModel>(
        registrarId: '4984a598-6ace-4d8d-acf7-353caa1ce9ef',
        validator: (value) {
          final isRequired = controller.tk1State.receiveResult.value ==
              ReceiveProfileResultEnum.paper;
          if (isRequired &&
              controller.tk1State.provinceReceivePaper.value == null) {
            return LocaleKeys.declareInfo_provinceReceivePaperCannotEmpty.tr;
          }
          return null;
        },
        builder: (fieldKey, validator) {
          return Obx(
            () {
              final isRequired = controller.tk1State.receiveResult.value ==
                  ReceiveProfileResultEnum.paper;
              return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
                fieldKey: fieldKey,
                validator: validator,
                enable: controller.tk1State.receiveResult.value ==
                    ReceiveProfileResultEnum.paper,
                autovalidateMode: controller.tk1State.autoValidateMode.value,
                label: LocaleKeys.declareInfo_provinceReceivePaper.tr,
                isRequired: isRequired,
                funcSelect: (didChange) {
                  Get.bottomSheet(
                    BottomSheetSearch<ProvinceModel>(
                      maxLength: 20,
                      title: LocaleKeys.declareInfo_selectProvince.tr,
                      listFilter: AppData.instance.provinces.toList(),
                      selectedItem:
                          controller.tk1State.provinceReceivePaper.value,
                      display: (value) => '${value.id} - ${value.name}',
                      hintText: LocaleKeys.declareInfo_inputProvince.tr,
                      onAccept: (value) {
                        if (value == null) return;
                        controller.onChangeProvinceReceivePaper(value);
                        didChange(value);
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
                selectedItem: controller.tk1State.provinceReceivePaper.value,
                display: (province) => '${province.id} - ${province.name}',
                enableClearIcon: true,
                onTapClear: controller.onTapClearProvinceReceivePaper,
              );
            },
          );
        });
  }

  Widget _buildSelectDistrictReceivePaper() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: 'ec90fe82-9080-4d37-9326-f39664e59924',
      validator: (value) {
        final isRequired = controller.tk1State.receiveResult.value ==
            ReceiveProfileResultEnum.paper;
        if (isRequired &&
            controller.tk1State.districtReceivePaper.value == null) {
          return LocaleKeys.declareInfo_districtReceivePaperCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            final isRequired = controller.tk1State.receiveResult.value ==
                ReceiveProfileResultEnum.paper;
            return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
              fieldKey: fieldKey,
              validator: validator,
              enable: isRequired,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_districtReceivePaper.tr,
              isRequired: isRequired,
              funcSelect: (didChange) async {
                final provinceReceivePaper =
                    controller.tk1State.provinceReceivePaper.value;
                if (provinceReceivePaper == null) {
                  controller.showSnackBar('Chưa chọn tỉnh nhận hồ sơ giấy');
                  return;
                }

                final result = await Get.bottomSheet<DistrictModel>(
                  SelectDistrictBts(
                    provinceCode: provinceReceivePaper.id,
                    selectedDistrict:
                        controller.tk1State.districtReceivePaper.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeDistrictReceivePaper(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.districtReceivePaper.value,
              display: (district) => '${district.id} - ${district.name}',
              enableClearIcon: true,
              onTapClear: controller.onTapClearDistrictReceivePaper,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectWardReceivePaper() {
    return FormFieldRegistrant<WardModel>(
      registrarId: '7a781b3c-a304-4090-af73-ff6f1ad6da9a',
      validator: (value) {
        final isRequired = controller.tk1State.receiveResult.value ==
            ReceiveProfileResultEnum.paper;
        if (isRequired && controller.tk1State.wardReceivePaper.value == null) {
          return LocaleKeys.declareInfo_wardReceivePaperCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            final isRequired = controller.tk1State.receiveResult.value ==
                ReceiveProfileResultEnum.paper;
            return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
              fieldKey: fieldKey,
              validator: validator,
              enable: isRequired,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              label: LocaleKeys.declareInfo_wardReceivePaper.tr,
              isRequired: isRequired,
              funcSelect: (didChange) async {
                final provinceReceivePaper =
                    controller.tk1State.provinceReceivePaper.value;
                if (provinceReceivePaper == null) {
                  controller.showSnackBar('Chưa chọn tỉnh nhận hồ sơ giấy');
                  return;
                }

                final districtReceivePaper =
                    controller.tk1State.districtReceivePaper.value;
                if (districtReceivePaper == null) {
                  controller.showSnackBar('Chưa chọn huyện nhận hồ sơ giấy');
                  return;
                }

                final result = await Get.bottomSheet<WardModel>(
                  SelectWardBts(
                    provinceCode: provinceReceivePaper.id,
                    districtCode: districtReceivePaper.id,
                    selectedWard: controller.tk1State.wardReceivePaper.value,
                  ),
                  isScrollControlled: true,
                );

                if (result != null) {
                  controller.onChangeWardReceivePaper(result);
                  didChange(result);
                }
              },
              selectedItem: controller.tk1State.wardReceivePaper.value,
              display: (ward) => '${ward.id} - ${ward.name}',
              enableClearIcon: true,
              onTapClear: controller.onTapClearWardReceivePaper,
            );
          },
        );
      },
    );
  }

  Widget _buildInputAddressReceivePaper() {
    return FormFieldRegistrant<String>(
      registrarId: '76125ef9-f3a6-46c1-a1f7-6f2f9efad68d',
      validator: (value) {
        final isRequired = controller.tk1State.receiveResult.value ==
            ReceiveProfileResultEnum.paper;
        final trimmedValue = value?.trim() ?? '';

        if (isRequired && trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_addressReceivePaperCannotEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            final isRequired = controller.tk1State.receiveResult.value ==
                ReceiveProfileResultEnum.paper;
            return CardInputTextFormWithLabel(
              fieldKey: fieldKey,
              validator: validator,
              enable: isRequired,
              labelText: LocaleKeys.declareInfo_addressReceivePaper.tr,
              hintText: LocaleKeys.declareInfo_inputAddress.tr,
              autovalidateMode: controller.tk1State.autoValidateMode.value,
              isRequired: isRequired,
              controller: controller.tk1State.addressReceivePaperTextCtrl,
              inputFormatters: InputFormatterEnum.textNormal,
              // onChanged: controller.onChangeAddressTT,
              maxLengthInputForm: 500,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectHospitalKCB() {
    return FormFieldRegistrant<Hospital>(
      registrarId: 'bdf41461-020c-402c-919b-c2a0a9dae979',
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
      registrarId: '13be6695-a88e-4bc6-b7a1-047d10ca96d7',
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
      registrarId: '73948aab-235c-410a-8026-ec45d723760e',
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
      registrarId: 'c00b9ed3-47be-467c-8f9e-b3eda58af38e',
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
              isRequired: controller.tk1State.isHouseholdInfoRequired.value,
              funcSelect: (didChange) {
                Get.bottomSheet(
                  BottomSheetSearch<ProvinceModel>(
                    maxLength: 20,
                    title: LocaleKeys.declareInfo_selectProvince.tr,
                    listFilter: AppData.instance.provinces.toList(),
                    selectedItem: controller.tk1State.provinceTT.value,
                    display: (value) => '${value.id} - ${value.name}',
                    hintText: LocaleKeys.declareInfo_inputProvince.tr,
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
              enableClearIcon: true,
              onTapClear: controller.onTapClearProvinceTT,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectDistrictTT() {
    return FormFieldRegistrant<DistrictModel>(
      registrarId: 'a35c3a81-220f-42c4-afb7-de557a04261e',
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
              enableClearIcon: true,
              onTapClear: controller.onTapClearDistrictTT,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectWardTT() {
    return FormFieldRegistrant<WardModel>(
      registrarId: 'abe5f5fe-6937-4454-b1ac-d831586d565c',
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
              enableClearIcon: true,
              onTapClear: controller.onTapClearWardTT,
            );
          },
        );
      },
    );
  }

  Widget _buildInputAddressTTTextCtrl() {
    return FormFieldRegistrant<String>(
      registrarId: '80a81617-1e78-42df-a93a-a8aed2e74313',
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
                title: LocaleKeys.declareInfo_deleteSelectedMember.tr,
                confirmTitle: LocaleKeys.declareInfo_delete.tr,
                backgroundColorBack: AppColors.basicWhite,
                textStyleBack: AppTextStyle.font14Re
                    .copyWith(color: AppColors.primaryColor),
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
