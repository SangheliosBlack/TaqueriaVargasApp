// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoleEntityAdapter extends TypeAdapter<RoleEntity> {
  @override
  final int typeId = 1;

  @override
  RoleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoleEntity(
      id: fields[0] as int,
      code: fields[1] as String,
      description: fields[2] as String,
      saleTypes: (fields[3] as List).cast<SaleTypeEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoleEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.saleTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
