import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/home/controller/home_controller.dart';

import '../../../modules/src.dart';
import '../src.dart';

class HomePage extends BaseGetWidget<HomeController> {
  HomePage({super.key});

  @override
  HomeController get controller => _controller;

  late final _controller = Get.put(HomeController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.padding32,
        horizontal: AppDimens.paddingVerySmall,
      ),
      child: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: AppDimens.defaultPadding,
            crossAxisSpacing: AppDimens.defaultPadding,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.95,
            children:
                HomeEnum.values.map((item) => _buildMenuItem(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(HomeEnum item) {
    return InkWell(
      onTap: () {
        Get.toNamed(item.path);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingSmall,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius22),
              ),
              child: SDSImageSvg(
                item.image,
                height: AppDimens.sizeIcon60,
              ),
            ),
          ),
          sdsSBHeight8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SDSBuildText(
              item.string.tr,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.font14Bo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemDrawer({
    Function()? onTap,
    IconData? icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon),
        sdsSBWidth8,
        InkWell(
          onTap: onTap,
          child: SDSBuildText(
            text,
            style: AppTextStyle.font16Re,
          ),
        )
      ],
    ).paddingOnly(bottom: AppDimens.paddingMedium);
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.basicWhite,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: Column(
          children: [
            sdsSBHeight32,
            _buildCompanyName(),
            sdsSBHeight32,
            _buildItemDrawer(
              icon: Icons.account_circle_outlined,
              text: LocaleKeys.home_accountInfo.tr,
              onTap: () {
                Get.toNamed(AppRoutes.profile.path);
              },
            ),
            // _buildItemDrawer(
            //   icon: Icons.lock_outline,
            //   text: LocaleKeys.home_changePassword.tr,
            // ),
            _buildItemDrawer(
              icon: Icons.book_outlined,
              text: LocaleKeys.home_guide.tr,
            ),
            _buildItemDrawer(
              icon: Icons.phone_outlined,
              text: LocaleKeys.home_support.tr,
            ),
            _buildItemDrawer(
              text: LocaleKeys.login_logout.tr,
              icon: Icons.logout,
              onTap: controller.showDialogLogout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: SDSImageSvg(
            Assets.ASSETS_ICONS_IC_USER_SVG,
            color: AppColors.basicWhite,
          ).paddingAll(AppDimens.defaultPadding),
        ),
        sdsSBWidth12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SDSBuildText(
                controller.accountInfo?.tenToChuc.toUpperCase() ?? '',
                style: AppTextStyle.font16Re,
                maxLines: 3,
              ),
              SDSBuildText(
                "${LocaleKeys.home_taxCode.tr}: ${controller.accountInfo?.taxCode ?? ''}",
                style: AppTextStyle.font16Re,
              ),
            ],
          ),
        ),
      ],
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: AppDimens.sizeIcon32,
      ),
      backgroundColor: AppColors.primaryColor,
      title: SDSBuildText(
        '${controller.accountInfo?.tenToChuc}',
        style: AppTextStyle.font20Bo.copyWith(
          color: AppColors.basicWhite,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppDimens.paddingMedium),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.notification.path);
            },
            child: Obx(
              () {
                final unreadCount = AppData.instance.totalUnread.value;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SDSImageSvg(
                      Assets.ASSETS_ICONS_HOME_IC_NOTIFICATION_SVG,
                      color: AppColors.basicWhite,
                    ),
                    if (unreadCount > 0)
                      Positioned(
                        right: -10,
                        top: -10,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            border: Border.all(
                                width: 2, color: AppColors.colorWhite),
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
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
