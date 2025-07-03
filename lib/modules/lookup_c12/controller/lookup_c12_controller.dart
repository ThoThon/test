import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/lookup_c12/model/file_c12_model.dart';
import 'package:v_bhxh/modules/lookup_c12/repository/lookup_c12_repository.dart';
import 'package:v_bhxh/modules/src.dart';

class LookupC12Controller extends BaseGetxController {
  final selectedYear = DateTime.now().obs;

  final listFileC12 = <FileC12Model>[].obs;

  late final _lookupC12Repository = LookupC12Repository(this);

  @override
  void onInit() {
    super.onInit();
    getC12File();
  }

  void pickPeriodDate() async {
    final date = await UtilWidget.showYearLookUp(
      dateTime: selectedYear.value,
    );
    if (date != null) {
      selectedYear.value = DateTime(date);
      listFileC12.clear();
      getC12File();
    }
  }

  Future<void> getC12File() async {
    showLoadingOverlay();
    try {
      final response =
          await _lookupC12Repository.getC12File(selectedYear.value.year);
      if (response.result.isNotEmpty && response.isSuccess) {
        listFileC12.addAll(response.result);
        Get.rawSnackbar(
          titleText: const SizedBox.shrink(),
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tra cứu thành công',
                style: AppTextStyle.font14Re.copyWith(
                  color: AppColors.basicWhite,
                ),
              ),
              TextButton(
                onPressed: () => Get.closeCurrentSnackbar(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(
                    AppDimens.sizeIconDefault,
                    AppDimens.sizeIconDefault,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Đóng',
                  style: AppTextStyle.font14Bo.copyWith(
                    color: AppColors.basicWhite,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.dsGray2,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          padding: const EdgeInsets.only(
            left: AppDimens.paddingSmall,
            right: AppDimens.paddingSmall,
            top: AppDimens.paddingVerySmall,
            bottom: AppDimens.paddingSmall,
          ),
          borderRadius: AppDimens.radius8,
        );
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
