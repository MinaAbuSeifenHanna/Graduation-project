part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String uId;

   LoginSuccessState({required this.uId});
}

final class LoginFailureState extends LoginState {
  final String errorMessage;

   LoginFailureState({required this.errorMessage});
}

final class LoginChangePasswordVisibilityLoadingState extends LoginState {}

final class LoginChangePasswordVisibilitySuccessState extends LoginState {}


