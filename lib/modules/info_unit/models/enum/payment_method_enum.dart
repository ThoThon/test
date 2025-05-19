import '../../../src.dart';

enum PaymentMethodEnum {
  // 1 tháng
  oneMonth(1, LocaleKeys.unitInfo_oneMonth),

  // 3 tháng
  threeMonth(3, LocaleKeys.unitInfo_threeMonth),

  // 6 tháng
  sixMonth(6, LocaleKeys.unitInfo_sixMonth);

  final String title;
  final int month;

  const PaymentMethodEnum(this.month, this.title);
}

PaymentMethodEnum? getPaymenteMethod(int? month) {
  return PaymentMethodEnum.values.firstWhereOrNull(
    (e) => e.month == month,
  );
}
