part of 'declare_info_607_page.dart';

extension Tk1Tab607Widget on DeclareInfo607Page {
  Widget _buildTk1TabBody() {
    return Obx(
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
                    _buildCheckboxDuplicateBirthAddress()
                        .paddingSymmetric(vertical: AppDimens.paddingVerySmall),

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
                        .paddingSymmetric(vertical: AppDimens.paddingVerySmall),

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardInputTextFormWithLabel(
          labelText: LocaleKeys.declareInfo_fullName.tr,
          controller: controller.tk1State.fullNameTextCtrl,
          isRequired: true,
          maxLengthInputForm: 100,
          onChanged: controller.onChangeFullName,
          validator: (value) {
            final trimmedValue = value?.trim();

            if (trimmedValue == null || trimmedValue.isEmpty) {
              return LocaleKeys.declareInfo_fullNameCannotEmpty.tr;
            }

            return null;
          },
        )
      ],
    );
  }

  Widget _buildInputBHXHCode() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_bhxhCode.tr,
      controller: controller.tk1State.bhxhTextCtrl,
      maxLengthInputForm: 10,
      inputFormatters: InputFormatterEnum.digitsOnly,
      textInputType: TextInputType.number,
      onChanged: (value) {
        controller.updateHouseholdInfoRequired();
      },
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
    );
  }

  Widget _buildInputCCCD() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_cccdNumber.tr,
      autovalidateMode: controller.autovalidateMode.value,
      controller: controller.tk1State.cccdTextCtrl,
      hintText: LocaleKeys.declareInfo_inputCCCD.tr,
      isRequired: true,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
      onChanged: controller.onChangeCCCD,
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_cccdNumberIsNotEmpty.tr;
        }

        return null;
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
    return CardInputSelectDateWithLabel(
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
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.tk1State.dateOfBirthTextCtrl.text,
                      PATTERN_13) ??
                  DateTime.now(),
              onlyYear: true,
            );
            break;
          case BirthTypeEnum.monthYear:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.tk1State.dateOfBirthTextCtrl.text,
                      PATTERN_12) ??
                  DateTime.now(),
            );
            break;
          case BirthTypeEnum.full:
            selectedDate = await UtilWidget.showDateTimePicker(
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
    );
  }

  Widget _buildSelectGender() {
    return CardDropdownWithLabel<Gender>(
      key: ValueKey(controller.tk1State.gender.value),
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
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<EthnicModel>(
          label: LocaleKeys.declareInfo_ethnic.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<EthnicModel>(
                title: LocaleKeys.declareInfo_ethnic.tr,
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
          validator: (value) {
            if (controller.tk1State.selectedEthnic.value == null) {
              return LocaleKeys.declareInfo_ethnicCannotEmpty.tr;
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
          label: LocaleKeys.declareInfo_nationality.tr,
          // hintText: LocaleKeys.declareInfo_selectNationality.tr,
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
          validator: (value) {
            if (controller.tk1State.selectedNationality.value == null) {
              return LocaleKeys.declareInfo_nationalityCannotEmpty.tr;
            }
            return null;
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
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
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
          validator: (value) {
            if (controller.tk1State.provinceOfBirth.value == null) {
              return LocaleKeys.declareInfo_provinceOfBirthCannotEmpty.tr;
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
          label: LocaleKeys.declareInfo_districtOfBirth.tr,
          // hintText: LocaleKeys.declareInfo_selectDistrictOfBirth.tr,
          funcSelect: (didChange) async {
            final districtOfBirth = controller.tk1State.provinceOfBirth.value;
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
          validator: (value) {
            if (controller.tk1State.districtOfBirth.value == null) {
              return LocaleKeys.declareInfo_districtOfBirthCannotEmpty.tr;
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
          label: LocaleKeys.declareInfo_wardOfBirth.tr,
          // hintText: LocaleKeys.declareInfo_selectWardOfBirth.tr,
          funcSelect: (didChange) async {
            final provinceOfBirth = controller.tk1State.provinceOfBirth.value;
            if (provinceOfBirth == null) {
              controller.showSnackBar(
                  LocaleKeys.declareInfo_provinceOfBirthNotSelected.tr);
              return;
            }

            final districtOfBirth = controller.tk1State.districtOfBirth.value;
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
          validator: (value) {
            if (controller.tk1State.wardOfBirth.value == null) {
              return LocaleKeys.declareInfo_wardOfBirthCannotEmpty.tr;
            }
            return null;
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
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
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
          validator: (value) {
            if (controller.tk1State.provinceReceive.value == null) {
              return LocaleKeys.declareInfo_provinceReceiveCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectDistrictReceive() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          label: LocaleKeys.declareInfo_districtReceive.tr,
          // hintText: LocaleKeys.declareInfo_selectDistrictReceive.tr,
          funcSelect: (didChange) async {
            final provinceReceive = controller.tk1State.provinceReceive.value;
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
          validator: (value) {
            if (controller.tk1State.districtReceive.value == null) {
              return LocaleKeys.declareInfo_districtReceiveCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectWardReceive() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          label: LocaleKeys.declareInfo_wardReceive.tr,
          // hintText: LocaleKeys.declareInfo_selectWardReceive.tr,
          funcSelect: (didChange) async {
            final provinceReceive = controller.tk1State.provinceReceive.value;
            if (provinceReceive == null) {
              controller.showSnackBar(
                  LocaleKeys.declareInfo_provinceReceiveNotSelected.tr);
              return;
            }

            final districtReceive = controller.tk1State.districtReceive.value;
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
          validator: (value) {
            if (controller.tk1State.wardReceive.value == null) {
              return LocaleKeys.declareInfo_wardReceiveCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputAddressReceive() {
    return CardInputTextFormWithLabel(
      hintText: LocaleKeys.declareInfo_inputAddress.tr,
      labelText: LocaleKeys.declareInfo_addressReceive.tr,
      autovalidateMode: controller.tk1State.autoValidateMode.value,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      controller: controller.tk1State.addressReceiveTextCtrl,
      maxLengthInputForm: 300,
      onChanged: controller.onChangeAddressReceive,
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_addressReceiveCannotEmpty.tr;
        }

        return null;
      },
    );
  }

  Widget _buildSelectProvinceKCB() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
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
          validator: (value) {
            if (controller.tk1State.provinceKCB.value == null) {
              return LocaleKeys.declareInfo_provinceKCBCannotEmpty.tr;
            }
            return null;
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
      onChanged: (value) {
        if (value != null) {
          controller.onChangeReceiveResult(value);
        }
      },
    );
  }

  /// Tỉnh nhận hồ sơ giấy
  Widget _buildSelectProvinceReceivePaper() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
          enable: controller.tk1State.receiveResult.value ==
              ReceiveProfileResultEnum.paper,
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          label: LocaleKeys.declareInfo_provinceReceivePaper.tr,
          isRequired: false,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<ProvinceModel>(
                maxLength: 20,
                title: LocaleKeys.declareInfo_selectProvince.tr,
                listFilter: AppData.instance.provinces.toList(),
                selectedItem: controller.tk1State.provinceReceivePaper.value,
                display: (value) => value.name,
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
          display: (province) => province.name,
          enableClearIcon: true,
          onTapClear: controller.onTapClearProvinceReceivePaper,
          // validator: (value) {
          //   if (controller.tk1State.isHouseholdInfoRequired.value &&
          //       controller.tk1State.provinceTT.value == null) {
          //     return LocaleKeys.declareInfo_provinceTTCannotEmpty.tr;
          //   }
          //   return null;
          // },
        );
      },
    );
  }

  Widget _buildSelectDistrictReceivePaper() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
          enable: controller.tk1State.receiveResult.value ==
              ReceiveProfileResultEnum.paper,
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          label: LocaleKeys.declareInfo_districtReceivePaper.tr,
          // hintText: LocaleKeys.declareInfo_selectDistrictTT.tr,
          isRequired: false,
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
          display: (district) => district.name,
          enableClearIcon: true,
          onTapClear: controller.onTapClearDistrictReceivePaper,
          // validator: (value) {
          //   if (controller.tk1State.isHouseholdInfoRequired.value &&
          //       controller.tk1State.wardTT.value == null) {
          //     return LocaleKeys.declareInfo_districtTTCannotEmpty.tr;
          //   }
          //   return null;
          // },
        );
      },
    );
  }

  Widget _buildSelectWardReceivePaper() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
          enable: controller.tk1State.receiveResult.value ==
              ReceiveProfileResultEnum.paper,
          autovalidateMode: controller.tk1State.autoValidateMode.value,
          label: LocaleKeys.declareInfo_wardReceivePaper.tr,
          isRequired: false,
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
          display: (ward) => ward.name,
          enableClearIcon: true,
          onTapClear: controller.onTapClearWardReceivePaper,
          // validator: (value) {
          //   if (controller.tk1State.isHouseholdInfoRequired.value &&
          //       controller.tk1State.wardTT.value == null) {
          //     return LocaleKeys.declareInfo_wardTTCannotEmpty.tr;
          //   }
          //   return null;
          // },
        );
      },
    );
  }

  Widget _buildInputAddressReceivePaper() {
    return Obx(
      () => CardInputTextFormWithLabel(
        enable: controller.tk1State.receiveResult.value ==
            ReceiveProfileResultEnum.paper,
        labelText: LocaleKeys.declareInfo_addressReceivePaper.tr,
        hintText: LocaleKeys.declareInfo_inputAddress.tr,
        autovalidateMode: controller.tk1State.autoValidateMode.value,
        isRequired: false,
        controller: controller.tk1State.addressReceivePaperTextCtrl,
        inputFormatters: InputFormatterEnum.textNormal,
        // onChanged: controller.onChangeAddressTT,
        maxLengthInputForm: 500,
        // validator: (value) {
        //   final trimmedValue = value?.trim();

        //   if (trimmedValue == null || trimmedValue.isEmpty) {
        //     return LocaleKeys.declareInfo_addressTTCannotEmpty.tr;
        //   }

        //   return null;
        // },
      ),
    );
  }

  Widget _buildSelectHospitalKCB() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<Hospital>(
          label: LocaleKeys.declareInfo_hospitalKCB.tr,
          // hintText: LocaleKeys.declareInfo_selectHospitalKCB.tr,
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
          validator: (value) {
            if (controller.tk1State.hospitalKCB.value == null) {
              return LocaleKeys.declareInfo_hospitalKCBCannotEmpty.tr;
            }
            return null;
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
    return Obx(
      () => CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_headOfHouseholdFullName.tr,
        autovalidateMode: controller.tk1State.autoValidateMode.value,
        isRequired: controller.tk1State.isHouseholdInfoRequired.value,
        controller: controller.tk1State.headOfHouseholdTextCtrl,
        onChanged: controller.onChangeHeadOfHouseholdFullName,
        inputFormatters: InputFormatterEnum.textNormal,
        maxLengthInputForm: 100,
        validator: (value) {
          final trimmedValue = value?.trim();

          if (trimmedValue == null ||
              trimmedValue.isEmpty &&
                  controller.tk1State.isHouseholdInfoRequired.value) {
            return LocaleKeys.declareInfo_headOfHouseholdFullNameCannotEmpty.tr;
          }

          return null;
        },
      ),
    );
  }

  Widget _buildInputHeadOfHouseholdCCCD() {
    return Obx(
      () => CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_headOfHouseholdCCCD.tr,
        autovalidateMode: controller.tk1State.autoValidateMode.value,
        isRequired: controller.tk1State.isHouseholdInfoRequired.value,
        controller: controller.tk1State.headOfHouseholdCCCDTextCtrl,
        inputFormatters: InputFormatterEnum.textNormal,
        onChanged: controller.onChangeHeadOfHouseholdCCCD,
        maxLengthInputForm: 20,
        validator: (value) {
          final trimmedValue = value?.trim();

          if (trimmedValue == null ||
              trimmedValue.isEmpty &&
                  controller.tk1State.isHouseholdInfoRequired.value) {
            return LocaleKeys.declareInfo_headOfHouseholdCCCDCannotEmpty.tr;
          }

          return null;
        },
      ),
    );
  }

  Widget _buildSelectProvinceTT() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<ProvinceModel>(
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
          validator: (value) {
            if (controller.tk1State.isHouseholdInfoRequired.value &&
                controller.tk1State.provinceTT.value == null) {
              return LocaleKeys.declareInfo_provinceTTCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectDistrictTT() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<DistrictModel>(
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
          validator: (value) {
            if (controller.tk1State.isHouseholdInfoRequired.value &&
                controller.tk1State.districtTT.value == null) {
              return LocaleKeys.declareInfo_districtTTCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectWardTT() {
    return Obx(
      () {
        return UtilWidget.buildCardBottomSheetSelect2<WardModel>(
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
          validator: (value) {
            if (controller.tk1State.isHouseholdInfoRequired.value &&
                controller.tk1State.wardTT.value == null) {
              return LocaleKeys.declareInfo_wardTTCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputAddressTTTextCtrl() {
    return Obx(
      () => CardInputTextFormWithLabel(
        labelText: LocaleKeys.declareInfo_addressTT.tr,
        hintText: LocaleKeys.declareInfo_inputAddress.tr,
        autovalidateMode: controller.tk1State.autoValidateMode.value,
        isRequired: controller.tk1State.isHouseholdInfoRequired.value,
        controller: controller.tk1State.addressTTTextCtrl,
        inputFormatters: InputFormatterEnum.textNormal,
        onChanged: controller.onChangeAddressTT,
        maxLengthInputForm: 300,
        validator: (value) {
          final trimmedValue = value?.trim();

          if (trimmedValue == null ||
              trimmedValue.isEmpty &&
                  controller.tk1State.isHouseholdInfoRequired.value) {
            return LocaleKeys.declareInfo_addressTTCannotEmpty.tr;
          }

          return null;
        },
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
