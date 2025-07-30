import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/usecase/use_case_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/model/procedure_type.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/declare_info_argument.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';
import 'package:v_bhxh/shares/widgets/date_picker/date_picker_utils.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

class DeclarationPeriodControllerCl extends BaseGetClController {
  final Procedure argument;

  final GetDeclarationPeriodsUseCase _getDeclarationPeriodsUseCase;
  final DeleteDeclarationPeriodUseCase _deleteDeclarationPeriodUseCase;
  final CreateDeclarationPeriodUseCase _createDeclarationPeriodUseCase;

  final declarationPeriods = <DeclarationPeriod>[].obs;
  final selectedPeriodDate = DateTime.now().obs;

  DeclarationPeriodControllerCl(
    this._getDeclarationPeriodsUseCase,
    this._deleteDeclarationPeriodUseCase,
    this._createDeclarationPeriodUseCase, {
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

  Future<void> deleteDeclarationPeriod(DeclarationPeriod period) {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final success =
            await _deleteDeclarationPeriodUseCase.execute(period.id);
        if (success) {
          nav.showSnackBar(
            LocaleKeys.declarationPeriod_contentDeletePeriodSuccess.tr,
            type: SnackBarType.success,
          );
          getDeclarationPeriods();
        }
      },
    );
  }

  Future<void> createDeclarationPeriod() {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final period = await _createDeclarationPeriodUseCase.execute(
          CreateDeclarationPeriodUseCaseInput(
            year: selectedPeriodDate.value.year,
            month: selectedPeriodDate.value.month,
            procedureId: argument.type.toInt,
          ),
        );

        final String path = switch (argument.type) {
          ProcedureType.procedure600 => AppRoutesCl.declareInfo.path,
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            AppRoutesCl.declareInfo607.path,
        };

        final declareInfoArgument = DeclareInfoArgument(
          declarationPeriodId: period.id,
          action: D02ActionEnum.addPeriodFromDeclarePeriod,
          procedureType: argument.type,
        );

        nav.toNamed(path, arguments: declareInfoArgument)?.whenComplete(() {
          // Refresh the list of declaration periods after creating a new one
          getDeclarationPeriods();
        });
      },
    );
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
