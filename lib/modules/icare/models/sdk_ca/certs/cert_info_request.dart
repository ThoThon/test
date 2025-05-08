import '../../../icare.src.dart';

class CertInfoRequestIcare extends BaseModelSDK {
  CertInfoRequestIcare({
    this.serial,
  });

  String? serial;

  factory CertInfoRequestIcare.fromJson(Map<String, dynamic> json) {
    return CertInfoRequestIcare(
      serial: json['serial'] as String?,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'serial': serial,
    };
  }
}
