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
      appBar: BaseAppBar(
        title: SDSBuildText(
          LocaleKeys.declaration_declarationSocial.tr,
          style: AppTextStyle.font16Bo,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingMedium),
        child: ListView(
          children: [
            SDSImageSvg(Assets.ASSETS_ICONS_HOME_HOME_SVG),
            sdsSBHeight32,
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
}
