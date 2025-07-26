class BaseResponseCl<T> {
  final String code;
  final String errorMessage;
  final T? result;

  BaseResponseCl({
    required this.code,
    required this.errorMessage,
    required this.result,
  });

  factory BaseResponseCl.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? fromJson,
  }) {
    final result = json['result'];
    return BaseResponseCl<T>(
      code: json['code'] as String,
      errorMessage: json['errorMessage'] as String,
      result: (result is Map<String, dynamic> && fromJson != null)
          ? fromJson(result)
          : result as T?,
    );
  }

  bool get isSuccess => code == '00';
}
