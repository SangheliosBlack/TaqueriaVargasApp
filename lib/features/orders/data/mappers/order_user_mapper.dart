import 'package:taqueria_vargas/features/orders/data/dtos/order_user_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class OrderUserMapper {

  static OrderUserEntity toEntity({required OrderUserDto dto}) {
    return OrderUserEntity(
      id: dto.id,
      fullName: dto.fullName,
    );
  }

}
