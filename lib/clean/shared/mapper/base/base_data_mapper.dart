/// Map from data to entity
abstract class BaseDataMapper<Data, Entity> {
  const BaseDataMapper();

  Entity mapToEntity(Data? data);

  List<Entity> mapToListEntity(Iterable<Data>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }

  Set<Entity> mapToSetEntity(Iterable<Data>? setData) {
    return setData?.map(mapToEntity).toSet() ?? <Entity>{};
  }
}

/// One-way mapping: Entity → Data
abstract class BaseEntityMapper<Entity, Data> {
  Data mapToData(Entity entity);

  Data? mapToNullableData(Entity? entity) {
    if (entity == null) {
      return null;
    }

    return mapToData(entity);
  }

  List<Data>? mapToNullableListData(List<Entity>? listEntity) {
    return listEntity?.map(mapToData).toList();
  }

  List<Data> mapToListData(List<Entity>? listEntity) {
    return mapToNullableListData(listEntity) ?? List.empty();
  }
}

/// Map from entity to data
mixin DataMapperMixin<Data, Entity> on BaseDataMapper<Data, Entity> {
  Data mapToData(Entity entity);

  Data? mapToNullableData(Entity? entity) {
    if (entity == null) {
      return null;
    }

    return mapToData(entity);
  }

  List<Data>? mapToNullableListData(List<Entity>? listEntity) {
    return listEntity?.map(mapToData).toList();
  }

  List<Data> mapToListData(List<Entity>? listEntity) {
    return mapToNullableListData(listEntity) ?? List.empty();
  }
}
