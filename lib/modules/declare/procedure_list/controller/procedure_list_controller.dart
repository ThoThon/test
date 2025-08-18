import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/procedure_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/repository/procedure_list_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';

import '../../../../base_app/base_app.src.dart';

class ProcedureListController extends BaseGetxController {
  late final _repository = ProcedureListRepository(this);

  final procedures = <Procedure>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getListProcedure();
  }

  Future<void> _getListProcedure() async {
    showLoading();
    try {
      final response = await _repository.getListProcedure();
      if (response.isSuccess) {
        procedures.value = response.result;
        procedures.add(
          const Procedure(
            name: 'Thủ tục 630c',
            parentName: 'Thủ tục 630c',
            type: 1664,
            code: 'Thủ tục 630c',
            note: 'Ảo thật đấy',
          ),
        );
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
}
