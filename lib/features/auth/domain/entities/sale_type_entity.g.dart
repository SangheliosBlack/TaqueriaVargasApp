// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_type_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleTypeEntityAdapter extends TypeAdapter<SaleTypeEntity> {
  @override
  final int typeId = 3;

  @override
  SaleTypeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleTypeEntity(
      id: fields[0] as int,
      code: fields[1] as String,
      description: fields[2] as String,
      value: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaleTypeEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleTypeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
