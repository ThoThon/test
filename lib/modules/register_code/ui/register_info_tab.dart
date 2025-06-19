part of 'register_code_page.dart';

extension RegisterInfoTab on RegisterCodePage {
  Widget _buildRegisterInfoTab() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildBhxhInfoCard(),
                sdsSBHeight20,
                _buildOtherInfoCard(),
                sdsSBHeight12,
                // Ô input nhập username My Sign
                _buildInputUsernameMySign(),
                sdsSBHeight12,
                _buildButtonPickFile(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBhxhInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_socialInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight8,
        // Cơ quan BHXH
        _buildSelectBhxhAgency(),

        // Nơi nhận tỉnh
        _buildSelectProvinceReceive(),

        // Nơi nhận huyện
        _buildSelectDistrictReceive(),

        // Nơi nhận xã
        _buildSelectWardReceive(),

        // Đăng ký nhận kết quả
        _buildSelectRegisterResult(),
      ],
    );
  }

  // Cơ quan BHXH
  Widget _buildSelectBhxhAgency() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_socialSecurityAgency.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Nơi nhận tỉnh
  Widget _buildSelectProvinceReceive() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_provinceReceive.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Nơi nhận huyện
  Widget _buildSelectDistrictReceive() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_districtReceive.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Nơi nhận xã
  Widget _buildSelectWardReceive() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_wardReceive.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Đăng ký nhận kết quả
  Widget _buildSelectRegisterResult() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_registerResult.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  Widget _buildOtherInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_socialInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight8,
        // Phương thức nhận kết quả
        _buildSelectMethodResult(),

        // Phương thức đóng
        _buildSelectMethodClose(),

        // Hồ sơ kèm theo
        _buildInputUnitFileInclude(),
        sdsSBHeight12,

        // Nội dung
        _buildInputUnitContent(),
      ],
    );
  }

  // Phương thức nhận kết quả
  Widget _buildSelectMethodResult() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_methodReceiveResult.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Phương thức đóng
  Widget _buildSelectMethodClose() {
    return UtilWidget.buildCardBottomSheetSelect(
      label: LocaleKeys.registerCode_methodClose.tr,
      funcSelect: (didChange) {
        // Get.bottomSheet(
        //   BottomSheetSearch<EthnicModel>(
        //     title: LocaleKeys.declareInfo_ethnic.tr,
        //     maxLength: 20,
        //     listFilter: AppData.instance.ethnics.toList(),
        //     selectedItem: controller.d02Tk1State.selectedEthnic.value,
        //     display: (value) => value.text,
        //     onAccept: (value) {
        //       if (value == null) return;
        //       controller.d02Tk1State.selectedEthnic.value = value;
        //       didChange(value);
        //     },
        //   ),
        //   isScrollControlled: true,
        // );
      },
      selectedItem: controller.selectedObject.value,
      display: (type) => 'type.text,',
      validator: (value) {
        if (controller.selectedObject.value == null) {
          return 'Loại đối tượng không được để trống';
        }
        return null;
      },
    );
  }

  // Hồ sơ kèm theo
  CardInputTextFormWithLabel _buildInputUnitFileInclude() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_fileInclude.tr,
      controller: controller.unitNameCtrl,
      isValidate: true,
    );
  }

  // Nội dung
  CardInputTextFormWithLabel _buildInputUnitContent() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_content.tr,
      controller: controller.unitNameCtrl,
      isValidate: true,
    );
  }

  Widget _buildInputUsernameMySign() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BuildInputText(
            InputTextModel(
              controller: controller.usernameMySignCtrl,
              autovalidateMode: AutovalidateMode.always,
              hintText: LocaleKeys.registerService_inputMySignUsername.tr,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return LocaleKeys
                      .registerService_userNameMySignCannotEmpty.tr;
                }
                return null;
              },
            ),
          ),
        ),
        sdsSBWidth8,
        _buildButtonGetListCert(),
      ],
    );
  }

  Widget _buildButtonGetListCert() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
            ),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.send,
            color: AppColors.basicWhite,
          ),
        ),
      ],
    );
  }

  // Tệp đính kèm
  Widget _buildButtonPickFile() {
    return Row(
      children: [
        UtilWidget.buildSolidButton(
          title: 'Tệp đính kèm',
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          onPressed: () {},
        ),
        sdsSBWidth8,
        Expanded(
          child: SDSBuildText(
            LocaleKeys.registerCode_format.tr,
            style: AppTextStyle.font14Re.copyWith(
              color: AppColors.dsGray2,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
