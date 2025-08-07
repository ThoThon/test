import 'package:v_bhxh/modules/declare_info_630b/controller/declare_info_630b_controller.dart';

import '../../login/model/categories_630/categories_630_src.dart';

class DeclareInfo630bControllerImp extends DeclareInfo630bController {
  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }

  /// Trả về "true" khi "Hình thức nhận" là "Chi trả qua ATM"
  bool get isATMpayment {
    return receiveForm.value?.value == ATMPaymentValue;
  }
}
