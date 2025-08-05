import 'package:flutter_form_registry/flutter_form_registry.dart';

import '../../../base_app/base_app.src.dart';
import '../../declare/declare_info/repository/declare_info_repository.dart';
import '../../src.dart';

abstract class DeclareInfo630bController extends BaseGetxController {
  /// id 630b dùng khi update
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
  // final declareForm = Rxn<DeclareForm630bModel>();

  /// Mã nhóm hưởng *
  // final benefitGroup = Rxn<BenefitGroup630bModel>();

  /// Mã nhóm hưởng cấp 2
  // final subBenefitGroup = Rxn<SubBenefitGroup630bModel>();

  /// Từ ngày *
  final fromDateCtrl = TextEditingController();

  /// Đến ngày *
  final toDateCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Nghỉ hàng tuần
  final weeklyDayOffs = <WeeklyDayOffEnum>[].obs;

  /// Số serial
  final serialNumberCtrl = TextEditingController();

  /// Điều kiện khám thai
  final isPregnancyCondition = false.obs;

  /// Tuổi thai
  final pregnancyWeekCtrl = TextEditingController();

  /// Biện pháp tránh thai
  final contraceptionMethodCtrl = TextEditingController();

  /// Điều kiện sinh con
  final isChildbirthCondition = false.obs;

  /// Ngày sinh con
  final birthDayChildCtrl = TextEditingController();

  /// Số con
  final numberChildCtrl = TextEditingController();

  /// Mã số BHXH của con
  final bhxhCodeChildCtrl = TextEditingController();

  /// Mã thẻ BHYT của con
  final bhytCardCodeChildCtrl = TextEditingController();

  /// Số con chết
  final numberChildDeathCtrl = TextEditingController();

  /// Ngày con chết
  final childDeathDateCtrl = TextEditingController();

  /// Ngày nhận con
  final adoptionDateCtrl = TextEditingController();

  /// Ngày đi làm thực tế
  final returnWorkDateCtrl = TextEditingController();

  /// Mã số BHXH của mẹ
  final bhxhCodeMotherCtrl = TextEditingController();

  /// Mã thẻ BHYT của mẹ
  final bhytCardMotherCtrl = TextEditingController();

  /// Số CMND của mẹ
  final cccdMotherCtrl = TextEditingController();

  /// Phẫu thuật hoặc thai < 32 tuần
  final isSurgeryOrUnder32Week = false.obs;

  /// Ngày mẹ chết
  final motherDeathDateCtrl = TextEditingController();

  /// Ngày kết luận
  final conclusionDateCtrl = TextEditingController();

  /// Phí giám định y khoa
  final medicalFeeCtrl = TextEditingController();

  /// Mã số BHXH người nuôi dưỡng
  final guardianBhxhCtrl = TextEditingController();

  /// Nghỉ dưỡng thai
  final isMaternityRest = false.obs;

  /// Nghỉ chăm con
  final isChildCare = false.obs;

  /// Mang thai hộ
  final isSurrogacy = false.obs;

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  // final receiveForm = Rxn<ReceiveForm630bModel>();

  /// Số tài khoản ngân hàng
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng
  // final selectedBank = Rxn<Bank630bModel>();

  /// ========== Khai báo thêm ==========
  late final repository = DeclareInfo630bRepository(this);

  late final declareInfoRepository = DeclareInfoRepository(this);

  final autoValidateMode = Rxn<AutovalidateMode>();

  final formKey = GlobalKey<FormState>();

  final declarationPeriodController =
      Get.findOrNull<DeclarationPeriodController>();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();
}
