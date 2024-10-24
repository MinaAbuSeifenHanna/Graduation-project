

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:graduateproject/Features/Auth/data/repos/auth_repo.dart';
import 'package:graduateproject/core/utils/app_router.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitialState());

  final AuthRepo authRepo;

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool isPassword = true;

  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    emit(LoginChangePasswordVisibilityLoadingState());
    isPassword = !isPassword;
    suffixIcon =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilitySuccessState());
  }


  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      // Call the login method from the auth repository
      String userId = await authRepo.userLogin(
        email: email,
        password: password,
      );

      // Emit LoginSuccessState with the userId if login is successful
      emit(LoginSuccessState(uId: userId));
      print('Logged in'); // Print a message indicating successful login


    } catch (e) {
      // Handle different error scenarios
      emit(LoginFailureState(errorMessage: e.toString()));
      print('Login failed: $e');
    }
  }





}