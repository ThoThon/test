import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

import '../../clean/shared/entity/category.dart';
import '../../clean/shared/entity/entity_src.dart';
import '../../modules/register_code/domain/entity/social_agency.dart';
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
  var socialAgency = <SocialAgency>{};
  var receiveMethod = <Category>{};
  var paymentMethods = <Category>{};
  var objectType = <Category>{};
  var resultReceivingOptions = <Category>{};
  var birthTypes = <BirthType>{};
  var receiveResults = <ReceiveResult>{};
  var oldProvinces = <Province>{};
  final accountInfo = Rxn<AccountInfo>();

  // Thủ tục 630
  var declareForm = MapCategory();
  var benefitGroup630a = <BenefitGroup630>{};
  var workCondition = <Category>{};
  var receiveForm = <Category>{};
  var bank = <Bank>{};
  var hospitalLine = <Category>{};
  var longDiease = <LongDiease>{};
  var pregnancyCondition = <Category>{};
  var childBirthCondition = <Category>{};
  var maternityLeave = <Category>{};
  var parentalLeave = <Category>{};
  var surrogacy = <Category>{};
  var surgeryPregnancy32w = <Category>{};
  var contraception = <Category>{};
  var benefitGroup630b = <BenefitGroup630>{};
  var benefitGroup630c = <BenefitGroup630>{};

  /// Số lượng thông báo chưa đọc
  final totalUnread = 0.obs;
}
