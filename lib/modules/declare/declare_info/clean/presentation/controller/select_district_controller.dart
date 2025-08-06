import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/usecase/get_districts_use_case.dart';

class SelectDistrictControllerCl extends BaseGetClController {
  final SelectDistrictArgument argument;

  final GetDistrictsUseCase _getDistrictsUseCase;

  SelectDistrictControllerCl(
    this._getDistrictsUseCase, {
    required this.argument,
  }) {
    selectedDistrict.value = argument.selectedDistrict;
  }

  final isShowButtonClear = false.obs;
  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;
  final selectedDistrict = Rxn<District>();
  final districts = <District>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getDistricts();
  }

  Future<void> _getDistricts() {
    return buildState(
      showLoading: true,
      action: () async {
        districts.value =
            await _getDistrictsUseCase.execute(argument.provinceCode);
      },
    );
  }

  @override
  void onClose() {
    searchTextCtrl.dispose();
    super.onClose();
  }
}
