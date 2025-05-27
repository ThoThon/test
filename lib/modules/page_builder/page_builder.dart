import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/notification/ui/notification_page.dart';
import 'package:v_bhxh/modules/src.dart';

class PageBuilder extends BaseGetWidget<PageBuilderController> {
  PageBuilder({super.key});

  @override
  PageBuilderController get controller => _controller;

  late final _controller = Get.put(PageBuilderController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  //Thêm PageStorageKey vào key của page để lưu trạng thái page hiện tại
  Widget _buildBody() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      onPageChanged: controller.changePage,
      children: [
        HomePage(),
        const Center(child: Text("Danh sách")),
        NotificationPage(),
        ProfilePage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.basicGrey1,
          currentIndex: controller.pageIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          onTap: controller.changePage,
          items: _navBarsItems(),
        );
      },
    );
  }

  // BottomNavigationBarItem _buildItem({
  //   required int index,
  //   required String assetName,
  //   required String label,
  // }) {
  //   return BottomNavigationBarItem(
  //     icon: SDSImageSvg(
  //       assetName,
  //       color: index == controller.pageIndex.value
  //           ? AppColors.primaryColor
  //           : AppColors.basicGrey1,
  //     ),
  //     label: label,
  //   );
  // }

  BottomNavigationBarItem _buildItem({
    required int index,
    required String assetName,
    required String label,
  }) {
    if (index == 2) {
      return BottomNavigationBarItem(
        icon: Obx(() {
          final unreadCount = controller.appController.totalUnread;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              SDSImageSvg(
                assetName,
                color: index == controller.pageIndex.value
                    ? AppColors.primaryColor
                    : AppColors.basicGrey1,
              ),
              if (unreadCount! > 0)
                Positioned(
                  right: -10,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.colorWhite,
                      ),
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 16,
                    ),
                    child: SDSBuildText(
                      unreadCount > 99 ? '99+' : unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          );
        }),
        label: label,
      );
    } else {
      return BottomNavigationBarItem(
        icon: SDSImageSvg(
          assetName,
          color: index == controller.pageIndex.value
              ? AppColors.primaryColor
              : AppColors.basicGrey1,
        ),
        label: label,
      );
    }
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      _buildItem(
        index: 0,
        assetName: Assets.ASSETS_ICONS_HOME_IC_HOME_SVG,
        label: LocaleKeys.pageBuilder_home.tr,
      ),
      _buildItem(
        index: 1,
        assetName: Assets.ASSETS_ICONS_HOME_IC_STATIS_SVG,
        label: LocaleKeys.pageBuilder_report.tr,
      ),
      _buildItem(
        index: 2,
        assetName: Assets.ASSETS_ICONS_HOME_IC_NOTIFICATION_SVG,
        label: LocaleKeys.pageBuilder_notification.tr,
      ),
      _buildItem(
        index: 3,
        assetName: Assets.ASSETS_ICONS_HOME_IC_PROFILE_SVG,
        label: LocaleKeys.pageBuilder_account.tr,
      ),
    ];
  }
}
