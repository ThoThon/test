import 'package:tiengviet/tiengviet.dart';
import 'package:v_bhxh/modules/declare/declare_info/controller/select_hospital_controller.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectHospitalBts extends BaseGetWidget<SelectHospitalController> {
  SelectHospitalBts({
    super.key,
    required this.provinceCode,
    this.selectedHospital,
  });

  @override
  SelectHospitalController get controller => _controller;

  late final _controller = Get.put(
    SelectHospitalController(
      provinceCode: provinceCode,
      hospital: selectedHospital,
    ),
  );

  final String provinceCode;
  final Hospital? selectedHospital;
  final _isShowButtonClear = false.obs;

  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: LocaleKeys.declareInfo_selectHospital.tr,
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
                        final filteredHospitals = controller.hospitals
                            .where((item) => TiengViet.parse(item.name)
                                .toLowerCase()
                                .contains(controller.keyword.value))
                            .toList();

                        return ListView.separated(
                          itemCount: filteredHospitals.length,
                          itemBuilder: (context, index) {
                            final item = filteredHospitals[index];
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
        ],
      ).paddingAll(AppDimens.paddingVerySmall),
    );
  }

  Widget buildSearch() {
    return UtilWidget.buildTextInput(
      inputFormatters: [
        RegexpEmojiUtil.allowCommonCharacters,
      ],
      maxLength: 100,
      controller: controller.searchTextCtrl,
      hintText: LocaleKeys.declareInfo_inputHospitalName.tr,
      textColor: AppColors.colorBlack,
      hintColor: AppColors.dsGray2,
      borderColor: AppColors.primaryColor,
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
            color: AppColors.primaryColor,
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
                color: AppColors.primaryColor,
              ),
            ),
          )),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(Hospital item) {
    return Obx(
      () {
        final isSelected = controller.selectedHospital.value == item;
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
