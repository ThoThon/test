import 'package:v_bhxh/clean/shared/model/position_data.dart';
import 'package:v_bhxh/clean/shared/entity/position.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class PositionDataMapper extends BaseDataMapper<PositionData, Position> {
  @override
  Position mapToEntity(PositionData? data) {
    return Position(
      id: data?.id ?? 0,
      name: data?.name ?? '',
    );
  }
}
