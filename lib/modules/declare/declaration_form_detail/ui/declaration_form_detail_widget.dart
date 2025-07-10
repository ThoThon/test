part of 'declaration_form_detail_page.dart';

extension DeclarationFormDetailWidget on DeclarationFormDetailPage {
  Widget _buildBody() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Column(
                children: [
                  _buildInputFullName(),
                  sdsSBHeight12,
                  _buildInputBHXHNumber(),
                  sdsSBHeight12,
                  _buildInputDocumentType(),
                  sdsSBHeight12,
                  _buildInputDocumentNumber(),
                  sdsSBHeight12,
                  _buildSelectDateOfIssue(),
                  sdsSBHeight12,
                  _buildEffectiveDate(),
                  sdsSBHeight12,
                  _buildInputIssuingAgency(),
                  sdsSBHeight12,
                  _buildInputSummary(),
                  sdsSBHeight12,
                  _buildInputContent(),
                ],
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildEffectiveDate() {
    return CardInputSelectDateWithLabel(
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.effectiveDateCtrl,
      isRequired: true,
      labelText: LocaleKeys.declarationFormDetail_effectiveDate.tr,
      hintText: PATTERN_1,
      onSelectDate: () async {
        KeyBoard.hide();
        final selectedDate = await UtilWidget.showDateTimePicker(
          dateTimeInit: convertStringToDateSafe(
                  controller.effectiveDateCtrl.text, PATTERN_1) ??
              DateTime.now(),
        );
        if (selectedDate != null) {
          controller.effectiveDateCtrl.text =
              convertDateToString(selectedDate, PATTERN_1);
        }
      },
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_effectiveDateCannotEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_effectiveDateInvalid.tr;
        }

        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);

        if (date == null) {
          return LocaleKeys.declarationFormDetail_effectiveDateInvalid.tr;
        }

        // Chỉ được nhập từ năm 1900 -> 2100 để có thể tạo xml
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.declarationFormDetail_effectiveDateInvalid.tr;
        }
        return null;
      },
    );
  }

  Widget _buildSelectDateOfIssue() {
    return CardInputSelectDateWithLabel(
      isRequired: true,
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.dateOfIssueCtrl,
      labelText: LocaleKeys.declarationFormDetail_dateOfIssue.tr,
      hintText: PATTERN_1,
      onSelectDate: () async {
        KeyBoard.hide();
        final selectedDate = await UtilWidget.showDateTimePicker(
          dateTimeInit: convertStringToDateSafe(
                  controller.dateOfIssueCtrl.text, PATTERN_1) ??
              DateTime.now(),
        );
        if (selectedDate != null) {
          controller.dateOfIssueCtrl.text =
              convertDateToString(selectedDate, PATTERN_1);
        }
      },
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_dateOfIssueCannotEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_dateOfIssueInvalid.tr;
        }
        final date = convertStringToDateStrict(trimmedValue, PATTERN_1);

        if (date == null) {
          return LocaleKeys.declarationFormDetail_dateOfIssueInvalid.tr;
        }

        // Chỉ được nhập từ năm 1900 -> 2100 để có thể tạo xml
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.declarationFormDetail_dateOfIssueInvalid.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputFullName() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_fullName.tr,
      controller: controller.fullNameTextCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      isRequired: true,
      maxLengthInputForm: 100,
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_fullNameCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputBHXHNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_bhxhCode.tr,
      controller: controller.bhxhTextCtrl,
      maxLengthInputForm: 10,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.digitsOnly,
      validator: (value) {
        final trimmedValue = value?.trim();

        if (trimmedValue == null || trimmedValue.isEmpty) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_bhxhCodeInValid.tr;
        }

        return null;
      },
    );
  }

  Widget _buildInputDocumentType() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_documentType.tr,
      controller: controller.documentTypeTextCtrl,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 100,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declarationFormDetail_documentTypeCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputDocumentNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_documentNumber.tr,
      controller: controller.documentNumberTextCtrl,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 50,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declarationFormDetail_documentNumberCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputIssuingAgency() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_issuingAgency.tr,
      controller: controller.issuingAgencyTextCtrl,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 255,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declarationFormDetail_issuingAgencyCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputSummary() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_summary.tr,
      controller: controller.summaryTextCtrl,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 500,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.declarationFormDetail_summaryCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputContent() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.declarationFormDetail_contentToBeAssessed.tr,
      controller: controller.contentToBeAssessedTextCtrl,
      isRequired: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 1000,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys
              .declarationFormDetail_contentToBeAssessedCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildBottomButtons() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            Expanded(
              child: UtilWidget.buildSolidButton(
                title: LocaleKeys.app_save.tr,
                onPressed: controller.submit,
                textStyle:
                    AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
                borderRadius: AppDimens.radius30,
              ),
            ),
          ],
        ).paddingAll(AppDimens.defaultPadding);
      },
    );
  }
}
