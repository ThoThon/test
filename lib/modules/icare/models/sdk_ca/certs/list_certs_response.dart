import 'package:v_bhxh/modules/icare/models/icare_model.src.dart';

class ListCertsResponseIcare extends BaseResponseSDK {
  const ListCertsResponseIcare({
    required super.errorCode,
    required super.errorMessage,
    this.certs = const [],
  });

  factory ListCertsResponseIcare.fromJson(Map<String, dynamic> json) {
    return ListCertsResponseIcare(
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      certs: (json['certs'] as List?)
              ?.map((e) => CertIcare.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Nếu null, trả về danh sách rỗng
    );
  }

  final List<CertIcare> certs;

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'certs': certs.map((cert) => cert.toJson()).toList(),
    };
  }
}

class CertIcare {
  CertIcare({
    this.serial,
    this.subject,
    this.issuer,
    this.status,
    this.message,
    this.validFrom,
    this.validTo,
    this.currentSignCount,
    this.maxSignCount,
  });

  factory CertIcare.fromJson(Map<String, dynamic> json) {
    return CertIcare(
      serial: json['serial'],
      subject: json['subject'],
      issuer: json['issuer'],
      status: json['status'],
      message: json['message'],
      validFrom: json['validFrom'],
      validTo: json['validTo'],
      currentSignCount: json['currentSignCount'],
      maxSignCount: json['maxSignCount'],
    );
  }
  String? serial;
  String? subject;
  String? issuer;
  String? status;
  String? message;
  String? validFrom;
  String? validTo;
  int? currentSignCount;
  int? maxSignCount;

  Map<String, dynamic> toJson() {
    return {
      'serial': serial,
      'subject': subject,
      'issuer': issuer,
      'status': status,
      'message': message,
      'validFrom': validFrom,
      'validTo': validTo,
      'currentSignCount': currentSignCount,
      'maxSignCount': maxSignCount,
    };
  }

  // bool get isActive => status == CertStatusEnum.active;

  String? getCertIssuer() => issuer?.split('=').last;

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
