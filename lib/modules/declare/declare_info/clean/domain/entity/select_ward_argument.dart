import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';

class SelectWardArgument implements Entity {
  final String provinceCode;
  final String districtCode;
  final Ward? selectedWard;

  const SelectWardArgument({
    required this.provinceCode,
    required this.districtCode,
    this.selectedWard,
  });
}
