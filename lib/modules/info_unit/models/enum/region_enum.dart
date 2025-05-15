import 'package:v_bhxh/modules/src.dart';

enum RegionEnum {
  regionOne(1, LocaleKeys.unitInfo_regionOne),
  regionTwo(2, LocaleKeys.unitInfo_regionTwo),
  regionThree(3, LocaleKeys.unitInfo_regionThree),
  regionFour(4, LocaleKeys.unitInfo_regionFour);

  final int codeRegion;
  final String title;

  const RegionEnum(this.codeRegion, this.title);
}

RegionEnum? getRegionByCode(int? code) {
  return RegionEnum.values.firstWhereOrNull(
    (e) => e.codeRegion == code,
  );
}
