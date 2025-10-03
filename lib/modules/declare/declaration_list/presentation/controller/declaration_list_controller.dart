import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/use_case/get_record_pdf_use_case.dart';
import 'package:v_bhxh/modules/home_clean/presentation/events/home_event.dart';
import 'package:v_bhxh/shares/utils/event_bus_util.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

import '../../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../src.dart';
import '../../../../view_pdf/model/view_pdf_argument.dart';
import '../../../declaration_period/domain/entity/entity_src.dart';
import '../../declaration_list_src.dart';
import '../../domain/entity/get_record_pdf_request.dart';

class DeclarationListController extends BaseGetClController {
  final GetViewPdf600UseCase _getViewPdf600UseCase;
  final GetViewPdf607UseCase _getViewPdf607UseCase;
  final GetViewPdf630aUseCase _getViewPdf630aUseCase;
  final GetViewPdf630bUseCase _getViewPdf630bUseCase;
  final GetViewPdf630cUseCase _getViewPdf630cUseCase;
  final SignDocumentUseCase _signDocumentUseCase;
  final GetRecordPdfUseCase _getRecordPdfUseCase;
  final DeclarationListArgument argument;

  DeclarationListController(
    this._getViewPdf600UseCase,
    this._getViewPdf607UseCase,
    this._getViewPdf630aUseCase,
    this._getViewPdf630bUseCase,
    this._getViewPdf630cUseCase,
    this._signDocumentUseCase,
    this._getRecordPdfUseCase, {
    required this.argument,
  });

  Future<void> signDocument() async {
    return buildState(
      action: () async {
        _showDialogCheckedSuccess();

        await _signDocumentUseCase.execute(
          argument.declarationPeriodId ?? '',
        );
        nav.dismissDialog();
        eventBus.fire(const GetUnreadNotificationCountEvent());
        _showDialogVerifySuccess();
      },
      onError: (error) {
        nav.dismissDialog();
        return error;
      },
      onFinally: hidePageLoadingOverlay,
    );
  }

  void _showDialogCheckedSuccess() {
    nav.showTimerDialog(
      title: LocaleKeys.dialog_sendRequestSignature.tr,
      subtitle: LocaleKeys.dialog_confirmSignatureMySign.tr,
      onFinish: () {
        showPageLoadingOverlay();
      },
      onCancel: () {
        nav.until(ModalRoute.withName(AppRoutesCl.declarationPeriod.path));
      },
    );
  }

  void _showDialogVerifySuccess() {
    nav.showInfoDialog(
      iconType: DialogIconType.success,
      title: LocaleKeys.dialog_sendFileSuccess.tr,
      confirmTitle: LocaleKeys.dialog_history.tr,
      cancelTitle: LocaleKeys.dialog_exit.tr,
      subtitle: LocaleKeys.dialog_sendFileToBHXH.tr,
      onConfirm: () {
        nav.toNamed(
          AppRoutesCl.history.path,
          arguments: HistoryArgument(
            selectedTab: HistoryTabEnum.file_declare,
          ),
        );
      },
      onCancel: () {
        nav.until(ModalRoute.withName(AppRoutesCl.home.path));
      },
    );
  }

  Future<void> createPdf({
    required PreviewDocumentTypeEnum previewDocumentType,
    String? documentRecordId,
    required String title,
    bool isRotateHorizontal = false,
  }) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final request = GetPreviewPdfRequest(
          declarationPeriodId: argument.declarationPeriodId ?? '',
          previewDocumentType: previewDocumentType,
          documentRecordId: documentRecordId,
        );

        final url = await switch (argument.procedureType) {
          ProcedureType.procedure600 => _getViewPdf600UseCase.execute(request),
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            _getViewPdf607UseCase.execute(request),
          ProcedureType.procedure630a =>
            _getViewPdf630aUseCase.execute(request),
          ProcedureType.procedure630b =>
            _getViewPdf630bUseCase.execute(request),
          ProcedureType.procedure630c =>
            _getViewPdf630cUseCase.execute(request),
          _ => throw UnimplementedError('Not implemented yet'),
        };

        nav.toNamed(
          AppRoutesCl.viewPdf.path,
          arguments: ViewPdfArgument(
            url: url,
            title: title,
            isRotateHorizontal: isRotateHorizontal,
          ),
        );
      },
    );
  }

  Future<void> recordPdf({
    String? id,
    String? staffId,
    required String title,
    bool isRotateHorizontal = false,
  }) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final url = await _getRecordPdfUseCase.execute(
          GetRecordPdfRequest(
            id: id ?? '',
            staffId: staffId,
          ),
        );
        nav.toNamed(
          AppRoutesCl.viewPdf.path,
          arguments: ViewPdfArgument(
            url: url,
            title: title,
            isRotateHorizontal: isRotateHorizontal,
          ),
        );
      },
    );
  }

  Future<void> getPreviewPdf({
    String? id,
    String? staffId,
    required String title,
    bool isRotateHorizontal = false,
    required PreviewDocumentTypeEnum previewDocumentType,
    String? documentRecordId,
  }) async {
    argument.isFromHistoryPage
        ? await recordPdf(
            id: id,
            title: title,
            staffId: staffId,
            isRotateHorizontal: isRotateHorizontal,
          )
        : await createPdf(
            previewDocumentType: previewDocumentType,
            title: title,
            documentRecordId: documentRecordId,
            isRotateHorizontal: isRotateHorizontal,
          );
  }
}
