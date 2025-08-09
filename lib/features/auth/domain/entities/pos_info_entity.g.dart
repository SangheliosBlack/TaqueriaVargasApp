// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PosInfoEntityAdapter extends TypeAdapter<PosInfoEntity> {
  @override
  final int typeId = 4;

  @override
  PosInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PosInfoEntity(
      id: fields[0] as int,
      code: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PosInfoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
