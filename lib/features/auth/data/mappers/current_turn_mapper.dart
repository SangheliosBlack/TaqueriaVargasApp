
import 'package:taqueria_vargas/features/auth/data/dtos/current_turn_dto.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/current_turn_entity.dart';

class CurrentTurnMapper {
  
  static CurrentTurnEntity toEntity(CurrentTurnDto dto) {
    return CurrentTurnEntity(
      id: dto.id,
      openingDate: dto.openingDate,
      active: dto.active,
    );
  }

}
