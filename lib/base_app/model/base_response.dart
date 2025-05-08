import 'package:v_bhxh/core/values/const.dart';

class BaseResponse<T> {
  final String code;
  final String errorMessage;
  final T? result;

  BaseResponse({
    required this.code,
    required this.errorMessage,
    required this.result,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? fromJson,
  }) {
    final dynamic resultData = json["result"];

    return BaseResponse(
      code: json["code"] ?? '',
      errorMessage: json["errorMessage"] ?? '',
      result: (resultData is Map<String, dynamic> && fromJson != null)
          ? fromJson(resultData)
          : resultData as T?,
    );
  }

  Map<String, dynamic> toMap(Object Function(T)? toJson) => {
        "code": code,
        "errorMessage": errorMessage,
        "result": result != null
            ? (toJson != null ? toJson(result as T) : result)
            : null,
      };

  bool get isSuccess => code == AppConst.statusCodeSuccess;
}
