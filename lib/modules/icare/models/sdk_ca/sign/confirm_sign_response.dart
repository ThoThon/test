import 'package:v_bhxh/modules/icare/models/icare_model.src.dart';

class ConfirmSignResponseIcare extends BaseResponseSDK {
  const ConfirmSignResponseIcare({
    required super.errorCode,
    required super.errorMessage,
  });

  factory ConfirmSignResponseIcare.fromJson(Map<String, dynamic> json) {
    return ConfirmSignResponseIcare(
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
    );
  }
}
