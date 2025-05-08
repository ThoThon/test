import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';
import 'package:v_bhxh/modules/home/controller/home_controller.dart';

import '../src.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  IcareHomeController get controller => _controller;
  late final _controller = Get.put(IcareHomeController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BaseAppBar(
          title: LocaleKeys.declaration_declarationSocial,
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
                children: HomeEnum.values
                    .map((item) => _buildMenuItem(item))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(HomeEnum item) {
    return InkWell(
      onTap: () {
        // await controller.fetchInfoCompany();
        Get.toNamed(
          item.path,
          arguments: _controller.getArguments(item),
        );
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
                child: TextUtils(
                  text: item.string,
                  availableStyle: StyleEnum.bodyBold,
                  maxLine: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
