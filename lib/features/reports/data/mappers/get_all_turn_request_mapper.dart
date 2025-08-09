import 'package:taqueria_vargas/features/reports/data/dtos/get_all_register_turns_request_dto.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';

class GetAllTurnRequestMapper {

  static GetAllRegisterTurnsRequestEntity toEntity({required GetAllRegisterTurnsRequestDto dto}) {

    return GetAllRegisterTurnsRequestEntity(
      companyBranchId: dto.companyBranchId,
      page: dto.page,
      pageSize: dto.pageSize,
    );
    
  } 

  static GetAllRegisterTurnsRequestDto toDto({required GetAllRegisterTurnsRequestEntity request}) {

    return GetAllRegisterTurnsRequestDto(
      companyBranchId: request.companyBranchId,
      page: request.page,
      pageSize: request.pageSize,
    );

  }

}