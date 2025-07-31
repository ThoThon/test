import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sdsSBHeight16,
        SDSBuildText(
          LocaleKeys.home_home.tr,
          style: AppTextStyle.font16Bo,
        ).paddingOnly(left: AppDimens.defaultPadding),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.defaultPadding),
            child: ListView(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: Get.context?.isTablet ?? false ? 3 : 2,
                  mainAxisSpacing: AppDimens.padding24,
                  crossAxisSpacing: AppDimens.padding24,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.55,
                  children: [
                    _buildMenuItem(
                      HomeMenuItem(
                        assetImage: Assets.ASSETS_ICONS_HOME_UNIT_INFO_SVG,
                        title: LocaleKeys.home_unitInfo,
                        onPressd: () {
                          Get.toNamed(AppRoutesCl.infoUnit.path);
                        },
                      ),
                    ),
                    _buildMenuItem(
                      HomeMenuItem(
                        assetImage: Assets.ASSETS_ICONS_HOME_DECLARATION_SVG,
                        title: LocaleKeys.home_procedureList,
                        onPressd: () {
                          Get.toNamed(AppRoutesCl.procedureList.path);
                        },
                      ),
                    ),
                    _buildMenuItem(
                      HomeMenuItem(
                        assetImage: Assets.ASSETS_ICONS_HOME_HISTORY_SVG,
                        title: LocaleKeys.home_history,
                        onPressd: () {
                          Get.toNamed(AppRoutesCl.history.path);
                        },
                      ),
                    ),
                    _buildMenuItem(
                      HomeMenuItem(
                        assetImage: Assets.ASSETS_ICONS_HOME_LOOKUP_C12_SVG,
                        title: LocaleKeys.home_lookupC12,
                        onPressd: () {
                          Get.toNamed(AppRoutesCl.lookupC12.path);
                        },
                      ),
                    ),
                    _buildMenuItem(
                      HomeMenuItem(
                        assetImage:
                            Assets.ASSETS_ICONS_HOME_IC_REGISTER_SERVICE_SVG,
                        title: LocaleKeys.home_registerService,
                        onPressd: () {
                          Get.toNamed(AppRoutesCl.registerService.path);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(HomeMenuItem item) {
    return InkWell(
      onTap: item.onPressd,
      child: UtilWidget.buildCardBase(
        Stack(
          children: [
            Positioned(
              top: AppDimens.paddingSmall,
              left: AppDimens.paddingSmall,
              child: SDSBuildText(
                item.title.tr,
                style: AppTextStyle.font14Re,
              ),
            ),
            Positioned(
              bottom: AppDimens.paddingSmallest,
              right: AppDimens.paddingSmallest,
              child: SDSImageSvg(
                item.assetImage,
                height: 56,
                width: 56,
              ),
            ),
          ],
        ),
        gradient: AppColors.gradientGray,
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
                Get.toNamed(AppRoutesCl.profile.path);
              },
            ),
            _buildItemDrawer(
              icon: Icons.book_outlined,
              text: LocaleKeys.home_guide.tr,
              onTap: () {
                controller.goToGuideViewPdf();
              },
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
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  AppData.instance.accountInfoModel.value?.tenToChuc
                          .toUpperCase() ??
                      '',
                  style: AppTextStyle.font16Re,
                  maxLines: 3,
                ),
                SDSBuildText(
                  "${LocaleKeys.home_taxCode.tr}: ${AppData.instance.accountInfoModel.value?.taxCode ?? ''}",
                  style: AppTextStyle.font16Re,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 32,
              color: AppColors.colorBlack,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(16),
        child: SizedBox(height: 0),
      ),
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      iconTheme: const IconThemeData(
        color: AppColors.colorBlack,
        size: AppDimens.sizeIcon,
      ),
      backgroundColor: AppColors.basicWhite,
      title: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SDSBuildText(
                '${AppData.instance.accountInfoModel.value?.tenToChuc}',
                style: AppTextStyle.font16Bo.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
              sdsSBHeight4,
              SDSBuildText(
                'MST: ${AppData.instance.accountInfoModel.value?.taxCode}',
                style: AppTextStyle.font14Re,
              ),
              sdsSBHeight12,
            ],
          ).paddingOnly(top: AppDimens.defaultPadding)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppDimens.paddingMedium),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutesCl.notification.path);
            },
            child: Obx(
              () {
                final unreadCount = AppData.instance.totalUnread.value;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SDSImageSvg(
                      Assets.ASSETS_ICONS_HOME_IC_NOTIFICATION_SVG,
                      color: AppColors.colorBlack,
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
    );
  }
}
