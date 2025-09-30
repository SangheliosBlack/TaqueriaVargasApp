import 'user_dto.dart';

class UserLoginResponseDTO {

  final UserDTO user;
  final String? accessToken;
  final bool isOpenPOS;

  UserLoginResponseDTO({
    required this.user,
    this.accessToken,
    required this.isOpenPOS
  });

  factory UserLoginResponseDTO.fromJson(Map<String, dynamic> map) {

    return UserLoginResponseDTO(
      user: UserDTO.fromJson(map['user']),
      accessToken: map['accessToken'],
      isOpenPOS: map['isOpenPosStation']
    );

  }

  Map<String, dynamic> toMap() {

    return {
      'user': user.toMap(),
      'accessToken': accessToken,
    };

  }

}