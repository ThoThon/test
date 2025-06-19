import 'package:tiengviet/tiengviet.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectWardBts extends BaseGetWidget<SelectWardController> {
  SelectWardBts({
    super.key,
    required this.provinceCode,
    required this.districtCode,
    this.selectedWard,
  });

  @override
  SelectWardController get controller => _controller;

  late final _controller = Get.put(SelectWardController(
    provinceCode: provinceCode,
    districtCode: districtCode,
    ward: selectedWard,
  ));

  final String provinceCode;
  final String districtCode;
  final WardModel? selectedWard;

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
                        final filteredWards = controller.wards
                            .where((item) => TiengViet.parse(item.name)
                                .toLowerCase()
                                .contains(controller.keyword.value))
                            .toList();

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
          UtilWidget.buildSolidButton(
            title: LocaleKeys.certificate_confirm.tr,
            onPressed: () {
              Get.back(result: controller.selectedWard.value);
            },
          ),
          sdsSBHeight32,
        ],
      ).paddingAll(AppDimens.paddingVerySmall),
    );
  }

  Widget buildSearch() {
    return UtilWidget.buildTextInput(
      maxLength: 20,
      controller: controller.searchTextCtrl,
      hintText: LocaleKeys.declareInfo_inputWard.tr,
      textColor: AppColors.colorBlack,
      hintColor: AppColors.dsGray2,
      borderColor: AppColors.primaryColor,
      autofocus: false,
      fillColor: AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (value) {
        controller.keyword.value = TiengViet.parse(value.trim()).toLowerCase();
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.primaryColor,
        size: AppDimens.sizeIconMedium,
      ),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(WardModel item) {
    return Obx(
      () {
        final isSelected = controller.selectedWard.value == item;
        return InkWell(
          onTap: () {
            controller.selectedWard.value = item;
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
