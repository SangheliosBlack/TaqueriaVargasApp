// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      id: fields[0] as int,
      email: fields[1] as String,
      fullName: fields[2] as String,
      phone: fields[3] as String,
      imgProfile: fields[4] as String?,
      roles: (fields[5] as List).cast<RoleEntity>(),
      company: fields[6] as CompanyEntity,
      posInfo: fields[7] as PosInfoEntity?,
      isOpenToday: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.imgProfile)
      ..writeByte(5)
      ..write(obj.roles)
      ..writeByte(6)
      ..write(obj.company)
      ..writeByte(7)
      ..write(obj.posInfo)
      ..writeByte(8)
      ..write(obj.isOpenToday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
