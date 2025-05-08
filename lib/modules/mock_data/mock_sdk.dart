import '../icare/models/icare_model.src.dart';

class MockSdk {
  static final MockSdk _instance = MockSdk._internal();

  factory MockSdk() {
    return _instance;
  }

  MockSdk._internal();

  /// Mock data chạy từ icare
  bool isMock = false;

  /// Mock data chạy từ icare
  String mockEmail = "khaivv@softdreams.vn";

  ListCertsResponseIcare mockListCertsResponseIcare() {
    ListCertsResponseIcare listCertsResponseIcare =
        ListCertsResponseIcare.fromJson({
      "certs": [
        {
          "currentSignCount": 0,
          "issuer": "CN\u003dEASYCA",
          "maxSignCount": 5000,
          "serial": "5E133B3E1B2BA2BA717E4FB08FFB9108",
          "status": "ACTIVE",
          "subject":
              "0.9.2342.19200300.100.1.1\u003dCCCD:0107489961,CN\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,O\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,OU\u003dou,T\u003dnhanvien,L\u003dphamhung,ST\u003d01,C\u003dVN,E\u003dhoten6116@gmail.com,P\u003d0981541702",
          "validFrom": "20250404142303",
          "validTo": "20260404142303"
        },
        {
          "currentSignCount": 0,
          "issuer": "CN\u003dEASYCA",
          "maxSignCount": 5000,
          "serial": "29D197F25C22C400E20218B0EC1AE76E",
          "status": "INITIALIZED",
          "subject":
              "0.9.2342.19200300.100.1.1\u003dCCCD:012012311-301,CN\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,O\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,OU\u003dou,T\u003dnhanvien,L\u003dphamhung,ST\u003d01,C\u003dVN,E\u003dhoten6116@gmail.com,P\u003d0981541702",
          "validFrom": "20250403111600",
          "validTo": "20260403111600"
        }
      ],
      "error_code": "200",
      "error_message": ""
    });
    return listCertsResponseIcare;
  }

  CertInfoResponseIcare mockCertInfoResponseIcare() {
    return CertInfoResponseIcare.fromJson({
      "cert_info": {
        "currentSignCount": 0,
        "email": "luongnt@softdreams.vn",
        "issuer": "CN\u003dEASYCA",
        "maxSignCount": 5000,
        "packageName": "Cá nhân 12 tháng",
        "packageSignName": "5000",
        "phone": "0981541702",
        "raw":
            "MIIDqDCCApCgAwIBAgIQXhM7Phsrorpxfk+wj/uRCDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZFQVNZQ0EwHhcNMjUwNDA0MDcxMzAyWhcNMjYwNDA0MDcxMzAyWjB1MQswCQYDVQQGEwJWTjESMBAGA1UECAwJSMOgIE7hu5lpMS8wLQYDVQQDDCZDw5RORyBUWSBD4buUIFBI4bqmTiBDw5RORyBOR0jhu4YgT1RQMTEhMB8GCgmSJomT8ixkAQEMEUNDQ0Q6MDEyMDEyMzExMzAxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmdnLIc8nIdmjSYdP3dXEfE4UgCExSmhA/Zmfdmd2ofDFef3NTaT+dkegUjyggVo2T3ecDeP8YtJTG0IVA8xj5B7YkoK87d6dmPPyGh0c6UlIyOGMA2XjqE7p9sMClcptmJZCf6IaCFsNhq3OqaP8zMSixrKC+8OIzly5cYQikXQSXNVR/xX5g74/rilGE3SoX/luyWZZ55VTfUlfzjFtQdWh7oUageYxaBe2kMVq1uNFlxj2D55CL6xEQp4woHyQveI8j7lEmoQDAnTK34iULPs72nHXswtHZcnstDNTYx505Kj3FqFZ+qrRrsMccTKnEStXXz/8gYOfaCloTIXbXQIDAQABo4GXMIGUMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUyiR0adupxzvY5iyoqiw7uO/pePwwNAYDVR0lBC0wKwYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUwHQYDVR0OBBYEFGb956xEoISgKJECAxmhBHoFKujuMA4GA1UdDwEB/wQEAwIE8DANBgkqhkiG9w0BAQsFAAOCAQEAZusP4GOsyaxmz9n/tsdK/kWkDXTjuoP7aAryjvs6RneM5NY/4EnLT06ygaHbM0PwGPikjRO+1U1rdIT/JVbht7TpPpUelBDoZpXY2DKcpEc4yBhKV0S7xal0kE6HrFv8v872zkUGwk+1DcE3tYZl36TqOJs2FjnaUydBPIefUduFTo/O5RAHboHkESeNaHG9b4XRy1EuGnYhJm40uwW/TCE5bh7uykpEHiEXjZZ+If9qtszU8gRqw1oqX2hUaMfpCrroWd+ttRVYuXYHM1/ILbW6A4SFatTs8UZSyvoyk3W3PCrjmlxLc+6K1CW1dCKxkVZKV2BVb9wSLZE3zBrZMQ\u003d\u003d",
        "serial": "5E133B3E1B2BA2BA717E4FB08FFB9108",
        "status": "ACTIVE",
        "subject":
            "0.9.2342.19200300.100.1.1\u003dCCCD:012012311301,CN\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,O\u003dCÔNG TY CỔ PHẦN CÔNG NGHỆ OTP1,OU\u003dou,T\u003dnhanvien,L\u003dphamhung,ST\u003d01,C\u003dVN,E\u003dhoten6116@gmail.com,P\u003d0981541702",
        "validFrom": "20250404142303",
        "validTo": "20260404142303"
      },
      "error_code": "200",
      "error_message": ""
    });
  }

