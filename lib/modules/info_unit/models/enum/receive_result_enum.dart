import '../../../src.dart';

enum ReceiveResultEnum {
  //Nhận qua bưu điện
  postOffice(1, LocaleKeys.unitInfo_byPostOffice),

  //Nhận qua cơ quan BHXH
  socialAgency(2, LocaleKeys.unitInfo_bySocialAgency);

  final String receive;
  final int type;

  const ReceiveResultEnum(
    this.type,
    this.receive,
  );
}

ReceiveResultEnum? getReceiveResult(String? receiveSelected) {
  return ReceiveResultEnum.values.firstWhereOrNull(
    (e) => e.receive.tr == receiveSelected,
  );
}
