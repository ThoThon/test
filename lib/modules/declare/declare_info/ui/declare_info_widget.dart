part of 'declare_info_page.dart';

extension DeclareInfoWidget on DeclareInfoPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildTabs(),
        Expanded(
          child: Obx(
            () {
              return IndexedStack(
                index: controller.currentTab.value.index,
                children: [
                  _buildD02TabBody(),
                  _buildTk1TabBody(),
                  _buildD01TabBody(),
                ],
              );
            },
          ),
        ),
        Obx(
          () => _buildBottomButtons(),
        ).paddingAll(AppDimens.defaultPadding),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Obx(
        () {
          return Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  title: 'D02-LT',
                  isSelected: controller.currentTab.value == DeclareInfoTab.d02,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d02);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'TK1-TS',
                  enabled: controller.enableTk1Tab,
                  isSelected: controller.currentTab.value == DeclareInfoTab.tk1,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.tk1);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'D01-TS',
                  enabled: controller.enableD01Tab,
                  isSelected: controller.currentTab.value == DeclareInfoTab.d01,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d01);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    bool enabled = true,
    VoidCallback? onTap,
  }) {
    return Material(
      color: isSelected ? AppColors.primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimens.radius8),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
        child: Center(
          child: SDSBuildText(
            title,
            style: AppTextStyle.font16Re.copyWith(
              color: !enabled
                  ? AppColors.dsGray4
                  : isSelected
                      ? AppColors.colorWhite
                      : AppColors.primaryColor,
            ),
          ).paddingSymmetric(
            horizontal: AppDimens.paddingSmall,
            vertical: AppDimens.paddingVerySmall,
          ),
        ),
      ),
    );
  }

  // Widget _buildScanIDButton({
  //   VoidCallback? onTap,
  // }) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SDSImageSvg(
  //           Assets.ASSETS_ICONS_IC_SCAN_NFC_GET_INFO_SVG,
  //           height: AppDimens.sizeIconLarge,
  //           width: AppDimens.sizeIconLarge,
  //         ),
  //         UtilWidget.sizedBoxWidth8,
  //         Flexible(
  //           child: SDSBuildText(
  //             'Quét căn cước công dân để lấy thông tin',
  //             style: AppTextStyle.font14Semi,
  //           ),
  //         ),
  //       ],
  //     ).paddingAll(AppDimens.paddingSmallest),
  //   ).paddingAll(AppDimens.paddingSmall);
  // }

  Widget _buildInputFullName({
    VoidCallback? onTapSelectStaff,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInputTitle(
                title: LocaleKeys.declareInfo_fullName.tr,
                isRequired: true,
              ),
            ),
            if (onTapSelectStaff != null)
              TextButton(
                onPressed: onTapSelectStaff,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimens.paddingSmallest,
                    horizontal: AppDimens.paddingSmall,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: SDSBuildText(
                  LocaleKeys.declareInfo_selectStaff.tr,
                  style: AppTextStyle.font16Re.copyWith(
                    color: AppColors.primaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ).paddingOnly(bottom: AppDimens.paddingSmallest),
        BuildInputText(
          InputTextModel(
            controller: controller.d02Tk1State.fullNameTextCtrl,
            hintText: LocaleKeys.declareInfo_fullNameHint.tr,
            isValidate: true,
            maxLengthInputForm: 100,
            onChanged: controller.onChangeFullName,
            validator: (value) {
              final trimmedValue = value?.trim();

              if (trimmedValue == null || trimmedValue.isEmpty) {
                return LocaleKeys.declareInfo_fullNameCannotEmpty.tr;
              }

              return null;
            },
          ),
        ),
      ],
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

  Widget _buildInputCCCD() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_cccdNumber.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          autovalidateMode: controller.autovalidateMode.value,
          controller: controller.d02Tk1State.cccdTextCtrl,
          isValidate: true,
          maxLengthInputForm: 20,
          onChanged: controller.onChangeCCCD,
        ),
      ),
    );
  }

  Widget _buildInputBHXHCode() {
    return Obx(
      () {
        final isRequired = controller.isBhxhCodeRequired;
        return BuildInputTextWithLabel(
          label: LocaleKeys.declareInfo_bhxhCode.tr,
          buildInputText: BuildInputText(
            InputTextModel(
              controller: controller.d02Tk1State.bhxhTextCtrl,
              maxLengthInputForm: 10,
              inputFormatters: InputFormatterEnum.digitsOnly,
              textInputType: TextInputType.number,
              isValidate: isRequired,
              validator: (value) {
                final trimmedValue = value?.trim();

                if (trimmedValue == null || trimmedValue.isEmpty) {
                  return isRequired
                      ? LocaleKeys.declareInfo_bhxhCodeCannotEmpty.tr
                      : null;
                }
                if (trimmedValue.length < 10) {
                  return LocaleKeys.declareInfo_bhxhCodeInValid.tr;
                }

                return null;
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectGender() {
    return UtilWidget.buildListRadio(
      options: [
        Gender.male,
        Gender.female,
      ],
      getTitle: (gender) => gender.title,
      selectedItem: controller.d02Tk1State.gender.value,
      isRequired: true,
      funcSelect: (didChange) {
        controller.d02Tk1State.gender.value;
      },
      autovalidateMode: controller.autovalidateMode.value,
      onChanged: (value) {
        controller.d02Tk1State.gender.value = value;
      },
    );
  }

  Widget _buildSelectEthnic() {
    return Obx(
      () {
        return UtilWidget.buildBottomSheetSelect<EthnicModel>(
          label: LocaleKeys.declareInfo_ethnic.tr,
          hintText: LocaleKeys.declareInfo_selectEthnic.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<EthnicModel>(
                title: LocaleKeys.declareInfo_ethnic.tr,
                maxLength: 20,
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
          validator: (value) {
            if (controller.d02Tk1State.selectedEthnic.value == null) {
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
        return UtilWidget.buildBottomSheetSelect<NationModel>(
          label: LocaleKeys.declareInfo_nationality.tr,
          hintText: LocaleKeys.declareInfo_selectNationality.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<NationModel>(
                title: LocaleKeys.declareInfo_selectNationality.tr,
                maxLength: 20,
                listFilter: AppData.instance.nations.toList(),
                selectedItem: controller.d02Tk1State.selectedNationality.value,
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
          validator: (value) {
            if (controller.d02Tk1State.selectedNationality.value == null) {
              return LocaleKeys.declareInfo_nationalityCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildBirthTypeDropdown() {
    return UtilWidget.buildDropDownWithLabel2<BirthTypeEnum>(
      label: LocaleKeys.familyMember_selectBirthType.tr,
      hintText: LocaleKeys.familyMember_selectBirthTypeHint.tr,
      items: BirthTypeEnum.values,
      display: (item) => item.title,
      selectedItem: controller.d02Tk1State.birthType.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        controller.d02Tk1State.dateOfBirthTextCtrl.clear();
        controller.d02Tk1State.birthType.value = value;
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return UtilWidget.buildInputSelectDate(
      title: LocaleKeys.declareInfo_dob.tr,
      controller: controller.d02Tk1State.dateOfBirthTextCtrl,
      hintText: controller.d02Tk1State.birthType.value.pattern,
      inputFormatters: controller.d02Tk1State.birthType.value.inputFormatter,
      onSelectDate: () async {
        final DateTime? selectedDate;

        switch (controller.d02Tk1State.birthType.value) {
          case BirthTypeEnum.year:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.d02Tk1State.dateOfBirthTextCtrl.text,
                      PATTERN_13) ??
                  DateTime.now(),
              onlyYear: true,
            );
            break;
          case BirthTypeEnum.monthYear:
            selectedDate = await UtilWidget.showPeriodDatePicker(
              dateTime: convertStringToDateSafe(
                      controller.d02Tk1State.dateOfBirthTextCtrl.text,
                      PATTERN_12) ??
                  DateTime.now(),
            );
            break;
          case BirthTypeEnum.full:
            selectedDate = await UtilWidget.showDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                      controller.d02Tk1State.dateOfBirthTextCtrl.text,
                      PATTERN_1) ??
                  DateTime.now(),
            );
            break;
        }
        if (selectedDate != null) {
          controller.d02Tk1State.dateOfBirthTextCtrl.text =
              convertDateToStringSafe(
                    selectedDate,
                    controller.d02Tk1State.birthType.value.pattern,
                  ) ??
                  '';
        }
      },
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_dobCannotEmpty.tr;
        }
        switch (controller.d02Tk1State.birthType.value) {
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
          controller.d02Tk1State.birthType.value.pattern,
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

  Widget _buildBottomButtons() {
    if (controller.isShowNextButton) {
      return UtilWidget.buildSolidButton(
        title: LocaleKeys.declareInfo_next.tr,
        onPressed: () {
          controller.nextTab();
        },
      );
    }

    return UtilWidget.buildSolidButton(
      title: LocaleKeys.app_save.tr,
      onPressed: controller.saveDraft,
    );
  }
}
