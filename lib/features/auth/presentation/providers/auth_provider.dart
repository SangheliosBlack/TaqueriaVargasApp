import 'package:flutter/material.dart';
import 'package:nullable_absent/nullable_absent.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/application/application.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_state.dart';
import 'package:taqueria_vargas/features/auth/domain/params/login_params.dart';
import 'package:taqueria_vargas/features/auth/presentation/screen/login_web_screen.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/screens/point_of_sale_screen.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/orders_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'login_user_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)

class Auth extends _$Auth{

  @override
  AuthState build() {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    emailController.addListener(() {
      state = state.copyWith(email: emailController.text);
    });

    passwordController.addListener(() {
      state = state.copyWith(password: passwordController.text);
    });

    _checkAutentication();

    return AuthState(
      emailController: emailController,
      passwordController: passwordController,
      authenticationStatus: AuthenticationStatus.checking
    );

  }

  DeviceIdService get deviceIdService => ref.read(deviceIdServideDi);
  AuthUseCases get authUseCases => ref.read(useCasesAuth);

  Future<void> login() async{

    loadingState();

    final params = LoginParams(
      email: state.email, 
      password: state.password,
      //deviceId: state.deviceId
      deviceId: "6bc1a2c9-cd3c-4653-92f5-ba3717606862"
    );

    final useCase = await ref.read(loginUseCaseProvider).execute(params: params);

    if(useCase is DataSuccess){

      state = state.copyWith(
        user: useCase.data!.user,
        isLoading: false,
        authenticationStatus: AuthenticationStatus.authenticated,
        isOpenPosStation:useCase.data!.isOpenPosStation
      );
      
      await getCurrentTurn();

      // Remover navegación manual - dejar que GoRouter maneje la navegación basada en roles
      // _authenticationNavigate();


    }else{

      state = state.copyWith(
        errorMessage: useCase.error?.message,
        isLoading: false,
      );

    }

  }
  
  

   Future<void> loadUser () async {

    try {
      
      final response = await authUseCases.loadUser();

      state = state.copyWith(
        user: response.data!.user,
        isOpenPosStation: response.data!.isOpenPosStation,
      );
    
      return;

    } catch (e) {

      logout();
      
    }

  } 

  void loadingState() => state = state.copyWith(isLoading: true,errorMessage: "");

  void finishLoading() => state = state.copyWith(isLoading: false);

  bool isFormValid(){

    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final passwordRegExp = RegExp(r'^(?=.*\d{4,})(?=.*[!@#$%^&*]).{5,}$');

    final emailValid = emailRegExp.hasMatch(state.emailController!.text);
    final passwordValid = passwordRegExp.hasMatch(state.passwordController!.text);


    return emailValid && passwordValid;

  }

  Future<void> _checkAutentication() async{

    await Future.delayed(Duration(milliseconds: 300));

    final deviceId = await deviceIdService.getDeviceId();

    final AuthenticationStatus isAuthenticated = await ref.read(authenticationServiceNotifierProvider.notifier).checkAuthenticationStatus();

    if(isAuthenticated == AuthenticationStatus.authenticated){

      // Cargar datos del usuario antes de establecer como autenticado
      await loadUser();
      await getCurrentTurn();
      
    }

    // Actualizar estado después de cargar usuario
    state = state.copyWith(
      authenticationStatus : isAuthenticated,
      deviceId: deviceId
    );
    
  }

  void isOpenUpdate({required bool isOpenToday}) async {

    state = state.copyWith(isOpenPosStation:isOpenToday,user: state.user!.copyWith( ));

  }

  Future<void> logout() async{

    await ref.read(authenticationServiceNotifierProvider.notifier).logout();

    state.emailController?.clear();
    state.passwordController?.clear();


    state = state.copyWith(
      authenticationStatus: AuthenticationStatus.notAuthenticated
    );

    _authenticationNavigate();

  }

  Future<void> _authenticationNavigate() async{

    final navigate = ref.read(navigationProvider);

    if (state.authenticationStatus == AuthenticationStatus.authenticated) {

      // Verificar rol del usuario para navegación apropiada
      if (state.user != null && state.user!.isWaiter) {
        navigate(OrdersScreen.path); // OrdersScreen para meseros
      } else {
        navigate(PointOfSaleScreen.path); // PoHomeScreen para cajeros/admin
      }

    } else if (state.authenticationStatus == AuthenticationStatus.notAuthenticated) {

      navigate(LoginScreen.path);

    }

    return;

  }

  void removeCurrentTurn() {
    
    state = state.copyWith(currentTurn: NullableAbsent(null));
    
  }

    Future<void> getCurrentTurn() async {

    final useCase = await authUseCases.getCurrentTurn();

    if(useCase is DataSuccess){

      if(useCase.data != null){

        state = state.copyWith(
          currentTurn: NullableAbsent(useCase.data)
        );
      
      }


    }
  }

}
