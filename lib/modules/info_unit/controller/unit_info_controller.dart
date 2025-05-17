import 'package:v_bhxh/modules/login/model/model_src.dart';

import '../../../base_app/base_app.src.dart';
import '../../../modules/src.dart';

abstract class UnitInfoController extends BaseGetxController {
  // Mã số thuế
  final taxCodeController = TextEditingController();

  // Tên đơn vị
  final unitNameController = TextEditingController();

  // Mã đơn vị
  final unitCodeController = TextEditingController();

  // Tên cơ quan BHXH
  final socialAgencyNameCtrl = TextEditingController();

  // Mã cơ quan BHXH
  final socialAgencyCodeCtrl = TextEditingController();

  // Địa chỉ ĐKKD
  final addressRegisterController = TextEditingController();

  // Địa chỉ giao dịch hồ sơ
  final addressTransactionController = TextEditingController();

  // Người đại diện
  final nameRepresentController = TextEditingController();

  // Chức vụ
  final positionController = TextEditingController();

  // Người giao dịch BHXH
  final personTransactionController = TextEditingController();

  // Điện thoại liên hệ
  final phoneContactController = TextEditingController();

  // Email liên hệ
  final emailContactController = TextEditingController();

  // Lương cơ sở
  final basicSalaryController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isUnitInfoEdit = false.obs;

  final isAddressInfoEdit = false.obs;

  final isRepresentInfoEdit = false.obs;

  final isTraderInfoEdit = false.obs;

  final isOtherInfoEdit = false.obs;

  late final unitInfoRepository = UnitInfoRepository(this);

  // Vùng
  Rx<RegionEnum?> selectedRegion = Rx<RegionEnum?>(null);

  // Phương thức đóng
  Rx<PaymentMethodEnum?> selectedMethod = Rx<PaymentMethodEnum?>(null);

  // Đăng ký nhận kết quả
  Rx<ReceiveResultEnum?> selectedReceive = Rx<ReceiveResultEnum?>(null);

  final appController = Get.find<AppController>();

  AccountInfoModel? accountInfo;
}
