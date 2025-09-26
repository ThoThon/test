import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

import '../../../base_app/base_app.src.dart';
import '../../../clean/shared/entity/category.dart';
import '../../declare/declare_info/repository/declare_info_repository.dart';
import '../../declare_info_630a/domain/entity/weekly_day_off_enum.dart';
import '../../src.dart';

class DeclareInfo630bController extends BaseGetxController {
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
  final declareForm = Rxn<Category>();

  /// Mã nhóm hưởng *
  final benefitGroup = Rxn<BenefitGroup630>();

  /// Mã nhóm hưởng cấp 2
  final benefitGroupLv2 = Rxn<BenefitGroupLv2>();

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
  final pregnancyCondition = Rxn<Category>();

  /// Tuổi thai
  final pregnancyWeekCtrl = TextEditingController();

  /// Biện pháp tránh thai
  final contraception = Rxn<Category>();

  /// Điều kiện sinh con
  final childbirthCondition = Rxn<Category>();

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
  final surgeryOrUnder32Week = Rxn<Category>();

  /// Ngày mẹ chết
  final motherDeathDateCtrl = TextEditingController();

  /// Ngày kết luận
  final conclusionDateCtrl = TextEditingController();

  /// Phí giám định y khoa
  final medicalFeeCtrl = TextEditingController();

  /// Mã số BHXH người nuôi dưỡng
  final guardianBhxhCtrl = TextEditingController();

  /// Nghỉ dưỡng thai
  final maternityRest = Rxn<Category>();

  /// Nghỉ chăm con
  final parentalLeave = Rxn<Category>();

  /// Mang thai hộ
  final surrogacy = Rxn<Category>();

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  final receiveForm = Rxn<Category>();

  /// Số tài khoản ngân hàng
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng
  final selectedBank = Rxn<Bank>();

  /// Đợt đã giải quyết
  final resolvedPeriodCtrl = TextEditingController();

  /// Ngày đã giải quyết
  final resolvedDateCtrl = TextEditingController();

  /// Lý do điều chỉnh
  final adjustReasonCtrl = TextEditingController();

  /// ========== Khai báo thêm ==========
  late final repository = DeclareInfo630bRepository(this);

  late final declareInfoRepository = DeclareInfoRepository(this);

  final autoValidateMode = Rxn<AutovalidateMode>();

  final formKey = GlobalKey<FormState>();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  final scrollController = ScrollController();

  final DeclareInfoArgument argument = Get.arguments;

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
    serialNumberCtrl.dispose();
    pregnancyWeekCtrl.dispose();
    birthDayChildCtrl.dispose();
    numberChildCtrl.dispose();
    bhxhCodeChildCtrl.dispose();
    bhytCardCodeChildCtrl.dispose();
    numberChildDeathCtrl.dispose();
    childDeathDateCtrl.dispose();
    adoptionDateCtrl.dispose();
    returnWorkDateCtrl.dispose();
    bhxhCodeMotherCtrl.dispose();
    bhytCardMotherCtrl.dispose();
    cccdMotherCtrl.dispose();
    motherDeathDateCtrl.dispose();
    conclusionDateCtrl.dispose();
    medicalFeeCtrl.dispose();
    guardianBhxhCtrl.dispose();
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

  @override
  void onInit() {
    super.onInit();
    get630bDetail();
  }
}
