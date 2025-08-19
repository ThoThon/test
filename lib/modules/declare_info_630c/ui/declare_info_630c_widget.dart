part of 'declare_info_630c_page.dart';

extension DeclareInfo630cWidget on DeclareInfo630cPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildGroupPersonInfo(),
                _buildDeclareInfoGroup(),
                _buildBenefitAccountInfoGroup(),
              ],
            ),
          ),
        ),
        UtilWidget.buildSolidButton(
          onPressed: () {},
          title: 'Tiếp tục',
          borderRadius: AppDimens.radius30,
        ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
