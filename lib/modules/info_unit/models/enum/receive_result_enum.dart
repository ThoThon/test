import '../../../src.dart';

enum ReceiveResultEnum {
  //Nhận qua bưu điện
  postOffice(LocaleKeys.unitInfo_byPostOffice),

  //Nhận qua cơ quan BHXH
  socialAgency(LocaleKeys.unitInfo_bySocialAgency);

  final String receive;

  const ReceiveResultEnum(this.receive);
}

ReceiveResultEnum? getReceiveResult(String? receiveSelected) {
  return ReceiveResultEnum.values.firstWhereOrNull(
    (e) => e.receive.tr == receiveSelected,
  );
}
