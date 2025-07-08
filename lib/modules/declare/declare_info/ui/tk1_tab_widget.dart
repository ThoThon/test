part of 'declare_info_page.dart';

extension Tk1TabWidget on DeclareInfoPage {
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
                display: (value) => value.name,
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
          display: (province) => province.name,
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
          display: (district) => district.name,
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
          display: (ward) => ward.name,
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
      isRequired: true,
      controller: controller.tk1State.birthAddressTextCtrl,
      maxLengthInputForm: 300,
      inputFormatters: InputFormatterEnum.textNormal,
      onChanged: controller.onChangeBirthAddress,
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_birthAddressCannotEmpty.tr;
        }

        return null;
      },
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
                display: (value) => value.name,
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
          display: (province) => province.name,
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
          display: (district) => district.name,
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
          display: (ward) => ward.name,
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
                display: (value) => value.name,
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
          display: (province) => province.name,
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
          display: (hospital) => hospital.name,
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
          // hintText: LocaleKeys.declareInfo_selectProvinceTT.tr,
          isRequired: controller.tk1State.isHouseholdInfoRequired.value,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<ProvinceModel>(
                maxLength: 20,
                title: LocaleKeys.declareInfo_selectProvince.tr,
                listFilter: AppData.instance.provinces.toList(),
                selectedItem: controller.tk1State.provinceTT.value,
                display: (value) => value.name,
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
          display: (province) => province.name,
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
          display: (district) => district.name,
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
          display: (ward) => ward.name,
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
