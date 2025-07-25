import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';

import '../../declare/declaration_list/model/declaration_list_argument.dart';
import '../../declare/staff_list/model/staff_list_argument.dart';
import '../../src.dart';

class OtherInfoController extends BaseGetxController {
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

  late final _repository = OtherInfoRepository(this);

  final argument = Get.arguments as StaffListArgument;

  final otherInfo = Rxn<OtherInfoModel>();

  String? id;

  @override
  void onReady() {
    super.onReady();
    getOtherInfoDetail();
  }

  Future<void> getOtherInfoDetail() async {
    try {
      showLoading();
      final response =
          await _repository.getOtherInfoDetail(argument.declarationPeriodId);
      final otherInfoDetail = response.result;
      if (response.isSuccess && otherInfoDetail != null) {
        mapOtherInfoDetail(otherInfoDetail);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  void onTapContinueButton() async {
    if (id == null) {
      await addOtherInfo();
    } else {
      await updateOtherInfo();
    }
  }

  Future<void> addOtherInfo() async {
    try {
      showLoadingOverlay();
      final response = await _repository.addOtherInfo(_buildRequest);
      if (response.isSuccess) {
        await saveXml();
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> updateOtherInfo() async {
    try {
      showLoadingOverlay();
      final response = await _repository.updateOtherInfo(_buildRequest);
      if (response.isSuccess) {
        await saveXml();
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> saveXml() async {
    try {
      final response = await _repository.saveXml(
        declarationPeriodId: argument.declarationPeriodId,
      );
      if (response.isSuccess) {
        Get.toNamed(
          AppRoutes.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: argument.declarationPeriodId,
            saveXmlResult: response.result!,
            procedureType: argument.procedureType,
          ),
        );
      }
    } catch (e) {
      logger.d(e);
    }
  }

  OtherInfoModel get _buildRequest {
    return OtherInfoModel(
      id: id,
      kyKeKhaiId: argument.declarationPeriodId,
      dotXetDuyet: argument.period ?? '',
      soDienThoai: phoneNumberCtrl.text,
      soTaiKhoan: accountNumberCtrl.text,
      moTai: bankNameCtrl.text,
      chiNhanh: branchBankCtrl.text,
      thuTruongDonVi: unitHeadCtrl.text,
      lyDoNopCham: reasonExplanationCtrl.text,
    );
  }

  void mapOtherInfoDetail(OtherInfoModel detail) {
    id = detail.id;

    reviewPeriodCtrl.text = detail.dotXetDuyet;

    phoneNumberCtrl.text = detail.soDienThoai;

    accountNumberCtrl.text = detail.soTaiKhoan;

    bankNameCtrl.text = detail.moTai;

    branchBankCtrl.text = detail.chiNhanh;

    unitHeadCtrl.text = detail.chiNhanh;

    reasonExplanationCtrl.text = detail.lyDoNopCham;
  }
}
