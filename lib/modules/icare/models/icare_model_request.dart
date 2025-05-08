import 'package:v_bhxh/modules/icare/models/sdk_ca/certs/verify_cert_request.dart';
import 'package:v_bhxh/modules/icare/models/sdk_ca/certs/verity_cert_response.dart';

import 'icare_model.src.dart';

class IcareModulesRequest {
  final String emailFromCA;
  // final String routeFromCA;
  final FunctionSDKCA<CertInfoRequestIcare, CertInfoResponseIcare> cerInfo;
  final FunctionSDKCA<ListCertsRequestIcare, ListCertsResponseIcare> listCerts;
  final FunctionSDKCA<ListSignRequestIcare, ListSignResponseIcare> listSign;
  final FunctionSDKCA<ConfirmSignRequestIcare, ConfirmSignResponseIcare>
      confirmSign;
  final FunctionSDKCA<VerifyCertRequestICare, VerifyCertResponseICare>
      verifyCert;

  IcareModulesRequest({
    required this.emailFromCA,
    // required this.routeFromCA,
    required this.cerInfo,
    required this.listCerts,
    required this.listSign,
    required this.confirmSign,
    required this.verifyCert,
  });
}

typedef FunctionSDKCA<Req, Res> = Future<Res?> Function([
  Res Function(Map<String, dynamic> json)? parser,
  Req? request,
]);
