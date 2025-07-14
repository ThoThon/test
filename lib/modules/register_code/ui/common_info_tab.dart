part of 'register_code_page.dart';

extension CommonInfoTab on RegisterCodePage {
  Widget _buildCommonInfoTab() {
    return AppFormRegistry(
      key: controller.registeredCommonTabKey,
      child: Form(
        key: controller.formKeyCommonTab,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildUnitInfoCard(),
                    sdsSBHeight12,
                    _buildContactInfoCard(),
                  ],
                ),
              ),
            ),
            sdsSBHeight12,
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_unitInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight8,
        // Mã số thuế
        _buildInputTaxCode(),
        sdsSBHeight12,

        // Tên đơn vị
        _buildInputUnitName(),
        sdsSBHeight12,

        // Loại đối tượng
        _buildSelectObjectType(),
        sdsSBHeight12,

        // Loại hình đơn vị
        _buildInputUnitType(),
        sdsSBHeight12,

        // Ngành nghề sản xuất
        _buildInputProductIndustry(),
        sdsSBHeight12,

        // Số quyết định
        _buildInputDecisionNumber(),
        sdsSBHeight12,

        // Ngày lập và ngày đăng ký
        _buildDoubleDate(),
        sdsSBHeight12,

        // Nơi cấp quyết định
        _buildInputAddressDecision(),
        sdsSBHeight12,

        // Địa chỉ đăng ký giao dịch
        _buildInputAddressRegister(),
        sdsSBHeight12,

        // Địa chỉ đơn vị
        _buildInputAddressUnit(),
      ],
    );
  }

  // Mã số thuế
  Widget _buildInputTaxCode() {
    return FormFieldRegistrant<String>(
      registrarId: 'f5046992-dc88-4f5a-bff7-cb687f9e4172',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_taxCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_taxCode.tr,
          controller: controller.taxCodeCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.taxCodeNormal,
          maxLengthInputForm: 14,
        );
      },
    );
  }

  // Tên đơn vị
  Widget _buildInputUnitName() {
    return FormFieldRegistrant<String>(
      registrarId: '6cee88bc-7472-4c09-a6c2-e0c637de16d3',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_unitCodeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_unitName.tr,
          controller: controller.unitNameCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 250,
        );
      },
    );
  }

  // Loại đối tượng
  Widget _buildSelectObjectType() {
    return FormFieldRegistrant<ObjectTypeModel?>(
      registrarId: '0ccae861-ff27-479e-8b7a-53e40bc5603f',
      validator: (value) {
        if (value == null) {
          return LocaleKeys.registerCode_objectTypeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return Obx(
          () {
            return CardDropdownWithLabel(
              fieldKey: fieldKey,
              validator: validator,
              labelText: LocaleKeys.registerCode_objectType.tr,
              isRequired: true,
              items: AppData.instance.objectType.toList(),
              display: (object) => object.text,
              selectedItem: controller.selectedObject.value,
              onChanged: (value) {
                controller.selectedObject.value = value;
              },
            );
          },
        );
      },
    );
  }

  // Loại hình đơn vị
  Widget _buildInputUnitType() {
    return FormFieldRegistrant<String>(
      registrarId: 'aaffca33-e7cb-4aa6-913a-c79d372b14a7',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_unitTypeCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_unitType.tr,
          controller: controller.unitTypeCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  // Ngành nghề sản xuất
  Widget _buildInputProductIndustry() {
    return FormFieldRegistrant<String>(
      registrarId: '631cf955-3fa4-4392-b233-a15e9a00d581',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_productIndustryCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_productIndustry.tr,
          controller: controller.productIndustryCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        );
      },
    );
  }

  // Số quyết định
  Widget _buildInputDecisionNumber() {
    return FormFieldRegistrant<String>(
      registrarId: '12cd7097-8035-4cff-a501-899a3d3f9dfa',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_decisionNumberCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_decisionNumber.tr,
          controller: controller.decisionNumberCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  // Ngày lập
  Widget _buildSelectDateSetup() {
    return FormFieldRegistrant<String>(
      registrarId: '0ddef9e2-c103-456e-a372-6f9e56299f5b',
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_setupDateCannotEmpty.tr;
        }

        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.registerCode_setupDateIsNotValid.tr;
        }

        final date = convertStringToDateStrict(
          trimmedValue,
          PATTERN_1,
        );

        if (date == null) {
          return LocaleKeys.registerCode_setupDateIsNotValid.tr;
        }

        // Chỉ được nhập từ năm 1900
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.registerCode_setupDateIsNotValid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: PATTERN_1,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          labelText: LocaleKeys.registerCode_setupDate.tr,
          controller: controller.setupDateCtrl,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await ShowDialog.showCalendarPickDayMonthYear(
              dateTimeInit: convertStringToDateSafe(
                    controller.setupDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.setupDateCtrl.text =
                  convertDateToString(selectedDate, PATTERN_1);
            }
          },
        );
      },
    );
  }

  // Ngày đăng ký
  Widget _buildSelectDateRegister() {
    return FormFieldRegistrant<String>(
      registrarId: 'e126116f-9157-4d97-9b8c-86f6bf58b03e',
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_registerDateCannotEmpty.tr;
        }
        // Kiểm tra độ dài chuỗi (dd/MM/yyyy = 10 ký tự)
        if (trimmedValue.length < 10) {
          return LocaleKeys.registerCode_registerDateIsNotValid.tr;
        }
        final date = convertStringToDateStrict(
          trimmedValue,
          PATTERN_1,
        );

        if (date == null) {
          return LocaleKeys.registerCode_registerDateIsNotValid.tr;
        }

        // Chỉ được nhập từ năm 1900
        if (date.year <= 1900 || date.year >= 2100) {
          return LocaleKeys.registerCode_registerDateIsNotValid.tr;
        }

        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputSelectDateWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          hintText: PATTERN_1,
          inputFormatters: InputFormatterEnum.dateFullBirthDay,
          labelText: LocaleKeys.registerCode_registerDate.tr,
          controller: controller.registerDateCtrl,
          isRequired: true,
          onSelectDate: () async {
            KeyBoard.hide();
            final selectedDate = await ShowDialog.showCalendarPickDayMonthYear(
              dateTimeInit: convertStringToDateSafe(
                    controller.registerDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (selectedDate != null) {
              controller.registerDateCtrl.text = convertDateToString(
                selectedDate,
                PATTERN_1,
              );
            }
          },
        );
      },
    );
  }

  // Nơi cấp quyết định
  Widget _buildInputAddressDecision() {
    return FormFieldRegistrant<String>(
      registrarId: '1b58c8b3-999b-416e-a510-59ae9fa0098f',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_addressDecisionCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_addressDecision.tr,
          controller: controller.addressDecisionCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  // Địa chỉ đăng ký kinh doanh
  Widget _buildInputAddressRegister() {
    return FormFieldRegistrant<String>(
      registrarId: '3bb815f6-043e-4830-8949-0702d85528de',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_addressRegisterBusinessCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_addressRegisterBusiness.tr,
          controller: controller.addressRegisterBusinessCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        );
      },
    );
  }

  // Địa chỉ đơn vị
  Widget _buildInputAddressUnit() {
    return FormFieldRegistrant<String>(
      registrarId: '3d785ffe-e101-4f5b-95ee-5bef7ec5810b',
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_addressUnitCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_addressUnit.tr,
          controller: controller.addressUnitCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 500,
        );
      },
    );
  }

  Widget _buildContactInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_contactInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight12,

        // Điện thoại đơn vị
        _buildInputPhoneUnit(),
        sdsSBHeight12,

        // Email đơn vị
        _buildInputEmailUnit(),
        sdsSBHeight12,

        // Người giao dịch BHXH
        _buildInputPersonTransactionBHXH(),
        sdsSBHeight12,

        // Điện thoại liên hệ
        _buildInputContactPhone(),
      ],
    );
  }

  // Điện thoại đơn vị
  Widget _buildInputPhoneUnit() {
    return FormFieldRegistrant<String>(
      registrarId: '5cc78e67-6e03-4927-81f1-b2e1669652f5',
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_phoneUnitCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_phoneUnit.tr,
          controller: controller.phoneUnitCtrl,
          isRequired: true,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.phoneNumber,
          maxLengthInputForm: 20,
        );
      },
    );
  }

  // Email đơn vị
  Widget _buildInputEmailUnit() {
    return FormFieldRegistrant<String>(
      registrarId: 'd79912bf-403b-49e5-9e23-f6f508512494',
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.unitInfo_emailContactIsNotEmpty.tr;
        }
        if (!trimmedValue.isEmailValid) {
          return LocaleKeys.unitInfo_emailIsNotValid.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_emailUnit.tr,
          controller: controller.emailUnitCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.email,
          maxLengthInputForm: 50,
        );
      },
    );
  }

  // Người giao dịch BHXH
  Widget _buildInputPersonTransactionBHXH() {
    return FormFieldRegistrant<String>(
      registrarId: 'bcccb9a6-9824-4c16-a699-4f4368a730e1',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_personTransactionSocialCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_personTransactionSocial.tr,
          controller: controller.personTransactionBhxhCtrl,
          isRequired: true,
          inputFormatters: InputFormatterEnum.textNormal,
          maxLengthInputForm: 100,
        );
      },
    );
  }

  // Điện thoại liên hệ
  Widget _buildInputContactPhone() {
    return FormFieldRegistrant<String>(
      registrarId: '4f8c135d-4939-4983-a387-b44f822f870d',
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_phoneContactCannotEmpty.tr;
        }
        return null;
      },
      builder: (fieldKey, validator) {
        return CardInputTextFormWithLabel(
          fieldKey: fieldKey,
          validator: validator,
          labelText: LocaleKeys.registerCode_phoneContact.tr,
          controller: controller.phoneContactCtrl,
          isRequired: true,
          textInputType: TextInputType.number,
          inputFormatters: InputFormatterEnum.phoneNumber,
          maxLengthInputForm: 20,
        );
      },
    );
  }

  Widget _buildDoubleDate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildSelectDateSetup(),
        ),
        sdsSBWidth12,
        Expanded(
          child: _buildSelectDateRegister(),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.registerCode_continue.tr,
          onPressed: () {
            controller.onTabChanged(RegisterCodeTabEnum.register_info);
          },
          borderRadius: AppDimens.radius30,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
        );
      },
    );
  }
}
