import 'package:tiengviet/tiengviet.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectWardBts extends BaseGetWidget<SelectWardController> {
  SelectWardBts({
    super.key,
    required this.provinceCode,
    this.selectedWard,
  });

  @override
  SelectWardController get controller => _controller;

  late final _controller = Get.put(SelectWardController(
    provinceCode: provinceCode,
    ward: selectedWard,
  ));

  final String provinceCode;
  final Ward? selectedWard;
  final _isShowButtonClear = false.obs;

  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: LocaleKeys.declareInfo_selectWard.tr,
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
                        final filteredWards = controller.wards.where((item) {
                          final name = TiengViet.parse(item.name).toLowerCase();
                          final id = item.id.toLowerCase();
                          final query = controller.keyword.value;
                          return name.contains(query) || id.contains(query);
                        }).toList();

                        return ListView.separated(
                          itemCount: filteredWards.length,
                          itemBuilder: (context, index) {
                            final item = filteredWards[index];
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
      maxLength: 20,
      controller: controller.searchTextCtrl,
      hintText: LocaleKeys.declareInfo_inputWard.tr,
      textColor: AppColors.colorBlack,
      hintColor: AppColors.dsGray2,
      borderColor: AppColors.thumbColorSwitch,
      autofocus: false,
      fillColor: AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (value) {
        controller.keyword.value = TiengViet.parse(value.trim()).toLowerCase();
        _isShowButtonClear.value = value.isNotEmpty;
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
            visible: _isShowButtonClear.value,
            child: IconButton(
              onPressed: () {
                controller.searchTextCtrl.clear();
                controller.keyword.value = '';
                _isShowButtonClear.value = false;
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.thumbColorSwitch,
              ),
            ),
          )),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(Ward item) {
    return Obx(
      () {
        final isSelected = controller.selectedWard.value == item;
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
