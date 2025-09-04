import '../../../../../clean/core/presentation/widgets/widget_src.dart';
import '../../../src.dart';
import '../../notification_src.dart';
import '../enity_type.dart';

part 'notification_widget.dart';

class NotificationPage extends BaseGetPage<NotificationController> {
  NotificationPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.pageBuilder_notification.tr,
            textColor: AppColors.basicWhite,
          ),
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          actions: [
            Obx(
              () {
                return controller.isShowCheckbox.value
                    ? IconButton(
                        onPressed: () {
                          controller.selectedID.addAll(
                            controller.listNotification.map((noti) => noti.id),
                          );
                        },
                        icon: SDSBuildText(
                          LocaleKeys.notification_selectedAll.tr,
                          style: AppTextStyle.font12Re
                              .copyWith(color: AppColors.basicWhite),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _buildBtsActionNoti();
                        },
                        icon: const Icon(
                          size: AppDimens.sizeIcon28,
                          Icons.more_horiz,
                          color: AppColors.basicWhite,
                        ),
                      );
              },
            ),
            sdsSBWidth12,
          ],
          centerTitle: true,
        ),
        body: BaseCardBody(
          child: baseShowLoading(
            () => Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.defaultPadding),
              child: _buildBody(),
            ),
          ),
        ),
      ),
    );
  }
}
