import 'package:v_bhxh/modules/icare/icare.src.dart';

class VerifyCertRequestICare extends BaseModelSDK {
  VerifyCertRequestICare({
    this.serial,
  });

  String? serial;

  @override
  Map<String, dynamic> toJson() {
    return {
      'serial': serial,
    };
  }
}
