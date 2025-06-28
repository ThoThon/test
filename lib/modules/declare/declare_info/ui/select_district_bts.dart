import 'package:tiengviet/tiengviet.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectDistrictBts extends BaseGetWidget<SelectDistrictController> {
  SelectDistrictBts({
    super.key,
    required this.provinceCode,
    this.selectedDistrict,
  });

  @override
  SelectDistrictController get controller => _controller;

  late final _controller = Get.put(SelectDistrictController(
    provinceCode: provinceCode,
    district: selectedDistrict,
  ));

  final String provinceCode;
  final DistrictModel? selectedDistrict;
  final _isShowButtonClear = false.obs;

  @override
  Widget buildWidgets(BuildContext context) {
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
          UtilWidget.buildSolidButton(
            title: LocaleKeys.certificate_confirm.tr,
            onPressed: () {
              Get.back(result: controller.selectedDistrict.value);
            },
          ),
          sdsSBHeight32,
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
      borderColor: AppColors.primaryColor,
      maxLength: 20,
      autofocus: false,
      fillColor: AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (value) {
        controller.keyword.value = TiengViet.parse(value.trim()).toLowerCase();
        _isShowButtonClear.value = value.isNotEmpty;
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.primaryColor,
        size: AppDimens.sizeIconMedium,
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
                color: AppColors.primaryColor,
              ),
            ),
          )),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(DistrictModel item) {
    return Obx(
      () {
        final isSelected = controller.selectedDistrict.value == item;
        return InkWell(
          onTap: () {
            controller.selectedDistrict.value = item;
          },
          child: Row(
            children: [
              Expanded(
                child: SDSBuildText(
                  item.name,
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
