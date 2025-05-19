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
                      _buildInputName(),
                      UtilWidget.sizedBox16,
                      _buildInputFullName(),
                      UtilWidget.sizedBox16,
                      _buildInputBHXHNumber(),
                      UtilWidget.sizedBox16,
                      _buildInputDocumentType(),
                      UtilWidget.sizedBox16,
                      _buildInputDocumentNumber(),
                      UtilWidget.sizedBox16,
                      UtilWidget.buildSelectDate(
                        'Ngày ban hành',
                        hintText: PATTERN_1,
                        date: convertDateToStringSafe(
                          controller.dateOfIssue.value,
                          PATTERN_1,
                        ),
                        onTap: () {},
                      ),
                      UtilWidget.sizedBox16,
                      UtilWidget.buildSelectDate(
                        'Ngày hiệu lực',
                        hintText: PATTERN_1,
                        date: convertDateToStringSafe(
                          controller.effectiveDate.value,
                          PATTERN_1,
                        ),
                        onTap: () {},
                      ),
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

  Widget _buildInputName() {
    return BuildInputTextWithLabel(
      label: 'Tên bảng kê',
      buildInputText: BuildInputText(
        InputTextModel(controller: controller.nameTextCtrl),
      ),
    );
  }

  Widget _buildInputFullName() {
    return BuildInputTextWithLabel(
      label: 'Họ và tên',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.fullNameTextCtrl,
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
          controller: controller.bhxhTextCtrl,
        ),
      ),
    );
  }

  Widget _buildInputDocumentType() {
    return BuildInputTextWithLabel(
      label: 'Tên loại văn bản',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.documentTypeTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputDocumentNumber() {
    return BuildInputTextWithLabel(
      label: 'Số văn bản',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.documentNumberTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputIssuingAgency() {
    return BuildInputTextWithLabel(
      label: 'Cơ quan ban hành',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.issuingAgencyTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputSummary() {
    return BuildInputTextWithLabel(
      label: 'Trích yếu',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.summaryTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildInputContent() {
    return BuildInputTextWithLabel(
      label: 'Nội dung thẩm định',
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.contentTextCtrl,
          isValidate: true,
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Lưu',
            onPressed: () {
              Get.back();
            },
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Đóng',
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
