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
                  UtilWidget.sizedBox16,
                  _buildInputBHXHNumber(),
                  UtilWidget.sizedBox16,
                  _buildInputDocumentType(),
                  UtilWidget.sizedBox16,
                  _buildInputDocumentNumber(),
                  UtilWidget.sizedBox16,
                  _buildSelectDateOfIssue(),
                  UtilWidget.sizedBox16,
                  _buildEffectiveDate(),
                  UtilWidget.sizedBox16,
                  _buildInputIssuingAgency(),
                  UtilWidget.sizedBox16,
                  _buildInputSummary(),
                  UtilWidget.sizedBox16,
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
    return UtilWidget.buildInputSelectDate(
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.effectiveDateCtrl,
      title: LocaleKeys.declarationFormDetail_effectiveDate.tr,
      hintText: PATTERN_1,
      onSelectDate: () async {
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
    return UtilWidget.buildInputSelectDate(
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.dateOfIssueCtrl,
      title: LocaleKeys.declarationFormDetail_dateOfIssue.tr,
      hintText: PATTERN_1,
      onSelectDate: () async {
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
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_fullName.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.fullNameTextCtrl,
          isValidate: true,
          maxLengthInputForm: 100,
          validator: (value) {
            final trimmedValue = value?.trim();
            if (trimmedValue == null || trimmedValue.isEmpty) {
              return LocaleKeys.declarationFormDetail_fullNameCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputBHXHNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_bhxhCode.tr,
      buildInputText: BuildInputText(
        InputTextModel(
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
        ),
      ),
    );
  }

  Widget _buildInputDocumentType() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_documentType.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.documentTypeTextCtrl,
          isValidate: true,
          maxLengthInputForm: 100,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys
                  .declarationFormDetail_documentTypeCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputDocumentNumber() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_documentNumber.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.documentNumberTextCtrl,
          isValidate: true,
          maxLengthInputForm: 50,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys
                  .declarationFormDetail_documentNumberCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputIssuingAgency() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_issuingAgency.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.issuingAgencyTextCtrl,
          isValidate: true,
          maxLengthInputForm: 255,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys
                  .declarationFormDetail_issuingAgencyCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputSummary() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_summary.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.summaryTextCtrl,
          isValidate: true,
          maxLengthInputForm: 500,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys.declarationFormDetail_summaryCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputContent() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.declarationFormDetail_contentToBeAssessed.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.contentToBeAssessedTextCtrl,
          isValidate: true,
          maxLengthInputForm: 1000,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys
                  .declarationFormDetail_contentToBeAssessedCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: LocaleKeys.app_close.tr,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: LocaleKeys.app_save.tr,
            onPressed: controller.submit,
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
