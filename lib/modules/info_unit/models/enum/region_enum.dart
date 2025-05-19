import 'package:v_bhxh/modules/src.dart';

enum RegionEnum {
  // Vùng 1
  regionOne(1, LocaleKeys.unitInfo_regionOne),

  // Vùng 2
  regionTwo(2, LocaleKeys.unitInfo_regionTwo),

  // Vùng 3
  regionThree(3, LocaleKeys.unitInfo_regionThree),

  // Vùng 4
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
