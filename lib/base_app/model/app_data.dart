import 'package:v_bhxh/modules/login/model/model_src.dart';

import '../../modules/src.dart';

class AppData {
  AppData._();
  static final AppData instance = AppData._();

  var declarationTypes = <DeclarationTypeModel>{};
  var ethnics = <EthnicModel>{};
  var nations = <NationModel>{};
  var provinces = <ProvinceModel>{};
  var relationships = <RelationshipModel>{};
  var positions = <PositionModel>{};
  var socialAgency = <SocialAgencyModel>{};
  var receiveMethod = <ReceiveMethodModel>{};
  var paymentMethods = <PaymentMethodModel>{};
  var objectType = <ObjectTypeModel>{};
  var resultReceivingOptions = <RegisterReceiveResultModel>{};
  var birthTypes = <BirthTypeModel>{};
  var receiveResults = <ReceiveResultModel>{};
  var declareForm = <DeclareForm630aModel>{};
  var benefitGroup = <BenefitGroup630aModel>{};
  var workCondition = <WorkCondition630aModel>{};
  var receiveForm = <ReceiveForm630aModel>{};
  var bank = <Bank630aModel>{};
  var hospitalLine = <HospitalLine630aModel>{};
  var longDiease = <LongDiease630aModel>{};

  final Rx<AccountInfoModel?> accountInfoModel = Rx<AccountInfoModel?>(null);
  final totalUnread = 0.obs;
}
