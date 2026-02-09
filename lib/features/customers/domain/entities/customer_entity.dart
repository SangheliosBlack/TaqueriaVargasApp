import 'package:taqueria_vargas/core/resources/mappable.dart';
import 'package:meta/meta.dart';

@immutable
class CustomerEntity extends Mappable {
  
  final int? id;
  final String? fullName;
  final String? phone;
  final String? address;
  final String? references;
  final DateTime? createdAt;

  CustomerEntity({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.references,
    this.createdAt
  });

  String get formattedPhone {

    final sanitizedPhone = phone?.replaceAll(' ', '') ?? "";

    final buffer = StringBuffer();

    if (sanitizedPhone.length == 10) {
      buffer.write(sanitizedPhone.substring(0, 3));
      buffer.write(' - ');
      buffer.write(sanitizedPhone.substring(3, 6));
      buffer.write(' - ');
      buffer.write(sanitizedPhone.substring(6));
    } else {
      buffer.write(sanitizedPhone); 
    }
    return buffer.toString();

  }
  
  @override
  Map<String, dynamic> toMap() {
    return {
    'id': id,
    'full_name': fullName,
    'phone': phone,
    'address': address,
    'reference': references,
    'created_at': createdAt?.toIso8601String(),
    };
  }

}
