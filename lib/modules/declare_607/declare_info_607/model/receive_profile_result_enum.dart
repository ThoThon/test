import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

/// - Nhận kết quả hồ sơ
///
/// - Không dùng ReceiveResultModel (dangKyNhanSoThes category) từ BE vì đang sai chính tả và tester Lan Ngọc có mong muống dùng fix cứng như này.
enum ReceiveProfileResultEnum {
  /// DT - Nhận kết quả bản điện tử
  electronic,

  /// G - Nhận kết quả bản giấy
  paper;

  static const defaultValue = ReceiveProfileResultEnum.electronic;

  String get title {
    switch (this) {
      case ReceiveProfileResultEnum.electronic:
        return LocaleKeys.declareInfo_receiveResultElectronic.tr;
      case ReceiveProfileResultEnum.paper:
        return LocaleKeys.declareInfo_receiveResultPaper.tr;
    }
  }

  String get code {
    switch (this) {
      case ReceiveProfileResultEnum.electronic:
        return 'DT';
      case ReceiveProfileResultEnum.paper:
        return 'G';
    }
  }

  static ReceiveProfileResultEnum? fromCode(String? value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'DT':
        return ReceiveProfileResultEnum.electronic;
      case 'G':
        return ReceiveProfileResultEnum.paper;
      default:
        return null;
    }
  }
}
