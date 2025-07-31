import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';

class SelectDistrictArgument {
  final String provinceCode;
  final District? selectedDistrict;

  const SelectDistrictArgument({
    required this.provinceCode,
    this.selectedDistrict,
  });
}
