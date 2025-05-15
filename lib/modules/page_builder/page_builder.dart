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
        const NotificationPage(),
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

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      _buildItem(
        index: 0,
        assetName: Assets.ASSETS_ICONS_HOME_IC_HOME_SVG,
        label: 'Trang chủ',
      ),
      _buildItem(
        index: 1,
        assetName: Assets.ASSETS_ICONS_HOME_IC_STATIS_SVG,
        label: 'Báo cáo',
      ),
      _buildItem(
        index: 2,
        assetName: Assets.ASSETS_ICONS_HOME_IC_NOTIFICATION_SVG,
        label: 'Thông báo',
      ),
      _buildItem(
        index: 3,
        assetName: Assets.ASSETS_ICONS_HOME_IC_PROFILE_SVG,
        label: 'Tài khoản',
      ),
    ];
  }
}
