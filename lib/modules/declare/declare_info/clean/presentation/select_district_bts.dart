import 'package:tiengviet/tiengviet.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings_factory.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/base_get_bts_dialog.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/presentation/binding/select_district_binding.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/presentation/controller/select_district_controller.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectDistrictBtsCl extends BaseGetBtsDialog<SelectDistrictControllerCl> {
  SelectDistrictBtsCl({super.key});

  @override
  BaseBindingsFactory get bindingFactory => SelectDistrictBinding();

  @override
  Widget buildPage(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: LocaleKeys.declareInfo_selectDistrict.tr,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                buildSearch(),
                Expanded(
                  child: baseShowLoading(
                    () => Obx(
                      () {
                        final filteredDistricts = controller.districts
                            .where((item) => TiengViet.parse(item.name)
                                .toLowerCase()
                                .contains(controller.keyword.value))
                            .toList();

                        return ListView.separated(
                          itemCount: filteredDistricts.length,
                          itemBuilder: (context, index) {
                            final item = filteredDistricts[index];
                            return _buildItem(item);
                          },
                          separatorBuilder: (context, index) =>
                              UtilWidget.buildDividerDefault(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          sdsSBHeight20,
        ],
      ).paddingAll(AppDimens.paddingVerySmall),
    );
  }

  Widget buildSearch() {
    return UtilWidget.buildTextInput(
      inputFormatters: [
        RegexpEmojiUtil.allowCommonCharacters,
      ],
      controller: controller.searchTextCtrl,
      hintText: LocaleKeys.declareInfo_inputDistrict.tr,
      textColor: AppColors.colorBlack,
      hintColor: AppColors.dsGray2,
      borderColor: AppColors.thumbColorSwitch,
      maxLength: 20,
      autofocus: false,
      fillColor: AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (value) {
        controller.keyword.value = TiengViet.parse(value.trim()).toLowerCase();
        controller.isShowButtonClear.value = value.isNotEmpty;
      },
      prefixIcon: SizedBox(
        height: AppDimens.sizeIconDefault,
        width: AppDimens.sizeIconDefault,
        child: Center(
          child: SDSImageSvg(
            Assets.ASSETS_ICONS_IC_SEARCH_SVG,
            color: AppColors.thumbColorSwitch,
          ),
        ),
      ),
      suffixIcon: Obx(() => Visibility(
            visible: controller.isShowButtonClear.value,
            child: IconButton(
              onPressed: () {
                controller.searchTextCtrl.clear();
                controller.keyword.value = '';
                controller.isShowButtonClear.value = false;
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.thumbColorSwitch,
              ),
            ),
          )),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(District item) {
    return Obx(
      () {
        final isSelected = controller.selectedDistrict.value == item;
        return InkWell(
          onTap: () {
            Get.back(result: item);
          },
          child: Row(
            children: [
              Expanded(
                child: SDSBuildText(
                  '${item.id} - ${item.name}',
                ).paddingSymmetric(
                  vertical: AppDimens.paddingSmall,
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_outlined,
                  color: AppColors.primaryColor,
                ),
            ],
          ),
        );
      },
    );
  }
}
