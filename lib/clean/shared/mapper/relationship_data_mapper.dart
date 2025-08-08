import 'package:v_bhxh/clean/shared/model/relationship_data.dart';
import 'package:v_bhxh/clean/shared/entity/relationship.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

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
