import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/auth_service/authentication_service_state.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_notifier.g.dart';

@riverpod
AppRouterNotifier appRouterNotifier(ref){

  return AppRouterNotifier(ref: ref);

}

class AppRouterNotifier extends ChangeNotifier {

  final Ref <AppRouterNotifier>? ref;

  AuthenticationStatus _authenticationStatus = AuthenticationStatus.checking;
  UserEntity? _currentUser;

   AppRouterNotifier({this.ref}) {

    // Inicializar con los valores actuales del estado
    if (ref != null) {
      final currentAuthState = ref!.read(authProvider);
      _authenticationStatus = currentAuthState.authenticationStatus;
      _currentUser = currentAuthState.user;
    }

     ref?.listen<AuthenticationStatus>(authProvider.select((state) => state.authenticationStatus),
      (_, next) {
         debugPrint('AuthenticationStatus changed: $next');
        _authenticationStatus = next;
        notifyListeners();
      },
    );
    
    // Escuchar cambios en el usuario para obtener el rol
    ref?.listen<UserEntity?>(authProvider.select((state) => state.user),
      (_, next) {
        debugPrint('User changed: ${next?.fullName} - Role: ${next?.roles.isNotEmpty == true ? next?.roles.first.code : "No roles"}');
        _currentUser = next;
        notifyListeners();
      },
    );
    
  }

  AuthenticationStatus get authenticationStatus => _authenticationStatus;
  UserEntity? get currentUser => _currentUser;

  set authenticationStatus(AuthenticationStatus status){

    _authenticationStatus = status;

    notifyListeners();

  }

}