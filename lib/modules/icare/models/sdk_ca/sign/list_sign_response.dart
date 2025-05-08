import 'dart:convert';

import 'package:v_bhxh/modules/icare/models/icare_model.src.dart';

class ListSignResponseIcare extends BaseResponseSDK {
  const ListSignResponseIcare({
    required super.errorCode,
    required super.errorMessage,
    this.signRequests = const [],
  });

  factory ListSignResponseIcare.fromJson(Map<String, dynamic> json) {
    return ListSignResponseIcare(
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      signRequests: List.from(
        json['sign_requests'].map((e) => SignIcare.fromJson(e)) ?? [],
      ),
    );
  }

  final List<SignIcare> signRequests;

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'sign_requests': signRequests.map((e) => e.toJson()).toList(),
    };
  }
}

class SignIcare {
  const SignIcare({
    required this.signRequestId,
    required this.certSerial,
    required this.certSubject,
    required this.dtbsInfo,
    required this.authId,
    required this.authData,
    this.signAppInfo,
    this.signEnvInfo,
    required this.createTime,
    required this.expireTime,
    this.confirmSignData,
  });

  factory SignIcare.fromJson(Map<String, dynamic> json) {
    return SignIcare(
      signRequestId: json['signRequestId'],
      certSerial: json['serial'],
      certSubject: json['certSubject'],
      dtbsInfo: json['dtbs'],
      authId: json['authId'],
      authData: json['authData'] is String
          ? AuthDataIcare.fromJson(jsonDecode(json['authData']))
          : AuthDataIcare.fromJson(json['authData']),
      signAppInfo: json['signAppInfo'],
      signEnvInfo: json['signEnvInfo'],
      createTime: json['createTime'],
      expireTime: json['expireTime'],
      confirmSignData: json['confirmSignData'],
    );
  }

  final String signRequestId;
  final String certSerial;
  final String certSubject;
  final String dtbsInfo;
  final String authId;
  final AuthDataIcare authData;
  final String? signAppInfo;
  final String? signEnvInfo;
  final String createTime;
  final String expireTime;
  final String? confirmSignData;

  Map<String, dynamic> toJson() {
    return {
      'signRequestId': signRequestId,
      'serial': certSerial,
      'certSubject': certSubject,
      'dtbs': dtbsInfo,
      'authId': authId,
      'authData': authData.toJson(),
      'signAppInfo': signAppInfo,
      'signEnvInfo': signEnvInfo,
      'createTime': createTime,
      'expireTime': expireTime,
      'confirmSignData': confirmSignData,
    };
  }
}

class AuthDataIcare extends BaseModelSDK {
  const AuthDataIcare({
    required this.challenge,
    required this.hashAlgo,
    required this.signAlgo,
  });

  factory AuthDataIcare.fromJson(Map<String, dynamic> json) {
    return AuthDataIcare(
      challenge: json['challenge'],
      hashAlgo: json['hashAlgo'],
      signAlgo: json['signAlgo'],
    );
  }

  final String challenge;
  final String hashAlgo;
  final String signAlgo;

  @override
  Map<String, dynamic> toJson() {
    return {
      'challenge': challenge,
      'hashAlgo': hashAlgo,
      'signAlgo': signAlgo,
    };
  }
}

class SignAppInfoIcare {
  const SignAppInfoIcare({
    required this.appId,
    required this.appVersion,
  });

  factory SignAppInfoIcare.fromJson(Map<String, dynamic> json) {
    return SignAppInfoIcare(
      appId: json['app_id'],
      appVersion: json['app_version'],
    );
  }

  final String appId;
  final String appVersion;

  Map<String, dynamic> toJson() {
    return {
      'app_id': appId,
      'app_version': appVersion,
    };
  }
}
