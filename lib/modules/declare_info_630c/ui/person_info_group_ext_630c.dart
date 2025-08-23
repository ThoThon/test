part of 'declare_info_630c_page.dart';

extension PersonInfoGroupExt630c on DeclareInfo630cPage {
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
          onPressed: () {},
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
      registrarId: "f05931e0-6c1a-4fce-8eca-317d78fac1cc",
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
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
        );
      },
    );
  }

  // Mã số BHXH
  Widget _buildInputBHXHCode() {
    return FormFieldRegistrant<String>(
      registrarId: "8a227189-01de-4fe2-9037-b73b3fff89c5",
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
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
        );
      },
    );
  }

  // Số CCCD
  Widget _buildInputCCCD() {
    return FormFieldRegistrant<String>(
      registrarId: '9a4d0f16-a6b0-4335-94b9-5b8ce7618a7b',
      validator: (value) {
        return null;
      },
      builder: (formFieldKey, validator) => CardInputTextFormWithLabel(
        fieldKey: formFieldKey,
        labelText: LocaleKeys.declareInfo_cccd.tr,
        controller: controller.cccdTextCtrl,
        hintText: LocaleKeys.declareInfo_inputCCCD.tr,
        maxLengthInputForm: 20,
        inputFormatters: InputFormatterEnum.textNormalWithoutSpace,
        validator: validator,
      ),
    );
  }

  // Mã nhân viên
  Widget _buildStaffCode() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declareInfo_staffCode.tr,
      controller: controller.staffCodeTextCtrl,
      hintText: LocaleKeys.declareInfo_inputStaffCode.tr,
      maxLengthInputForm: 100,
    );
  }
}
