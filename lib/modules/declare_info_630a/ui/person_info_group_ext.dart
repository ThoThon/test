part of 'declare_info_630a_page.dart';

extension PersonInfoGroupWidgetExt on DeclareInfo630aPage {
  Widget _buildGroupPersonInfo() {
    return Column(
      children: [
        // Thông tin cá nhân
        _buildInfoPerson(),
        sdsSBHeight12,

        // Họ và tên
        _buildInputFullName(),
        sdsSBHeight12,

        // Mã số BHXH
        _buildInputBHXHCode(),
        sdsSBHeight12,

        // Số CCCD
        _buildInputCCCD(),
        sdsSBHeight12,

        // Mã nhân viên
        _buildStaffCode(),
        sdsSBHeight12,
      ],
    );
  }

  // Thông tin cá nhân
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

  // Họ và tên
  Widget _buildInputFullName() {
    return FormFieldRegistrant<String>(
      registrarId: "eeee098a-b814-4b72-a6ce-680158ee59f5",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_fullNameEmpty.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declareInfo_fullName.tr,
          controller: controller.fullNameTextCtrl,
          isRequired: true,
          maxLengthInputForm: 100,
          onChanged: (p0) {},
        );
      },
    );
  }

  // Mã số BHXH
  Widget _buildInputBHXHCode() {
    return FormFieldRegistrant<String>(
      registrarId: "862edcd8-8319-4549-a432-2fd886036cc1",
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declareInfo_bhxhCodeCannotEmpty.tr;
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
          isRequired: true,
          labelText: LocaleKeys.declareInfo_bhxhCode.tr,
          controller: controller.bhxhTextCtrl,
          maxLengthInputForm: 10,
          hintText: LocaleKeys.declareInfo_inputBhxhCode.tr,
          inputFormatters: InputFormatterEnum.digitsOnly,
          textInputType: TextInputType.number,
          onChanged: (value) {},
        );
      },
    );
  }

  // Số CCCD
  Widget _buildInputCCCD() {
    return CardInputTextFormWithLabel(
      validator: (p0) {
        return null;
      },
      labelText: LocaleKeys.declareInfo_cccd.tr,
      controller: controller.cccdTextCtrl,
      hintText: LocaleKeys.declareInfo_inputCCCD.tr,
      maxLengthInputForm: 20,
      inputFormatters: InputFormatterEnum.textNormalWithoutDiacritics,
    );
  }

  // Mã nhân viên
  Widget _buildStaffCode() {
    return CardInputTextFormWithLabel(
      validator: (p0) {
        return null;
      },
      labelText: LocaleKeys.declareInfo_staffCode.tr,
      controller: controller.staffCodeTextCtrl,
      hintText: LocaleKeys.declareInfo_inputStaffCode.tr,
      maxLengthInputForm: 100,
    );
  }
}
