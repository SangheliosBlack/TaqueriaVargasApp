import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';

class CompanyMapper {

    static CompanyEntity fromDto(CompanyDto dto) {
      return CompanyEntity(
        id: dto.id,
        name: dto.name,
      );
    }

}