
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';

class AuthUserEntity {

    UserEntity user;
    String? accessToken;
    bool isOpenPosStation;

    AuthUserEntity({
        required this.user,
        this.accessToken,
        required this.isOpenPosStation
    });

}
