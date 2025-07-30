import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';

class DeclarationPeriodController extends BaseGetClController {
  final GetDeclarationPeriodsUseCase _getDeclarationPeriodsUseCase;
  final Procedure argument;

  final declarationPeriods = <DeclarationPeriod>[].obs;
  final selectedPeriodDate = DateTime.now().obs;

  DeclarationPeriodController(
    this._getDeclarationPeriodsUseCase, {
    required this.argument,
  });

  @override
  void onReady() {
    super.onReady();
    getDeclarationPeriods();
  }

  // Future<void> _getProcedures() {
  //   return buildState(
  //     showLoading: true,
  //     action: () async {
  //       procedures.value = await _getProceduresUseCase.execute();
  //     },
  //   );
  // }
  Future<void> getDeclarationPeriods() {
    return buildState(
      showLoading: true,
      action: () async {
        declarationPeriods.clear();
        declarationPeriods.value = await _getDeclarationPeriodsUseCase.execute(
          GetDeclarationPeriodsUseCaseInput(
            year: selectedPeriodDate.value.year,
            month: selectedPeriodDate.value.month,
            periodId: argument.type.toInt,
          ),
        );
      },
    );
  }
}
