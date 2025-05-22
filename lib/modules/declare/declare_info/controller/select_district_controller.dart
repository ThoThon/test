import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/shares/function/logger.dart';

// Key is provinceCode
final cachedDistricts = <String, List<DistrictModel>>{};

class SelectDistrictController extends BaseGetxController {
  final String provinceCode;

  SelectDistrictController({
    required this.provinceCode,
  });

  late final _repository = DeclareInfoRepository(this);

  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;
  final selectedDistrict = Rxn<DistrictModel>();
  final districts = <DistrictModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getDistricts();
  }

  Future<void> _getDistricts() async {
    if (cachedDistricts.containsKey(provinceCode)) {
      districts.value = cachedDistricts[provinceCode]!;
      return;
    }

    try {
      showLoading();
      final response = await _repository.getDistricts(
        provinceCode: provinceCode,
      );
      if (response.isSuccess) {
        districts.value = response.result;
        cachedDistricts[provinceCode] = response.result;
      } else {
        showSnackBar(
          response.errorMessage ?? LocaleKeys.app_someThingWentWrong.tr,
        );
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  @override
  void onClose() {
    searchTextCtrl.dispose();
    super.onClose();
  }
}
