part of 'declare_info_page.dart';

extension DeclareInfoWidget on DeclareInfoPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildTabs(),
        Obx(() {
          if (controller.isShowScanIDButton) {
            return _buildScanIDButton(
              onTap: () {},
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
      onTap: () {
        Get.toNamed(AppRoutes.nfc.path);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.qr_code_scanner,
            size: 36,
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
    bool showSelectStaff = true,
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
            if (showSelectStaff)
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
          inputFormatters: InputFormatterEnum.digitsOnly,
          maxLengthInputForm: 10,
          textInputType: TextInputType.number,
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
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_ethnic.tr,
      hintText: LocaleKeys.declareInfo_selectEthnic.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_ethnic.tr,
            listFilter: ['Kinh', 'Thái', 'Tày'],
            itemSelect: controller.d02Tk1State.selectedEthnic,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.d02Tk1State.selectedEthnic.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.d02Tk1State.selectedEthnic,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_ethnicCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectNationality() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: LocaleKeys.declareInfo_nationality.tr,
      hintText: LocaleKeys.declareInfo_selectNationality.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: LocaleKeys.declareInfo_selectNationality.tr,
            listFilter: ['Việt Nam', 'Lào', 'Campuchia'],
            itemSelect: controller.d02Tk1State.selectedNationality,
            display: (value) => value,
            onAccept: (value) {
              if (value == null) return;
              controller.d02Tk1State.selectedNationality.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      item: controller.d02Tk1State.selectedNationality,
      display: (ethnic) => ethnic,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declareInfo_nationalityCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Lưu nháp',
            onPressed: controller.saveDraft,
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Chuyển ký',
            onPressed: () {
              controller.nextTab();
            },
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
