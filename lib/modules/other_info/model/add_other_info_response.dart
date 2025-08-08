import '../../../core/values/const.dart';

class AddOtherInfoResponse<T> {
  final String data;
  final String code;
  final String errorMessage;
  final T? result;

  AddOtherInfoResponse({
    required this.data,
    required this.code,
    required this.errorMessage,
    required this.result,
  });

  factory AddOtherInfoResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic)? fromJson,
  }) {
    return AddOtherInfoResponse<T>(
      data: json["data"]?.toString() ?? '',
      code: json["code"]?.toString() ?? '',
      errorMessage: json["errorMessage"]?.toString() ?? '',
      result: json.containsKey("result") && fromJson != null
          ? fromJson(json["result"])
          : json["result"] as T?,
    );
  }

  bool get isSuccess => code == AppConst.statusCodeSuccess;
}
