import 'package:v_bhxh/clean/shared/constants/const.dart';

class BaseResponseListCl<T> {
  final String code;
  final String? errorMessage;
  final List<T> result;

  BaseResponseListCl({
    required this.code,
    this.errorMessage,
    required this.result,
  });

  factory BaseResponseListCl.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final result = json["result"];
    return BaseResponseListCl<T>(
      code: json['code'] as String,
      errorMessage: json['errorMessage'] as String?,
      result: (result as List<dynamic>)
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  bool get isSuccess => code == responseCodeSuccess;
}
