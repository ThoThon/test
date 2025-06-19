import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';

import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../src.dart';

part 'common_info_tab_ext_controller.dart';
part 'register_info_tab_ext_controller.dart';

class RegisterCodeController extends BaseGetxController {
  final currentTab = RegisterCodeTabEnum.commmon_info.obs;

  // Mã số thuế
  final taxCodeCtrl = TextEditingController();

  // Tên đơn vị
  final unitNameCtrl = TextEditingController();

  // Loại đối tượng
  final selectedObject = Rxn<ObjectTypeModel>();

  // Loại hình đơn vị
  final unitTypeCtrl = TextEditingController();

  // Ngành nghề sản xuất
  final productIndustryCtrl = TextEditingController();

  // Số quyết định
  final decisionNumberCtrl = TextEditingController();

  // Ngày lập
  final setupDateCtrl = TextEditingController();

  // Ngày đăng ký
  final registerDateCtrl = TextEditingController();

  // Nơi cấp quyết định
  final addressDecisionCtrl = TextEditingController();

  // Địa chỉ đăng ký kinh doanh
  final addressRegisterBusinessCtrl = TextEditingController();

  // Địa chỉ đơn vị
  final addressUnitCtrl = TextEditingController();

  // Điện thoại đơn vị
  final phoneUnitCtrl = TextEditingController();

  // Email đơn vị
  final emailUnitCtrl = TextEditingController();

  // Người giao dịch BHXH
  final personTransactionBhxhCtrl = TextEditingController();

  // Điện thoại liên hệ
  final phoneContactCtrl = TextEditingController();

  // Tên đăng nhập MySign
  final usernameMySignCtrl = TextEditingController();

  void onTabChanged(RegisterCodeTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }
}
