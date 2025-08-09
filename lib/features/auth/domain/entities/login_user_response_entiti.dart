
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';

class LoginUserEntity {

    UserEntity user;
    String accessToken;

    LoginUserEntity({
        required this.user,
        required this.accessToken,
    });

}
