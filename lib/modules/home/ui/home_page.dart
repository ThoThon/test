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
      appBar: BaseAppBar(
        title: Row(
          children: [
            SDSBuildText("Xin chào "),
            SDSBuildText(
              controller.appController.accountInfoModel?.tenToChuc ?? '',
              style: AppTextStyle.font16Bo.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingMedium),
        child: ListView(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: AppDimens.defaultPadding,
              crossAxisSpacing: AppDimens.defaultPadding,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.8,
              children:
                  HomeEnum.values.map((item) => _buildMenuItem(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(HomeEnum item) {
    return InkWell(
      onTap: () {
        Get.toNamed(item.path);
      },
      child: UtilWidget.buildCardBase(
        Center(
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
                child: SDSImageSvg(
                  item.image,
                  height: AppDimens.sizeCardItem,
                ),
              ),
              Expanded(
                child: SDSBuildText(
                  item.string.tr,
                  style: AppTextStyle.font14Bo,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDrawer(
    IconData? icon,
    String text,
  ) {
    return Row(
      children: [
        Icon(icon),
        sdsSBWidth8,
        InkWell(
          child: SDSBuildText(
            text,
            style: AppTextStyle.font16Bo,
          ),
        )
      ],
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  Widget _buildDrawer() {
    final accountInfo = controller.appController.accountInfoModel;

    return Drawer(
      backgroundColor: AppColors.basicWhite,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
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
                      accountInfo?.tenToChuc.toUpperCase() ?? '',
                      style: AppTextStyle.font18Bo,
                      maxLines: 3,
                    ),
                    SDSBuildText(
                      "MST: ${accountInfo?.taxCode ?? ''}",
                      style: AppTextStyle.font16Bo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          sdsSBHeight32,
          _buildItemDrawer(
            Icons.language,
            'Ngôn ngữ',
          ),
          _buildItemDrawer(
            Icons.lock,
            'Đổi mật khẩu',
          ),
          _buildItemDrawer(
            Icons.phone,
            'CSKH: 1900 1900',
          ),
          _buildItemDrawer(
            Icons.switch_account,
            'Đổi tài khoản',
          ),
          // _buildItemDrawer(
          //   Icons.logout,
          //   'Đăng xuất',
          // ),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }
}
