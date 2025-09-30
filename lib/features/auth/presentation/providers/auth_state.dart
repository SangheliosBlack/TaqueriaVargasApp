import 'package:flutter/material.dart';
import 'package:nullable_absent/nullable_absent.dart';
import 'package:taqueria_vargas/core/services/auth_service/authentication_service_state.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/current_turn_entity.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';

class AuthState {

  final bool isLoading;
  final UserEntity? user;
  final String email;
  final String password;
  final String errorMessage;
  final AuthenticationStatus authenticationStatus;
  final bool isOpenPosStation;

  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  final String deviceId;

  final CurrentTurnEntity? currentTurn;


  AuthState({
    this.isLoading = false,
    this.user,
    this.email = "",
    this.password = "",
    this.errorMessage = "",
    this.emailController,
    this.passwordController,
    this.authenticationStatus = AuthenticationStatus.checking,
    this.deviceId = "",
    this.currentTurn,
    this.isOpenPosStation = false
  });

  AuthState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? email,
    String? password,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    AuthenticationStatus? authenticationStatus,
    String? deviceId,
    NullableAbsent<CurrentTurnEntity> currentTurn = const NullableAbsent.absent(),
    bool? isOpenPosStation
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage : errorMessage ?? this.errorMessage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
      deviceId: deviceId ?? this.deviceId,
      currentTurn: NullableAbsent(this.currentTurn).apply(currentTurn),
      isOpenPosStation : isOpenPosStation ?? this.isOpenPosStation
    );
  }

}