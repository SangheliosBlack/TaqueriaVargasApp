
import 'package:hive/hive.dart';

part 'company_entity.g.dart';

@HiveType(typeId: 2)
class CompanyEntity {

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;
  
  CompanyEntity({
    required this.id,
    required this.name,
  });

  CompanyEntity copyWith({
    int? id,
    String? name,
  }) {
    return CompanyEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

}