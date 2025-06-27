part of 'register_code_page.dart';

extension CommonInfoTab on RegisterCodePage {
  Widget _buildCommonInfoTab() {
    return Form(
      key: controller.formKeyCommonTab,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildUnitInfoCard(),
                  sdsSBHeight20,
                  _buildContactInfoCard(),
                ],
              ),
            ),
          ),
        ],
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

        // Ngày lập
        _buildSelectDateSetup(),
        sdsSBHeight12,

        // Ngày đăng ký
        _buildSelectDateRegister(),
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
  CardInputTextFormWithLabel _buildInputTaxCode() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_taxCode.tr,
      controller: controller.taxCodeCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.taxCodeNormal,
      maxLengthInputForm: 14,
    );
  }

  // Tên đơn vị
  CardInputTextFormWithLabel _buildInputUnitName() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_unitName.tr,
      controller: controller.unitNameCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 250,
    );
  }

  // Loại đối tượng
  CardDropdownWithLabel _buildSelectObjectType() {
    return CardDropdownWithLabel(
      labelText: LocaleKeys.registerCode_objectType.tr,
      isValidate: true,
      items: AppData.instance.objectType.toList(),
      display: (object) => object.text,
      selectedItem: controller.selectedObject.value,
      onChanged: (value) {
        controller.selectedObject.value = value;
      },
    );
  }

  // Loại hình đơn vị
  CardInputTextFormWithLabel _buildInputUnitType() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_unitType.tr,
      controller: controller.unitTypeCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 100,
    );
  }

  // Ngành nghề sản xuất
  CardInputTextFormWithLabel _buildInputProductIndustry() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_productIndustry.tr,
      controller: controller.productIndustryCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 500,
    );
  }

  // Số quyết định
  CardInputTextFormWithLabel _buildInputDecisionNumber() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_decisionNumber.tr,
      controller: controller.decisionNumberCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 100,
    );
  }

  // Ngày lập
  CardInputSelectDateWithLabel _buildSelectDateSetup() {
    return CardInputSelectDateWithLabel(
      hintText: PATTERN_1,
      inputFormatters: InputFormatterEnum.dateFullBirthDay,
      labelText: LocaleKeys.registerCode_setupDate.tr,
      controller: controller.setupDateCtrl,
      isValidate: true,
      onSelectDate: () async {
        KeyBoard.hide();
        final selectedDate = await UtilWidget.showDateTimePicker(
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
    );
  }

  // Ngày đăng ký
  CardInputSelectDateWithLabel _buildSelectDateRegister() {
    return CardInputSelectDateWithLabel(
      hintText: PATTERN_1,
      inputFormatters: InputFormatterEnum.dateFullBirthDay,
      labelText: LocaleKeys.registerCode_registerDate.tr,
      controller: controller.registerDateCtrl,
      isValidate: true,
      onSelectDate: () async {
        KeyBoard.hide();
        final selectedDate = await UtilWidget.showDateTimePicker(
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
    );
  }

  // Nơi cấp quyết định
  CardInputTextFormWithLabel _buildInputAddressDecision() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_addressDecision.tr,
      controller: controller.addressDecisionCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 100,
    );
  }

  // Địa chỉ đăng ký kinh doanh
  CardInputTextFormWithLabel _buildInputAddressRegister() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_addressRegisterBusiness.tr,
      controller: controller.addressRegisterBusinessCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 500,
    );
  }

  // Địa chỉ đơn vị
  CardInputTextFormWithLabel _buildInputAddressUnit() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_addressUnit.tr,
      controller: controller.addressUnitCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 500,
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
        sdsSBHeight8,

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
  CardInputTextFormWithLabel _buildInputPhoneUnit() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_phoneUnit.tr,
      controller: controller.phoneUnitCtrl,
      isValidate: true,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.phoneNumber,
      maxLengthInputForm: 20,
    );
  }

  // Email đơn vị
  CardInputTextFormWithLabel _buildInputEmailUnit() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_emailUnit.tr,
      controller: controller.emailUnitCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.email,
      maxLengthInputForm: 50,
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
    );
  }

  // Người giao dịch BHXH
  CardInputTextFormWithLabel _buildInputPersonTransactionBHXH() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_personTransactionSocial.tr,
      controller: controller.personTransactionBhxhCtrl,
      isValidate: true,
      inputFormatters: InputFormatterEnum.textNormal,
      maxLengthInputForm: 100,
    );
  }

  // Điện thoại liên hệ
  CardInputTextFormWithLabel _buildInputContactPhone() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_phoneContact.tr,
      controller: controller.phoneContactCtrl,
      isValidate: true,
      textInputType: TextInputType.number,
      inputFormatters: InputFormatterEnum.phoneNumber,
      maxLengthInputForm: 20,
    );
  }
}
