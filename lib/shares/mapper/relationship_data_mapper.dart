import 'package:v_bhxh/clean/core/data/model/relationship_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/relationship.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class RelationshipDataMapper
    extends BaseDataMapper<RelationshipData, Relationship> {
  @override
  Relationship mapToEntity(RelationshipData? data) {
    return Relationship(
      value: data?.value ?? '',
      text: data?.text ?? '',
    );
  }
}
