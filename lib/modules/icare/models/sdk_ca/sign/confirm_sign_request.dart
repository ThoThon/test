import '../../../icare.src.dart';

class ConfirmSignRequestIcare extends BaseModelSDK {
  ConfirmSignRequestIcare({
    this.confirm,
    this.userPin,
    this.signRequestId,
    this.authId,
    this.authData,
  });

  bool? confirm;
  String? userPin;
  String? signRequestId;
  String? authId;
  AuthDataIcare? authData;

  @override
  Map<String, dynamic> toJson() {
    return {
      'confirm': confirm,
      'user_pin': userPin,
      'sign_request_id': signRequestId,
      'auth_id': authId,
      'auth_data': authData?.toString(),
    };
  }
}
