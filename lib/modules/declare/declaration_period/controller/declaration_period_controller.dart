import 'package:v_bhxh/modules/declare/declaration_period/repository/declaration_period_repository.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/staff_list_argument.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../base_app/base_app.src.dart';

class DeclarationPeriodController extends BaseGetxController {
  final argument = Get.arguments as Procedure;

  late final _repository = DeclarationPeriodRepository(this);

  final selectedPeriodDate = DateTime.now().obs;

  final declarationPeriods = <DeclarationPeriod>[].obs;

  final selectFilter = PeriodStatus.all.obs;

  @override
  void onReady() {
    super.onReady();
    getDeclarationPeriods();
  }

  Future<void> getDeclarationPeriods() async {
    try {
      showLoading();
      declarationPeriods.clear();
      final response = await _repository.getDeclarationPeriods(
        request: ListDeclarationPeriodRequest(
          periodId: argument.type,
          month: selectedPeriodDate.value.month,
          year: selectedPeriodDate.value.year,
          status: selectFilter.value.statusNumber,
        ),
      );

      if (response.isSuccess) {
        declarationPeriods.value = response.result?.periods ?? [];
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
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
    try {
      showLoadingOverlay();
      final response = await _repository.deleteDeclarationPeriod(
        id: period.id,
      );

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declarationPeriod_contentDeletePeriodSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        getDeclarationPeriods();
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> createDeclarationPeriod() async {
    try {
      showLoadingOverlay();
      final response = await _repository.createDeclarationPeriod(
        request: CreateDeclarationPeriodRequest(
          maThuTuc: argument.type,
          nam: selectedPeriodDate.value.year,
          thang: selectedPeriodDate.value.month,
        ),
      );

      if (response.isSuccess && response.result != null) {
        final String path = switch (argument.procedureType) {
          ProcedureType.procedure600 => AppRoutes.declareInfo.path,
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            AppRoutes.declareInfo607.path,
          ProcedureType.procedure630a => AppRoutes.declareInfo630a.path,
        };

        Get.toNamed(
          path,
          arguments: DeclareInfoArgument(
            declarationPeriodId: response.result!.id,
            action: D02ActionEnum.addPeriodFromDeclarePeriod,
            procedureType: argument.procedureType,
          ),
        )?.whenComplete(() {
          // Refresh the list of declaration periods after creating a new one
          getDeclarationPeriods();
        });
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> editDeclarationPeriod(DeclarationPeriod period) async {
    Get.toNamed(
      AppRoutes.staffList.path,
      arguments: StaffListArgument(
        declarationPeriodId: period.id,
        procedureType: period.procedureType,
      ),
    )?.whenComplete(() {
      // Refresh the list of declaration periods after editing
      getDeclarationPeriods();
    });
  }
}
