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

  // Thủ tục 630
  var declareForm = <DeclareForm630Model>{};
  var benefitGroup630a = <BenefitGroup630aModel>{};
  var workCondition = <WorkConditionModel>{};
  var receiveForm = <ReceiveFormModel>{};
  var bank = <BankModel>{};
  var hospitalLine = <HospitalLineModel>{};
  var longDiease = <LongDieaseModel>{};
  var pregnancyCondition = <PregnancyCheckConditionModel>{};
  var childBirthCondition = <ChildBirthConditionModel>{};
  var maternityLeave = <MaternityLeaveModel>{};
  var parentalLeave = <ParentalLeaveModel>{};
  var surrogacy = <SurrogacyModel>{};
  var surgeryPregnancy32w = <SurgeryPregnancy32wModel>{};
  var contraception = <ContraceptionModel>{};
  var benefitGroup630b = <BenefitGroup630bModel>{};

  final Rx<AccountInfoModel?> accountInfoModel = Rx<AccountInfoModel?>(null);
  final totalUnread = 0.obs;
}
