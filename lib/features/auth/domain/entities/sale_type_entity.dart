import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

part 'sale_type_entity.g.dart';

@HiveType(typeId: 3)
class SaleTypeEntity {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String value;

  SaleTypeEntity({
    required this.id,
    required this.code,
    required this.description,
    required this.value
  });

  IconData get getIcon {
    
    switch (code) {
      case 'STORE':
        return FontAwesomeIcons.utensils;
      case 'DELIVER':
        return FontAwesomeIcons.motorcycle;
      case 'TOGO':
        return FontAwesomeIcons.personWalkingArrowRight;
      case 'PICK':
        return Icons.drive_eta;
      default:
        return Icons.help_outline;
    }

  }

}
