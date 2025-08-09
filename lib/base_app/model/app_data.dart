import 'package:v_bhxh/modules/login/model/categories_630a/categories_630a_src.dart';

import '../../clean/shared/entity/entity_src.dart';
import '../../modules/src.dart';

class AppData {
  AppData._();
  static final AppData instance = AppData._();

  var declarationTypes = <DeclarationType>{};
  var ethnics = <Ethnic>{};
  var nations = <Nation>{};
  var provinces = <Province>{};
  var relationships = <Relationship>{};
  var positions = <Position>{};
  var socialAgency = <SocialAgencyModel>{};
  var receiveMethod = <ReceiveMethodModel>{};
  var paymentMethods = <PaymentMethodModel>{};
  var objectType = <ObjectTypeModel>{};
  var resultReceivingOptions = <RegisterReceiveResultModel>{};
  var birthTypes = <BirthType>{};
  var receiveResults = <ReceiveResult>{};
  var declareForm = <DeclareForm630aModel>{};
  var benefitGroup = <BenefitGroup630aModel>{};
  var workCondition = <WorkCondition630aModel>{};
  var receiveForm = <ReceiveForm630aModel>{};
  var bank = <Bank630aModel>{};
  var hospitalLine = <HospitalLine630aModel>{};
  var longDiease = <LongDiease630aModel>{};
  final accountInfo = Rxn<AccountInfo>();

  /// Số lượng thông báo chưa đọc
  final totalUnread = 0.obs;
}
