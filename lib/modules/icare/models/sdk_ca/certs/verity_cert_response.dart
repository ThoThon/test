import 'package:v_bhxh/modules/icare/icare.src.dart';

class VerifyCertResponseICare extends BaseResponseSDK {
  VerifyCertResponseICare({
    required super.errorCode,
    required super.errorMessage,
  });

  factory VerifyCertResponseICare.fromJson(Map<String, dynamic> json) {
    return VerifyCertResponseICare(
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
    );
  }
}
