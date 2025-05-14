part of 'declare_info_page.dart';

extension D01TabWidget on DeclareInfoPage {
  Widget _buildD01TabBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...controller.d01State.checkLists.mapIndexed(
                  (index, checkList) {
                    return Container(
                      padding: EdgeInsets.all(AppDimens.defaultPadding),
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.white : Colors.grey[100],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SDSBuildText(
                                  checkList.title,
                                  style: AppTextStyle.font16Semi,
                                ),
                                SDSBuildText(
                                  checkList.user,
                                  style: AppTextStyle.font16Re,
                                ),
                              ],
                            ),
                          ),
                          UtilWidget.buildSolidButtonBack(
                            title: 'Sửa',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      UtilWidget.sizedBoxWidth16,
                      SDSBuildText(
                        'Thêm mới bảng kê',
                        style: AppTextStyle.font16Re,
                      ),
                    ],
                  ).paddingSymmetric(
                    vertical: AppDimens.paddingVerySmall,
                    horizontal: AppDimens.defaultPadding,
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildD01BottomButtons(),
      ],
    );
  }

  Widget _buildD01BottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Lưu nháp',
            onPressed: () {},
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Tiếp theo',
            onPressed: () {},
          ),
        ),
      ],
    ).paddingOnly(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      top: AppDimens.defaultPadding,
    );
  }
}
