import 'package:v_bhxh/modules/history_transaction/models/history_status_enum.dart';

import '../../src.dart';

class HistoryRegisterTabPage extends BaseGetWidget {
  HistoryRegisterTabPage({super.key});

  @override
  HistoryTransactionControllerICare get controller => _controller;

  late final _controller = Get.put(HistoryTransactionControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Expanded(
      child: UtilWidget.buildCardBase(
        baseShowLoading(
          () => UtilWidget.buildSmartRefresher(
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = controller.listHistoryRegister[index];
                return _buildCardItemHistory(item, index);
              },
              itemCount: controller.listHistoryRegister.length,
            ),
          ),
        ),
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  Widget _buildCardItemHistory(
    HistoryRegisterModel item,
    int index,
  ) {
    return InkWell(
      onTap: index == 0
          ? () {
              Get.toNamed(
                AppRoutes.historyRegisterDetail.path,
                arguments: item,
              )?.then(
                (value) async {
                  await controller.fetchListHistoryRegister();
                },
              );
            }
          : null,
      child: Row(
        children: [
          SDSImageSvg(
            color: index == 0 ? AppColors.primaryColor : AppColors.dsGray3,
            Assets.ASSETS_ICONS_IC_USER_SVG,
            width: AppDimens.sizeIconMedium,
            height: AppDimens.sizeIconMedium,
          ).paddingOnly(right: AppDimens.paddingVerySmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextUtils(
                      text:
                          "${item.toKhai}${LocaleKeys.historyRegister_number.tr}",
                      availableStyle: StyleEnum.bodyRegular,
                    ),
                    Flexible(
                      child: TextUtils(
                        text: item.soHoSo,
                        availableStyle: StyleEnum.bodyBold,
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                TextUtils(
                  text: changeDateString(item.thoiGianGui, pattern: PATTERN_9),
                  maxLine: 1,
                  availableStyle: StyleEnum.detailRegular,
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                Row(
                  children: [
                    TextUtils(
                      text: "${LocaleKeys.historyRegister_status.tr}: ",
                      availableStyle: StyleEnum.detailRegular,
                    ),
                    TextUtils(
                      text: item.trangThai.titleStatus,
                      availableStyle: StyleEnum.bodyBold,
                      color: item.trangThai.historyStatusColor,
                    ),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: index == 0,
            child: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
              height: AppDimens.sizeIcon,
              width: AppDimens.sizeIcon,
            ),
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }
}
