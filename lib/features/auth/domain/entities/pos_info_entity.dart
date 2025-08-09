import 'package:hive/hive.dart';

part 'pos_info_entity.g.dart';

@HiveType(typeId: 4)
class PosInfoEntity {

  @HiveField(0)
  int id;

  @HiveField(1)
  String code;

  @HiveField(2)
  String name;

  PosInfoEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  factory PosInfoEntity.fromJson(Map<String, dynamic> json) => PosInfoEntity(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

}
