part of 'declaration_form_detail_page.dart';

extension DeclarationFormDetailWidget on DeclarationFormDetailPage {
  Widget _buildBody() {
    return AppFormRegistry(
      key: controller.registeredKey,
      child: Form(
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
      ),
    );
  }

  Widget _buildEffectiveDate() {
    return FormFieldRegistrant<String>(
      registrarId: 'd8a84273-85ab-484d-a0d9-d5cefc09617d',
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
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          inputFormatters: InputFormatterEnum.dateFull,
          controller: controller.effectiveDateCtrl,
          isRequired: true,
          labelText: LocaleKeys.declarationFormDetail_effectiveDate.tr,
          hintText: PATTERN_1,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await ShowDialog.showCalendarPickDayMonthYear(
              dateTimeInit: convertStringToDateSafe(
                      controller.effectiveDateCtrl.text, PATTERN_1) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.effectiveDateCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  Widget _buildSelectDateOfIssue() {
    return FormFieldRegistrant<String>(
      registrarId: '37e5d203-e5f7-41d4-97d6-8c9c0adf86cd',
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
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          isRequired: true,
          inputFormatters: InputFormatterEnum.dateFull,
          controller: controller.dateOfIssueCtrl,
          labelText: LocaleKeys.declarationFormDetail_dateOfIssue.tr,
          hintText: PATTERN_1,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await ShowDialog.showCalendarPickDayMonthYear(
              dateTimeInit: convertStringToDateSafe(
                      controller.dateOfIssueCtrl.text, PATTERN_1) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.dateOfIssueCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  Widget _buildInputFullName() {
    return FormFieldRegistrant<String>(
      registrarId: 'e527def3-0716-4e97-bcec-151a09369688',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_fullNameCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_fullName.tr,
          controller: controller.fullNameTextCtrl,
          inputFormatters: InputFormatterEnum.textNormal,
          isRequired: true,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  Widget _buildInputBHXHNumber() {
    return FormFieldRegistrant<String>(
      registrarId: '1c0f5061-3f6b-4c52-a9e7-188689724991',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';

        if (trimmedValue.isEmpty) {
          return null;
        }
        if (trimmedValue.length < 10) {
          return LocaleKeys.declarationFormDetail_bhxhCodeInValid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_bhxhCode.tr,
          controller: controller.bhxhTextCtrl,
          maxLengthInputForm: 10,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.digitsOnly,
        );
      },
    );
  }

  Widget _buildInputDocumentType() {
    return FormFieldRegistrant<String>(
      registrarId: 'c3f33fb2-76b1-4844-a30c-4a84cdcdc826',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_documentTypeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_documentType.tr,
          controller: controller.documentTypeTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  Widget _buildInputDocumentNumber() {
    return FormFieldRegistrant<String>(
      registrarId: '67f79bb4-20b2-4a80-ac8d-36c20605bdc1',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_documentNumberCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_documentNumber.tr,
          controller: controller.documentNumberTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 50,
        );
      },
    );
  }

  Widget _buildInputIssuingAgency() {
    return FormFieldRegistrant<String>(
      registrarId: 'ab424ca7-118c-4771-9d63-7238ebfa273c',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_issuingAgencyCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_issuingAgency.tr,
          controller: controller.issuingAgencyTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 255,
        );
      },
    );
  }

  Widget _buildInputSummary() {
    return FormFieldRegistrant<String>(
      registrarId: 'f2c77f36-5324-47b3-a292-75b4aa3fb5d2',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.declarationFormDetail_summaryCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_summary.tr,
          controller: controller.summaryTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        );
      },
    );
  }

  Widget _buildInputContent() {
    return FormFieldRegistrant<String>(
      registrarId: 'c9a3e43a-9534-4134-935d-73c4db62f59e',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys
              .declarationFormDetail_contentToBeAssessedCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.declarationFormDetail_contentToBeAssessed.tr,
          controller: controller.contentToBeAssessedTextCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 1000,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  Widget _buildBottomButtons() {
    return KeyboardVisibilityBuilder(
      builder: (ctx, isKeyboardVisible) {
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
