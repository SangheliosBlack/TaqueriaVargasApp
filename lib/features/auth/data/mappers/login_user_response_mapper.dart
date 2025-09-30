import 'package:taqueria_vargas/features/auth/data/dtos/user_login_response_dto.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/user_mapper_response.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/login_user_response_entiti.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';

class AuthResponseMapper {

  final UserEntity user;
  final String? accessToken;
  final bool isOpenPOS;


  AuthResponseMapper({
    required this.user,
    this.accessToken,
    required this.isOpenPOS
  });

  static AuthUserEntity toLoginUserEntity(UserLoginResponseDTO dto) {
    return AuthUserEntity(
      user: UserMapper.toEntity(dto.user),
      accessToken: dto.accessToken, 
      isOpenPosStation: dto.isOpenPOS,
    );
  }

}
