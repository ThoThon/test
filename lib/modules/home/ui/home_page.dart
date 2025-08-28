import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:upgrader/upgrader.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller.src.dart';
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
    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(days: 1),
        // Ngôn ngữ của dialog sẽ theo ngôn ngữ của app thay vì của hệ thống
        messages: UpgraderMessages(code: 'vi'),
        // Force update bằng minAppVersion
        minAppVersion:
            kDebugMode ? null : RemoteConfigStorage.instance.minAppVersion,
      ),
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
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
                  children: HomeEnum.values
                      .map((item) => _buildMenuItem(item))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(HomeEnum item) {
    return InkWell(
      onTap: () {
        Get.toNamed(item.path);
      },
      child: UtilWidget.buildCardBase(
        Stack(
          children: [
            Positioned(
              top: AppDimens.paddingSmall,
              left: AppDimens.paddingSmall,
              child: SDSBuildText(
                item.string.tr,
                style: AppTextStyle.font14Re,
              ),
            ),
            Positioned(
              bottom: AppDimens.paddingSmallest,
              right: AppDimens.paddingSmallest,
              child: SDSImageSvg(
                item.image,
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingVerySmall,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            sdsSBWidth8,
            Expanded(
              child: SDSBuildText(
                text,
                style: AppTextStyle.font16Re,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.basicWhite,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Spacer(),
            SDSBuildText(
              '${LocaleKeys.home_version.tr} ${packageInfo.version}',
              style: AppTextStyle.font16Re,
            ),
            sdsSBHeight16,
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
        IconButton(
          onPressed: controller.goToNotificationPage,
          icon: Obx(
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
                          border:
                              Border.all(width: 2, color: AppColors.colorWhite),
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
        sdsSBWidth8,
      ],
    );
  }
}
