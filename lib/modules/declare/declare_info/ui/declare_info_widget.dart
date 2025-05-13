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
                index: controller.selectedTab.value.index,
                children: [
                  _buildD02TabBody(),
                  _buildTk1TabBody(),
                  _buildD01TabBody(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(AppDimens.radius8),
          ),
          padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  title: 'D02-LT',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.d02,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d02);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'TK1-TS',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.tk1,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.tk1);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'D01-TS',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.d01,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d01);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    VoidCallback? onTap,
  }) {
    return Material(
      color: isSelected ? AppColors.primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimens.radius8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
        child: Center(
          child: SDSBuildText(
            title,
            style: AppTextStyle.font16Re.copyWith(
              color: isSelected ? AppColors.colorWhite : AppColors.primaryColor,
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
          Icon(
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
                title: 'Họ và tên',
                isRequired: true,
              ).paddingOnly(bottom: AppDimens.padding10),
            ),
            if (showSelectStaff)
              TextButton(
                onPressed: onTapSelectStaff,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimens.paddingSmallest,
                    horizontal: AppDimens.paddingSmall,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: SDSBuildText(
                  'Chọn nhân viên',
                  style: AppTextStyle.font16Re.copyWith(
                    color: AppColors.primaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
        BuildInputText(
          InputTextModel(
            controller: controller.d02Tk1State.fullNameTextCtrl,
            hintText: 'Nhập thông tin họ tên',
            isValidate: true,
            validator: (value) {
              if (value.isNullOrEmpty) {
                return 'Họ và tên không được để trống';
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
      label: 'Số CCCD',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02Tk1State.cccdTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputBHXHNumber() {
    return BuildInputTextWithLabel(
      label: 'Mã số BHXH',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.d02Tk1State.bhxhTextCtrl,
        ),
      ),
    );
  }

  Widget _buildSelectGender({
    ValueChanged<Gender?>? onChanged,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInputTitle(
              title: 'Giới tính',
              isRequired: true,
            ),
            Radio<Gender>(
              value: Gender.male,
              groupValue: controller.d02Tk1State.gender.value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
            SDSBuildText(
              'Nam',
              style: AppTextStyle.font16Re,
            ),
            Radio<Gender>(
              value: Gender.female,
              groupValue: controller.d02Tk1State.gender.value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
            SDSBuildText(
              'Nữ',
              style: AppTextStyle.font16Re,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectEthnic() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Dân tộc',
      hintText: 'Chọn dân tộc',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn dân tộc',
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
          return "Dân tộc không được để trống";
        }
        return null;
      },
    );
  }

  Widget _buildSelectNationality() {
    return UtilWidget.buildBottomSheetSelect<String>(
      label: 'Quốc tịch',
      hintText: 'Chọn quốc tịch',
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<String>(
            title: 'Chọn quốc tịch',
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
          return "Quốc tịch không được để trống";
        }
        return null;
      },
    );
  }
}
