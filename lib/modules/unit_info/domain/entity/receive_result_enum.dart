import '../../../src.dart';

enum ReceiveResultEnum {
  // Nhận tại CQBH
  postOffice(0, LocaleKeys.unitInfo_byPostOffice),

  // Qua bưu điện
  socialAgency(1, LocaleKeys.unitInfo_bySocialAgency);

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
