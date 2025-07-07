import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

/// - Nhận kết quả hồ sơ
///
/// - Không dùng ReceiveResultModel (dangKyNhanSoThes category) từ BE vì đang sai chính tả và tester Lan Ngọc có mong muống dùng fix cứng như này.
enum ReceiveProfileResultEnum {
  /// Nhận kết quả bản điện tử
  electronic,

  /// Nhận kết quả bản giấy
  paper;

  String get title {
    switch (this) {
      case ReceiveProfileResultEnum.electronic:
        return LocaleKeys.declareInfo_receiveResultElectronic.tr;
      case ReceiveProfileResultEnum.paper:
        return LocaleKeys.declareInfo_receiveResultPaper.tr;
    }
  }
}
