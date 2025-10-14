import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../clean/core/presentation/navigation/snack_bar_type.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../../clean/shared/entity/category.dart';
import '../../../../shares/utils/utils_src.dart';
import '../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../declare/declaration_period/domain/entity/entity_src.dart';
import '../../../declare/declaration_period/presentation/events/declaration_period_event.dart';
import '../../../declare_info_630a/declare_info_630a_src.dart';
import '../../../selected_staff/domain/entity/selected_staff_detail.dart';
import '../../../selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import '../../../src.dart';

part 'declare_info_630b_controller_ext.dart';

class DeclareInfo630bController extends BaseGetClController {
  final AddProcedure630bUseCase _addProcedure630bUseCase;
  final GetDetailProcedure630bUseCase _getDetailProcedure630bUseCase;
  final UpdateProcedure630bUseCase _updateProcedure630bUseCase;
  final GetStaffDetailUseCase _getStaffDetailUseCase;
  final DeclareInfoArgument argument;

  DeclareInfo630bController(
    this._addProcedure630bUseCase,
    this._getDetailProcedure630bUseCase,
    this._updateProcedure630bUseCase,
    this._getStaffDetailUseCase, {
    required this.argument,
  });

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

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Đến ngày đơn vị *
  final toDateUnitTextCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

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

  final autoValidateMode = Rxn<AutovalidateMode>();

  final formKey = GlobalKey<FormState>();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  final scrollController = ScrollController();

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
    toDateUnitTextCtrl.dispose();
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
