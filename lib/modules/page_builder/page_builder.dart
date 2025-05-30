import 'package:v_bhxh/base_app/model/app_data.dart';
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
        // const Center(child: Text("Danh sách")),
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

  BottomNavigationBarItem _buildItem({
    required int index,
    required String assetName,
    required String label,
  }) {
    final isSelected = index == controller.pageIndex.value;
    final color = isSelected ? AppColors.primaryColor : AppColors.basicGrey1;

    return BottomNavigationBarItem(
      icon: index == 1
          ? _buildIconWithBadge(assetName, color)
          : SDSImageSvg(assetName, color: color),
      label: label,
    );
  }

  Widget _buildIconWithBadge(String assetName, Color color) {
    return Obx(
      () {
        final unreadCount = AppData.instance.totalUnread.value;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            SDSImageSvg(assetName, color: color),
            if (unreadCount > 0)
              Positioned(
                right: -10,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(width: 1, color: AppColors.colorWhite),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 20, minHeight: 16),
                  child: SDSBuildText(
                    unreadCount > 99 ? '99+' : '$unreadCount',
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
      },
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      _buildItem(
        index: 0,
        assetName: Assets.ASSETS_ICONS_HOME_IC_HOME_SVG,
        label: LocaleKeys.pageBuilder_home.tr,
      ),
      // _buildItem(
      //   index: 1,
      //   assetName: Assets.ASSETS_ICONS_HOME_IC_STATIS_SVG,
      //   label: LocaleKeys.pageBuilder_report.tr,
      // ),
      _buildItem(
        index: 1,
        assetName: Assets.ASSETS_ICONS_HOME_IC_NOTIFICATION_SVG,
        label: LocaleKeys.pageBuilder_notification.tr,
      ),
      _buildItem(
        index: 2,
        assetName: Assets.ASSETS_ICONS_HOME_IC_PROFILE_SVG,
        label: LocaleKeys.pageBuilder_account.tr,
      ),
    ];
  }
}
