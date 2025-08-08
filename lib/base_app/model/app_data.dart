import 'package:v_bhxh/modules/login/model/model_src.dart';

import '../../clean/shared/entity/entity_src.dart';
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

  /// Số lượng thông báo chưa đọc
  final totalUnread = 0.obs;

  final accountInfoCl = Rxn<AccountInfo>();
  final declarationTypesCl = <DeclarationType>{}.obs;
  final ethnicsCl = <Ethnic>{}.obs;
  final nationsCl = <Nation>{}.obs;
  final provincesCl = <Province>{}.obs;
  final relationshipsCl = <Relationship>{}.obs;
  final positionsCl = <Position>{}.obs;
  final birthTypesCl = <BirthType>{}.obs;
  final receiveResultsCl = <ReceiveResult>{}.obs;
}
