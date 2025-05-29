import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class AppData {
  AppData._();
  static final AppData instance = AppData._();

  var declarationTypes = <DeclarationTypeModel>{};
  var ethnics = <EthnicModel>{};
  var nations = <NationModel>{};
  var provinces = <ProvinceModel>{};
  var relationships = <RelationshipModel>{};
  var positions = <PositionModel>{};
  final Rx<AccountInfoModel?> accountInfoModel = Rx<AccountInfoModel?>(null);
}
