part of 'declare_info_page.dart';

extension Tk1TabWidget on DeclareInfoPage {
  Widget _buildTk1TabBody() {
    return Form(
      key: controller.tk1State.formKey,
      child: Column(
        children: [
          _buildScanIDButton(
            onTap: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputFullName(
                        onTapSelectStaff: controller.showDialogSelectStaff,
                        showSelectStaff: false,
                      ),
                      UtilWidget.sizedBox16,
                      _buildInputBHXHNumber(),
                      UtilWidget.sizedBox16,
                      _buildInputCCCD(),
                      UtilWidget.sizedBox16,
                      _buildSelectDate(
                        'Ngày sinh',
                        hintText: PATTERN_1,
                        date: convertDateToStringSafe(
                          controller.d02Tk1State.dateOfBirth.value,
                          PATTERN_1,
                        ),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox12,
                      _buildSelectGender(onChanged: (value) {}),
                      UtilWidget.sizedBox8,
                      _buildSelectEthnic(),
                      _buildSelectNationality(),
                      _buildSelectProvince(),
                      _buildSelectDistrict(),
                      _buildSelectWard(),
                      _buildInputAddress(),
                      UtilWidget.buildCheckboxWithLabel(
                        label: 'Trùng địa chỉ khai sinh',
                        value: controller.tk1State.isSameAddress.value,
                        onChanged: (value) {
                          controller.tk1State.isSameAddress.value =
                              value ?? false;
                        },
                      ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
                      _buildSelectProvinceReceive(),
                      _buildSelectDistrictReceive(),
                      _buildSelectWardReceive(),
                      _buildInputAddressReceive(),
                      UtilWidget.sizedBox16,
                      _buildSelectProvinceKCB(),
                      _buildSelectHospital(),
                      _buildInputPhoneNumber(),
                      UtilWidget.buildCheckboxWithLabel(
                        label: 'Người tham gia là chủ hộ',
                        value: controller.tk1State.isHeadOfHousehold.value,
                        onChanged: (value) {
                          controller.tk1State.isHeadOfHousehold.value =
                              value ?? false;
                        },
                      ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
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
          ),
          _buildTk1BottomButtons(),
        ],
      ),
    );
  }

  Widget _buildSelectProvince() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Tỉnh khai sinh',
      hintText: 'Chọn tỉnh khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn tỉnh khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedProvince,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedProvince.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedProvince,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Tỉnh khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrict() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Huyện khai sinh',
      hintText: 'Chọn huyện khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn huyện khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedDistrict,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedDistrict.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedDistrict,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Huyện khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectWard() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Xã khai sinh',
      hintText: 'Chọn xã khai sinh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn xã khai sinh',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedWard,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedWard.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedWard,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Xã khai sinh không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildInputAddress() {
    return BuildInputTextWithLabel(
      label: 'Địa chỉ khai sinh',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.addressTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Tỉnh nơi nhận',
      hintText: 'Chọn tỉnh nơi nhận',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn tỉnh nơi nhận',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedProvinceReceive,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedProvinceReceive.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedProvinceReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Tỉnh nơi nhận không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrictReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Huyện nơi nhận',
      hintText: 'Chọn huyện nơi nhận',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn huyện nơi nhận',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedDistrictReceive,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedDistrictReceive.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedDistrictReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Huyện nơi nhận không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectWardReceive() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Xã nơi nhận',
      hintText: 'Chọn xã nơi nhận',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn xã nơi nhận',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedWardReceive,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedWardReceive.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedWardReceive,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Xã nơi nhận không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildInputAddressReceive() {
    return BuildInputTextWithLabel(
      label: 'Địa chỉ nơi nhận',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.addressReceiveTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceKCB() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Tỉnh nơi KCB',
      hintText: 'Chọn tỉnh',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn tỉnh nơi KCB',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedProvinceKCB,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedProvinceKCB.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedProvinceKCB,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Tỉnh nơi KCB không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectHospital() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Bệnh viện nơi KCB',
      hintText: 'Chọn bệnh viện',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn bệnh viện',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedHospital,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedHospital.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedHospital,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Bệnh viện KCB không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildInputPhoneNumber() {
    return BuildInputTextWithLabel(
      label: 'SĐT liên hệ',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.phoneTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputHeadOfHousehold() {
    return BuildInputTextWithLabel(
      label: 'Họ và tên chủ hộ',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.headOfHouseholdTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputHeadOfHouseholdCCCD() {
    return BuildInputTextWithLabel(
      label: 'Số CCCD/ĐDCN của chủ hộ',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.headOfHouseholdCCCDTextCtrl,
        ),
      ),
    );
  }

  Widget _buildSelectProvinceTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Tỉnh thường trú',
      hintText: 'Chọn tỉnh thường trú',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn tỉnh thường trú',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedProvinceTT,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedProvinceTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedProvinceTT,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Tỉnh thường trú không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectDistrictTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Huyện thường trú',
      hintText: 'Chọn huyện thường trú',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn huyện thường trú',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedDistrictTT,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedDistrictTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedDistrictTT,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Huyện thường trú không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectWardTT() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Huyện xã trú',
      hintText: 'Chọn xã thường trú',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn xã thường trú',
            listFilter: ['Phú Thọ', 'Hà Nội', 'Hà Giang'],
            itemSelect: controller.tk1State.selectedWardTT,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.tk1State.selectedWardTT.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.tk1State.selectedWardTT,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Xã thường trú không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildInputAddressTTTextCtrl() {
    return BuildInputTextWithLabel(
      label: 'Đia chỉ thường trú',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.tk1State.addressTTTextCtrl,
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
          'Danh sách thành viên trong gia đình',
          style: AppTextStyle.font16Bo,
        ),
        if (controller.tk1State.familyMembers.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.dsGray3,
              ),
            ),
            child: Column(
              children: controller.tk1State.familyMembers.map(
                (member) {
                  return SDSBuildText(
                    '${member.fullName} - ${member.relationship}',
                  );
                },
              ).toList(),
            ),
          ),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            label: Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTk1BottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Lưu nháp',
            onPressed: () {},
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Tiếp theo',
            onPressed: () {},
          ),
        ),
      ],
    ).paddingOnly(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      top: AppDimens.defaultPadding,
    );
  }
}
