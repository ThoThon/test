part of 'declare_info_page.dart';

extension DeclareInfoWidget on DeclareInfoPage {
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Column(
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
          ).paddingOnly(
            top: AppDimens.defaultPadding,
            bottom: AppDimens.paddingVerySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton(
                    title: 'D02-LT',
                    isSelected:
                        controller.currentTab.value == DeclareInfoTab.d02,
                    onTap: () {
                      controller.onTabChanged(DeclareInfoTab.d02);
                    },
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    title: 'TK1-TS',
                    enabled: controller.enableTk1Tab,
                    isSelected:
                        controller.currentTab.value == DeclareInfoTab.tk1,
                    onTap: () {
                      controller.onTabChanged(DeclareInfoTab.tk1);
                    },
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    title: 'D01-TS',
                    enabled: controller.enableD01Tab,
                    isSelected:
                        controller.currentTab.value == DeclareInfoTab.d01,
                    onTap: () {
                      controller.onTabChanged(DeclareInfoTab.d01);
                    },
                  ),
                ),
              ],
            ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: isSelected ? AppColors.basicWhite : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimens.radius12),
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(AppDimens.radius8),
          child: Center(
            child: SDSBuildText(
              title,
              style: AppTextStyle.font16Re.copyWith(
                color: !enabled
                    ? const Color(0xFFF56584)
                    : isSelected
                        ? AppColors.primaryColor
                        : AppColors.basicWhite,
              ),
            ).paddingSymmetric(
              horizontal: AppDimens.paddingSmall,
              vertical: AppDimens.paddingVerySmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputFullName() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardInputTextFormWithLabel(
          labelText: LocaleKeys.declareInfo_fullName.tr,
          controller: controller.d02Tk1State.fullNameTextCtrl,
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

  Widget _buildInputCCCD() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_cccdNumber.tr,
      autovalidateMode: controller.autovalidateMode.value,
      controller: controller.d02Tk1State.cccdTextCtrl,
      hintText: LocaleKeys.declareInfo_inputCCCD.tr,
      isRequired: true,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.textNormal,
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

  Widget _buildInputBHXHCode() {
    return Obx(
      () {
        final isRequired = controller.isBhxhCodeRequired;
        return CardInputTextFormWithLabel(
          labelText: LocaleKeys.declareInfo_bhxhCode.tr,
          controller: controller.d02Tk1State.bhxhTextCtrl,
          maxLengthInputForm: 10,
          inputFormatters: InputFormatterEnum.digitsOnly,
          textInputType: TextInputType.number,
          isRequired: isRequired,
          onChanged: (value) {
            controller.updateHouseholdInfoRequired();
          },
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
        );
      },
    );
  }

  Widget _buildSelectGender() {
    return CardDropdownWithLabel<Gender>(
      key: ValueKey(controller.d02Tk1State.gender.value),
      labelText: LocaleKeys.declareInfo_gender.tr,
      items: Gender.values,
      display: (item) => item.title,
      autovalidateMode: controller.autovalidateMode.value,
      isRequired: true,
      selectedItem: controller.d02Tk1State.gender.value,
      onChanged: (value) {
        controller.d02Tk1State.gender.value = value ?? Gender.female;
      },
      validator: (value) {
        if (value == null) {
          return LocaleKeys.familyMember_selectGender.tr;
        }
        return null;
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
        return UtilWidget.buildCardBottomSheetSelect2<NationModel>(
          label: LocaleKeys.declareInfo_nationality.tr,
          // hintText: LocaleKeys.declareInfo_selectNationality.tr,
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
    return CardDropdownWithLabel<BirthTypeEnum>(
      labelText: LocaleKeys.familyMember_selectBirthType.tr,
      isRequired: true,
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
    return CardInputSelectDateWithLabel(
      labelText: LocaleKeys.declareInfo_dob.tr,
      isRequired: true,
      borderRadius: AppDimens.radius10,
      controller: controller.d02Tk1State.dateOfBirthTextCtrl,
      hintText: controller.d02Tk1State.birthType.value.pattern,
      inputFormatters: controller.d02Tk1State.birthType.value.inputFormatter,
      onSelectDate: () async {
        KeyBoard.hide();
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
        borderRadius: AppDimens.radius30,
        title: LocaleKeys.declareInfo_next.tr,
        textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
        onPressed: () {
          controller.nextTab();
        },
      );
    }

    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      title: LocaleKeys.app_save.tr,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      onPressed: controller.saveDraft,
    );
  }
}
