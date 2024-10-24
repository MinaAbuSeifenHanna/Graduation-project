import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:graduateproject/core/utils/assets_data.dart';
import 'package:graduateproject/core/utils/my_colors.dart';
import 'package:graduateproject/core/widgets/Elevated_Button_APP.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/cache_network.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../Home/presentation/views/widgets/home page.dart';
import 'Text_Form_Field_Auth.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  var email = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void checkAuthStatus() async {}

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginLoadingState) {
        isLoading = true;
      } else if (state is LoginSuccessState) {
        isLoading = false;
        CacheHelper.saveData(key: 'uId', value: state.uId);
        uId = state.uId;
        //BlocProvider.of<HomeCubit>(context).changeBottomNavBarState(0);
        //  await BlocProvider.of<HomeCubit>(context).getUserData();
        ///   GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        ///
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      } else if (state is LoginFailureState) {
        isLoading = false;
        showSnackBar(context, state.errorMessage);
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: MyColors.primaryAppColor,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsData.logoAPP,
                    ),
                    TextFormFieldAuth(
                      controller: email,
                      labelText: 'Enter your user email ',
                      suffixIcon: const Icon(Icons.email),
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Address is required';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormFieldAuth(
                      controller: password,
                      labelText: 'Enter your user password ',
                      suffixIcon: IconButton(
                        onPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        icon: Icon(LoginCubit.get(context).suffixIcon),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      textInputType: TextInputType.visiblePassword,
                      obscureText: LoginCubit.get(context).isPassword,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButtonAPP(
                      text: 'sign in ',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).loginUser(
                              email: email.text, password: password.text);
                          email.clear();
                          password.clear();
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont Have An Account  ? '),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go(AppRouter.kRegisterView);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )),
          ));
    });
  }
}