  ListSignResponseIcare mockListSignResponseIcare() {
    return ListSignResponseIcare.fromJson({
      "error_code": "200",
      "error_message": "",
      "sign_requests": [
        {
          "authData":
              "{\"challenge\":\"eeYD+NtpbRKyDFh6HmflBbEIOnFeChKzR08pPDg9eXqMlOtGNugiMuVG/FrcIH5Giif+cE2Ri25guCUxjo6rkrkiqPgWMEcrfTKVMFf0M9CuV0SDHXOKK1WTx9Fm4NjM9KSMR210wLsyO7SzewYYDPJ0Eusfw7ro0sqrufeI9i1rZSb4N84z5KbgUaLiyXjCZrN85S3OxhTJ4Q6bp0XAhkv3b/jO97AokHRrLVKHhDGDgbtxrnIyT/cp/WF/2++6YLzsCvMHlKAnCi3WnDpkW5kV+0a3IfaKH5v80WGczlUbvpgCRtjwuTlspMgniiL0\",\"hashAlgo\":\"SHA256\",\"signAlgo\":\"RSA-PKCS1-v1_5\"}",
          "authId": "a94b053d-9b5d-43e3-9034-e9a16c069d13",
          "certSubject": "CÔNG TY CỔ PHẦN ICARE VIỆT NAM",
          "confirmSignData":
              "{\"notiMsg\":\"Bạn có yêu cầu ký số cần xác thực\",\"scaId\":\"Bảo hiểm xã hội iCare\",\"msgCaption\":\"Bạn có yêu cầu ký số cần xác thực\"}",
          "createTime": "20250408101954",
          "dtbs":
              "[\"5c0de1d31ec82c86172dc6cbe4c4247f3fffa4472ae41f2f2d34d425075bea5b\"]",
          "expireTime": "20250408102454",
          "serial": "0A2F95A0C2B9273B2565332FAA8F33B2",
          "signAppInfo": "Bảo hiểm xã hội iCare",
          "signRequestId": "b4706944-8306-4af6-894d-4756a6fe1315"
        }
      ]
    });
  }
}
