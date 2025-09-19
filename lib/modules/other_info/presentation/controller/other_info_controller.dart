import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';

import '../../../declare/declaration_list/model/model_src.dart';
import '../../../src.dart';

class OtherInfoController extends BaseGetClController {
  final AddOtherInfoUseCase _addOtherInfoUseCase;
  final GetDetailOtherInfoUseCase _getDetailOtherInfoUseCase;
  final SaveXmlResult630aUseCase _saveXmlResult630aUseCase;
  final SaveXmlResult630bUseCase _saveXmlResult630bUseCase;
  final SaveXmlResult630cUseCase _saveXmlResult630cUseCase;
  final UpdateOtherInfoUseCase _updateOtherInfoUseCase;

  OtherInfoController(
    this._addOtherInfoUseCase,
    this._getDetailOtherInfoUseCase,
    this._saveXmlResult630aUseCase,
    this._saveXmlResult630bUseCase,
    this._saveXmlResult630cUseCase,
    this._updateOtherInfoUseCase,
  );

  //  Gửi kèm hồ sơ giấy
  final isAttachPaper = false.obs;

  // Đợt xét duyệt
  final reviewPeriodCtrl = TextEditingController();

  // Số điện thoại
  final phoneNumberCtrl = TextEditingController();

  // Số tài khoản
  final accountNumberCtrl = TextEditingController();

  // Mở tại ngân hàng
  final bankNameCtrl = TextEditingController();

  // Chi nhánh
  final branchBankCtrl = TextEditingController();

  // Thủ trưởng đơn vị
  final unitHeadCtrl = TextEditingController();

  // Lý do giải trình
  final reasonExplanationCtrl = TextEditingController();

  final argument = Get.arguments as StaffListArgument;

  final otherInfo = Rxn<OtherInfo>();

  String? id;

  @override
  void onReady() {
    super.onReady();
    getOtherInfoDetail();
  }

  ProcedureType get procedureType => argument.procedureType;
  String get declarationPeriodId => argument.declarationPeriodId;

  Future<void> getOtherInfoDetail() async {
    return buildState(
      showLoading: true,
      action: () async {
        final response = await _getDetailOtherInfoUseCase
            .execute(argument.declarationPeriodId);
        mapOtherInfoDetail(response);
      },
    );
  }

  void onTapContinueButton() async {
    if (id == null) {
      await addOtherInfo();
    } else {
      await updateOtherInfo();
    }
  }

  Future<void> addOtherInfo() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await _addOtherInfoUseCase.execute(_buildRequest);
        id = response;
        await saveXml();
      },
    );
  }

  Future<void> updateOtherInfo() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await _updateOtherInfoUseCase.execute(_buildRequest);
        await saveXml();
      },
    );
  }

  Future<void> saveXml() async {
    return buildState(
      action: () async {
        final response = await switch (procedureType) {
          ProcedureType.procedure630a =>
            _saveXmlResult630aUseCase.execute(declarationPeriodId),
          ProcedureType.procedure630b =>
            _saveXmlResult630bUseCase.execute(declarationPeriodId),
          ProcedureType.procedure630c =>
            _saveXmlResult630cUseCase.execute(declarationPeriodId),
          _ => throw UnimplementedError('Not implemented yet'),
        };
        nav.toNamed(
          AppRoutesCl.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: argument.declarationPeriodId,
            saveXmlResult: response,
            procedureType: argument.procedureType,
          ),
        );
      },
    );
  }

  OtherInfo get _buildRequest {
    return OtherInfo(
      id: id ?? '',
      periodId: argument.declarationPeriodId,
      approvalRound: reviewPeriodCtrl.text,
      phoneNumber: phoneNumberCtrl.text,
      bankAccount: accountNumberCtrl.text,
      bankName: bankNameCtrl.text,
      branchName: branchBankCtrl.text,
      unitHead: unitHeadCtrl.text,
      lateSubmissionReason: reasonExplanationCtrl.text,
      attachedPaperDocuments: isAttachPaper.value,
    );
  }

  void mapOtherInfoDetail(OtherInfo detail) {
    id = detail.id;

    reviewPeriodCtrl.text = detail.approvalRound.trim();

    phoneNumberCtrl.text = detail.phoneNumber.trim();

    accountNumberCtrl.text = detail.bankAccount.trim();

    bankNameCtrl.text = detail.bankName.trim();

    branchBankCtrl.text = detail.branchName.trim();

    unitHeadCtrl.text = detail.unitHead.trim();

    reasonExplanationCtrl.text = detail.lateSubmissionReason.trim();

    isAttachPaper.value = detail.attachedPaperDocuments;
  }

  @override
  void onClose() {
    reviewPeriodCtrl.dispose();
    phoneNumberCtrl.dispose();
    accountNumberCtrl.dispose();
    bankNameCtrl.dispose();
    branchBankCtrl.dispose();
    unitHeadCtrl.dispose();
    reasonExplanationCtrl.dispose();

    super.onClose();
  }
}
