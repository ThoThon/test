part of 'declare_info_630b_page.dart';

extension PersonInfoGroupExt630b on DeclareInfo630bPage {
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
      registrarId: "3dda4da1-e850-495c-8b81-8528161fde19",
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
        );
      },
    );
  }

  // Mã số BHXH
  Widget _buildInputBHXHCode() {
    return FormFieldRegistrant<String>(
      registrarId: "534c14fb-b120-4e7c-a85d-d304b1c223f7",
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
        );
      },
    );
  }

  // Số CCCD
  Widget _buildInputCCCD() {
    return FormFieldRegistrant<String>(
      registrarId: 'f0bbcb9d-0035-4a0c-bb15-980848d14df8',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.containsVietnamese) {
          return LocaleKeys.declareInfo_cccdNumberIncorrectFormat.tr;
        }
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
