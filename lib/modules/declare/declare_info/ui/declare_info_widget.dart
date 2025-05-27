part of 'declare_info_page.dart';

extension DeclareInfoWidget on DeclareInfoPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildTabs(),
        Obx(() {
          if (controller.isShowScanIDButton) {
            return _buildScanIDButton(
              onTap: () {
                controller.goToScanCCCD();
              },
            );
          }
          return UtilWidget.shrink;
        }),
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
        _buildBottomButtons(),
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

  Widget _buildScanIDButton({
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const
          // Icon(
          //   Icons.qr_code_scanner,
          //   size: 36,
          // ),
          SDSImageSvg(
            Assets.ASSETS_ICONS_IC_SCAN_NFC_GET_INFO_SVG,
            height: AppDimens.sizeIconLarge,
            width: AppDimens.sizeIconLarge,
          ),
          UtilWidget.sizedBoxWidth8,
          Flexible(
            child: SDSBuildText(
              'Quét căn cước công dân để lấy thông tin',
              style: AppTextStyle.font14Semi,
            ),
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }

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
          controller: controller.d02Tk1State.cccdTextCtrl,
          isValidate: true,
          maxLengthInputForm: 20,
          onChanged: controller.onChangeCCCD,
        ),
      ),
    );
  }

  Widget _buildInputBHXHCode() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declareInfo_bhxhCode.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02Tk1State.bhxhTextCtrl,
          maxLengthInputForm: 10,
        ),
      ),
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
                groupValue: controller.d02Tk1State.gender.value,
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
                groupValue: controller.d02Tk1State.gender.value,
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
    return Obx(
      () {
        return UtilWidget.buildBottomSheetSelect<EthnicModel>(
          label: LocaleKeys.declareInfo_ethnic.tr,
          hintText: LocaleKeys.declareInfo_selectEthnic.tr,
          funcSelect: (didChange) {
            Get.bottomSheet(
              BottomSheetSearch<EthnicModel>(
                title: LocaleKeys.declareInfo_ethnic.tr,
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
            if (value == null) {
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
            if (value == null) {
              return LocaleKeys.declareInfo_nationalityCannotEmpty.tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildSelectDateOfBirth() {
    return UtilWidget.buildSelectDate(
      LocaleKeys.declareInfo_dob.tr,
      hintText: PATTERN_1,
      date: convertDateToStringSafe(
        controller.d02Tk1State.dateOfBirth.value,
        PATTERN_1,
      ),
      onTap: () async {
        final selectedDate =
            await UtilWidget.showDateTimePicker(dateTimeInit: DateTime.now());
        if (selectedDate != null) {
          controller.d02Tk1State.dateOfBirth.value = selectedDate;
        }
      },
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: LocaleKeys.app_saveDraft.tr,
            onPressed: controller.saveDraft,
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: LocaleKeys.app_save.tr,
            onPressed: () {
              controller.nextTab();
            },
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
