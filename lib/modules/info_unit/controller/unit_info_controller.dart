import '../../src.dart';

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isUnitInfoEdit = false.obs;

  final isAddressInfoEdit = false.obs;

  final isRepresentInfoEdit = false.obs;

  final isTraderInfoEdit = false.obs;

  final isOtherInfoEdit = false.obs;

  late final unitInfoRepository = UnitInfoRepository(this);
}
