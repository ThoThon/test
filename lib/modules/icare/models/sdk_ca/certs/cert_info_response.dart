import 'package:v_bhxh/modules/certificate_list/models/cert_status_enum.dart';
import 'package:v_bhxh/modules/icare/icare.src.dart';

class CertInfoResponseIcare extends BaseResponseSDK {
  CertInfoResponseIcare({
    required super.errorCode,
    required super.errorMessage,
    this.certInfo,
  });

  factory CertInfoResponseIcare.fromJson(Map<String, dynamic> json) {
    return CertInfoResponseIcare(
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      certInfo: json['cert_info'] == null
          ? null
          : CertInfo.fromJson(json['cert_info']),
    );
  }

  CertInfo? certInfo;

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'cert_info': certInfo?.toJson(),
    };
  }
}

class CertInfo extends CertIcare {
  CertInfo({
    super.serial,
    super.subject,
    super.issuer,
    super.message,
    super.validFrom,
    super.validTo,
    super.currentSignCount,
    super.maxSignCount,
    this.raw,
    this.email,
    this.phone,
    this.packageName,
    this.packageSignName,
  });

  factory CertInfo.fromJson(Map<String, dynamic> json) {
    return CertInfo(
      serial: json['serial'],
      subject: json['subject'],
      issuer: json['issuer'],
      message: json['message'],
      validFrom: json['validFrom'],
      validTo: json['validTo'],
      currentSignCount: json['currentSignCount'],
      maxSignCount: json['maxSignCount'],
      raw: json['raw'],
      email: json['email'],
      phone: json['phone'],
      packageName: json['packageName'],
      packageSignName: json['packageSignName'],
    );
  }

  String? raw;
  String? email;
  String? phone;
  String? packageName;
  String? packageSignName;

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'raw': raw,
      'email': email,
      'phone': phone,
      'packageName': packageName,
      'packageSignName': packageSignName,
    };
  }

  @override
  bool get isActive => status == CertStatusEnum.active;

  @override
  String? getCertIssuer() => issuer?.split('=').last;

  @override
  Map<String, String> getCertSubject() {
    final map = <String, String>{};
    final lines = subject?.split(',') ?? [];

    for (final line in lines) {
      final parts = line.split('=');
      map[parts.first] = parts.last;
    }

    return map;
  }
}
