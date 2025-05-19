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
        title: RichText(
          text: TextSpan(
            style: AppTextStyle.font20Bo,
            children: [
              TextSpan(text: LocaleKeys.home_hello.tr),
              TextSpan(
                text: ' ${controller.accountInfo?.tenToChuc}',
                style: AppTextStyle.font20Bo
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        centerTitle: false,
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
              physics: const NeverScrollableScrollPhysics(),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingSmall),
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
          ),
        )
      ],
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.basicWhite,
      child: Column(
        children: [
          Row(
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
          ),
          sdsSBHeight32,
          _buildItemDrawer(
            Icons.language,
            LocaleKeys.home_langugue.tr,
          ),
          _buildItemDrawer(
            Icons.lock,
            LocaleKeys.home_changePassword.tr,
          ),
          _buildItemDrawer(
            Icons.phone,
            LocaleKeys.home_support.tr,
          ),
          _buildItemDrawer(
            Icons.switch_account,
            LocaleKeys.home_changeAccount.tr,
          ),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }
}
