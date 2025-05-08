import '../../icare.src.dart';

abstract class BaseResponseSDK extends BaseModelSDK {
  const BaseResponseSDK({
    required this.errorCode,
    required this.errorMessage,
  });

  /// Mã lỗi tương ứng
  final String errorCode;

  /// Mô tả tương ứng với mã lỗi
  final String errorMessage;

  bool get isSuccess => errorCode.endsWith('200');

  @override
  Map<String, dynamic> toJson() {
    return {
      'error_code': errorCode,
      'error_message': errorMessage,
    };
  }
}
