class BaseResponse<T> {
  final bool success;
  final String message;
  final T? data;

  BaseResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic json)? func,
  }) {
    return BaseResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: func != null ? func(json['data']) : json['data'],
    );
  }
}
