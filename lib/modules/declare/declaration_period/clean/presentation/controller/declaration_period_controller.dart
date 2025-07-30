import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';
import 'package:v_bhxh/shares/widgets/date_picker/date_picker_utils.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

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

  void pickPeriodDate() async {
    final date = await DatePickerUtils.showCalendarPicker(
      title: LocaleKeys.dialog_selectMonthYear.tr,
      dateFormat: PATTERN_12,
      dateTimeInit: selectedPeriodDate.value,
    );
    if (date != null) {
      selectedPeriodDate.value = date;
      getDeclarationPeriods();
    }
  }

  void showDialogDeletePeriod(DeclarationPeriod period) {
    ShowDialog.showDialogConfirm2(
      title:
          '${LocaleKeys.declarationPeriod_delete.tr} "${LocaleKeys.declarationPeriod_period.tr} ${period.period}"?',
      content: LocaleKeys.declarationPeriod_contentDeletePeriod.tr,
      confirmTitle: LocaleKeys.declarationPeriod_delete.tr,
      backgroundColorBack: AppColors.basicWhite,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      onConfirm: () {
        deleteDeclarationPeriod(period);
      },
    );
  }

  Future<void> deleteDeclarationPeriod(DeclarationPeriod period) async {
    // try {
    //   showLoadingOverlay();
    //   final response = await _repository.deleteDeclarationPeriod(
    //     id: period.id,
    //   );

    //   if (response.isSuccess) {
    //     showSnackBar(
    //       LocaleKeys.declarationPeriod_contentDeletePeriodSuccess.tr,
    //       typeAction: AppConst.actionSuccess,
    //     );
    //     getDeclarationPeriods();
    //   } else {
    //     showSnackBar(response.errorMessage);
    //   }
    // } catch (e) {
    //   logger.e(e);
    // } finally {
    //   hideLoadingOverlay();
    // }
  }

  Future<void> createDeclarationPeriod() async {
    // try {
    //   showLoadingOverlay();
    //   final response = await _repository.createDeclarationPeriod(
    //     request: CreateDeclarationPeriodRequest(
    //       maThuTuc: argument.type.toInt,
    //       nam: selectedPeriodDate.value.year,
    //       thang: selectedPeriodDate.value.month,
    //     ),
    //   );

    //   if (response.isSuccess && response.result != null) {
    //     final String path = switch (argument.type) {
    //       ProcedureType.procedure600 => AppRoutes.declareInfo.path,
    //       ProcedureType.procedure607 ||
    //       ProcedureType.procedure608 ||
    //       ProcedureType.procedure610 ||
    //       ProcedureType.procedure612 ||
    //       ProcedureType.procedure613 =>
    //         AppRoutes.declareInfo607.path,
    //     };

    //     Get.toNamed(
    //       path,
    //       arguments: DeclareInfoArgument(
    //         declarationPeriodId: response.result!.id,
    //         action: D02ActionEnum.addPeriodFromDeclarePeriod,
    //         procedureType: argument.type,
    //       ),
    //     )?.whenComplete(() {
    //       // Refresh the list of declaration periods after creating a new one
    //       getDeclarationPeriods();
    //     });
    //   }
    // } catch (e) {
    //   logger.e(e);
    // } finally {
    //   hideLoadingOverlay();
    // }
  }

  Future<void> editDeclarationPeriod(DeclarationPeriod period) async {
    // Get.toNamed(
    //   AppRoutes.staffList.path,
    //   arguments: StaffListArgument(
    //     declarationPeriodId: period.id,
    //     procedureType: period.procedureType,
    //   ),
    // )?.whenComplete(() {
    //   // Refresh the list of declaration periods after editing
    //   getDeclarationPeriods();
    // });
  }
}
