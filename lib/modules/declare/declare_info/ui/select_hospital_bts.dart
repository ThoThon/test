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

  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: 'Chọn bệnh viện',
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
          UtilWidget.buildSolidButton(
            title: LocaleKeys.certificate_confirm.tr,
            onPressed: () {
              Get.back(result: controller.selectedHospital.value);
            },
          ),
          sdsSBHeight16,
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  Widget buildSearch() {
    return UtilWidget.buildTextInput(
      height: AppDimens.sizeDialogNotiIcon,
      controller: controller.searchTextCtrl,
      hintText: 'Nhập tên bệnh viện',
      textColor: AppColors.colorBlack,
      hintColor: AppColors.dsGray2,
      borderColor: AppColors.dsGray3,
      autofocus: false,
      fillColor: AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (value) {
        controller.keyword.value = TiengViet.parse(value.trim()).toLowerCase();
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.mainColors,
        size: AppDimens.sizeIconMedium,
      ),
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildItem(Hospital item) {
    return Obx(
      () {
        final isSelected = controller.selectedHospital.value == item;
        return InkWell(
          onTap: () {
            controller.selectedHospital.value = item;
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
