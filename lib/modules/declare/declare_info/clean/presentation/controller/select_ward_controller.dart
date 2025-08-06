import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/usecase/get_wards_use_case.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectWardControllerCl extends BaseGetClController {
  final SelectWardArgument argument;

  final GetWardsUseCase _getWardsUseCase;

  SelectWardControllerCl(
    this._getWardsUseCase, {
    required this.argument,
  }) {
    selectedWard.value = argument.selectedWard;
  }

  final isShowButtonClear = false.obs;
  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;
  final selectedWard = Rxn<Ward>();
  final wards = <Ward>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getWards();
  }

  Future<void> _getWards() async {
    return buildState(
      showLoading: true,
      action: () async {
        wards.value = await _getWardsUseCase.execute(
          GetWardsUseCaseInput(
            provinceCode: argument.provinceCode,
            districtCode: argument.districtCode,
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    searchTextCtrl.dispose();
    super.onClose();
  }
}
