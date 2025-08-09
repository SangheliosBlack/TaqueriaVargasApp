import 'package:meta/meta.dart';

@immutable
class LoginParams {
  final String email;
  final String password;
  final String deviceId;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
      'pos_id': deviceId,
    };
  }
}
