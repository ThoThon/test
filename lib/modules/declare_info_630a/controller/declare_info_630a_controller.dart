import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/login/model/district_model.dart';
import 'package:v_bhxh/modules/src.dart';

class DeclareInfo630aController extends BaseGetxController {
  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH *
  final bhxhTextCtrl = TextEditingController();

  /// Số CCCD
  final cccdTextCtrl = TextEditingController();

  /// Mã nhân viên
  final staffCodeTextCtrl = TextEditingController();

  /// Hình thức kê khai *
  final declareMethod = Rxn<DeclareMethodEnum>();

  /// Mã nhóm hưởng *
  final benefitGroupCode = Rxn<BenefitGroupCodeEnum>();

  /// Ngày sinh con *
  final birthDayChildCtrl = TextEditingController();

  /// Số con
  final numberChildCtrl = TextEditingController();

  /// Mã thẻ BHYT của con
  final bhytCardCodeChildCtrl = TextEditingController();

  /// Từ ngày *
  final fromDateTextCtrl = TextEditingController();

  /// Đến ngày *
  final toDateTextCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Nghỉ hàng tuần
  final weeklyDayOff = Rxn<WeeklyDayOffEnum>();

  /// Tuyến bệnh viện
  final districtReceive = Rxn<DistrictModel>();

  /// Chọn/Nhập mã bệnh

  /// Tên bệnh
  final diseaseNameTextCtrl = TextEditingController();

  /// Số serial
  final serialNumberCtrl = TextEditingController();

  /// Điều kiện làm việc
  final workCondition = Rxn<WorkingConditionEnum>();

  /// Nghỉ dưỡng thai
  final isMaternityRest = false.obs;

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  final receiveMethod = Rxn<ReceiveMethodEnum>();

  /// Số tài khoản ngân hàng
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng

  /// Đợt đã giải quyết
  final resolvedPeriodCtrl = TextEditingController();

  /// Ngày đã giải quyết
  final resolvedDateCtrl = TextEditingController();

  /// Lý do điều chỉnh
  final adjustReasonCtrl = TextEditingController();
}
