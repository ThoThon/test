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
              child: Obx(
                () {
                  return Column(
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
                  );
                },
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildEffectiveDate() {
    return UtilWidget.buildSelectDate(
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.effectiveDateCtrl,
      LocaleKeys.declarationFormDetail_effectiveDate.tr,
      hintText: PATTERN_1,
      date: convertDateToStringSafe(
        controller.effectiveDate.value,
        PATTERN_1,
      ),
      onChanged: (value) {
        if (value.trim().isEmpty) {
          controller.effectiveDate.value = null;
        }
      },
      onTap: () async {
        final selectedDate = await UtilWidget.showDateTimePicker(
          dateTimeInit: convertStringToDateSafe(
                  controller.effectiveDateCtrl.text, PATTERN_1) ??
              DateTime.now(),
        );
        if (selectedDate != null) {
          controller.effectiveDate.value = selectedDate;
          controller.effectiveDateCtrl.text =
              convertDateToString(selectedDate, PATTERN_1);
        }
      },
    );
  }

  Widget _buildSelectDateOfIssue() {
    return UtilWidget.buildSelectDate(
      inputFormatters: InputFormatterEnum.dateFull,
      controller: controller.dateOfIssueCtrl,
      LocaleKeys.declarationFormDetail_dateOfIssue.tr,
      hintText: PATTERN_1,
      date: convertDateToStringSafe(
        controller.dateOfIssue.value,
        PATTERN_1,
      ),
      onChanged: (value) {
        if (value.trim().isEmpty) {
          controller.dateOfIssue.value = null;
        }
      },
      onTap: () async {
        final selectedDate = await UtilWidget.showDateTimePicker(
          dateTimeInit: convertStringToDateSafe(
                  controller.dateOfIssueCtrl.text, PATTERN_1) ??
              DateTime.now(),
        );
        if (selectedDate != null) {
          controller.dateOfIssue.value = selectedDate;
          controller.dateOfIssueCtrl.text =
              convertDateToString(selectedDate, PATTERN_1);
        }
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
