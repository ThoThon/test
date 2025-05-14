import 'package:v_bhxh/modules/login/model/model_src.dart';

import '../../../base_app/base_app.src.dart';
import '../../../modules/src.dart';

abstract class UnitInfoController extends BaseGetxController {
  final taxCodeController = TextEditingController();

  final unitNameController = TextEditingController();

  final unitCodeController = TextEditingController();

  final socialAgencyNameCtrl = TextEditingController();

  final socialAgencyCodeCtrl = TextEditingController();

  final addressRegisterController = TextEditingController();

  final addressTransactionController = TextEditingController();

  //Người đại diện
  final nameRepresentController = TextEditingController();

  //Chức vụ
  final positionController = TextEditingController();

  final personTransactionController = TextEditingController();

  final phoneContactController = TextEditingController();

  final emailContactController = TextEditingController();

  final basicSalaryController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isUnitInfoEdit = false.obs;

  final isAddressInfoEdit = false.obs;

  final isRepresentInfoEdit = false.obs;

  final isTraderInfoEdit = false.obs;

  final isOtherInfoEdit = false.obs;

  late final unitInfoRepository = UnitInfoRepository(this);

  Rx<RegionEnum?> selectedRegion = Rx<RegionEnum?>(null);

  Rx<PaymentMethodEnum?> selectedMethod = Rx<PaymentMethodEnum?>(null);

  Rx<ReceiveResultEnum?> selectedReceive = Rx<ReceiveResultEnum?>(null);

  final appController = Get.find<AppController>();

  AccountInfoModel? accountInfo;
}
