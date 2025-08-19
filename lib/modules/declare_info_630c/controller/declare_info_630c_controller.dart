import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/modules/login/model/categories_630/bank_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/benefit_group_630b_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/declare_form_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/receive_form_model.dart';
import 'package:v_bhxh/modules/src.dart';

class DeclareInfo630cController extends BaseGetxController {
  /// id 630c dùng khi update
  String? id;

  /// Id nhân viên được chọn
  String? selectedStaffId;

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH *
  final bhxhTextCtrl = TextEditingController();

  /// Số CCCD
  final cccdTextCtrl = TextEditingController();

  /// Mã nhân viên
  final staffCodeTextCtrl = TextEditingController();

  /// Hình thức kê khai *
  final declareForm = Rxn<DeclareForm630Model>();

  /// Mã nhóm hưởng *
  final benefitGroup = Rxn<BenefitGroup630bModel>();

  /// Từ ngày *
  final toDateCtrl = TextEditingController();

  /// Đến ngày *
  final fromDateCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Ngày trở lại làm việc *
  final returnWorkDateCtrl = TextEditingController();

  /// Ngày giám định
  final appraisalDateCtrl = TextEditingController();

  /// Tỷ lệ suy giảm
  final rateToDeclineCtrl = TextEditingController();

  /// Số serial
  final serialNumberCtrl = TextEditingController();

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  final receiveForm = Rxn<ReceiveFormModel>();

  /// Số tài khoản ngân hàng *
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản *
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng *
  final selectedBank = Rxn<BankModel>();

  /// Đợt đã giải quyết
  final resolvedPeriodCtrl = TextEditingController();

  /// Ngày đã giải quyết
  final resolvedDateCtrl = TextEditingController();

  /// Lý do điều chỉnh
  final adjustReasonCtrl = TextEditingController();

  final scrollController = ScrollController();

  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }


  /// Trả về "true" khi "Hình thức nhận" là "Chi trả qua ATM"
  bool get isATMpayment {
    return receiveForm.value?.value == ATMPaymentValue;
  }


  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    staffCodeTextCtrl.dispose();
    fromDateCtrl.dispose();
    toDateCtrl.dispose();
    countDayTextCtrl.dispose();
    fromDateUnitTextCtrl.dispose();
    returnWorkDateCtrl.dispose();
    appraisalDateCtrl.dispose();
    rateToDeclineCtrl.dispose();
    serialNumberCtrl.dispose();
    supplementalPeriodCtrl.dispose();
    fileCodeTextCtrl.dispose();
    noteTextCtrl.dispose();
    bankNumberCtrl.dispose();
    accountHolderNameCtrl.dispose();
    resolvedPeriodCtrl.dispose();
    resolvedDateCtrl.dispose();
    adjustReasonCtrl.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
