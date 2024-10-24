

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/core/utils/assets_data.dart';
import 'package:graduateproject/core/utils/my_colors.dart';
import 'package:graduateproject/core/widgets/Elevated_Button_APP.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/cache_network.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/circular Progress Indicator App.dart';
import '../../../../Home/presentation/views/widgets/home page.dart';
import '../../manager/register_cubit/register_cubit.dart';
import 'Text_Form_Field_Auth.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  var userName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late bool isLoading;
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterLoadingState) {
        isLoading = true;

      }
      else if (state is RegisterSuccessState) {
        isLoading = false;
        CacheHelper.saveData(key: 'uId', value: state.uId);
        uId = state.uId;
        // BlocProvider.of<HomeCubit>(context).changeBottomNavBarState(0);
        /// await BlocProvider.of<HomeCubit>(context).getUserData();
print('//////////////////////////////////////////////////');
print(uId);
        GoRouter.of(context).go(AppRouter.kNextRegisterProfileView);
      }
      else if (state is RegisterFailureState) {
        isLoading = false;
        showSnackBar(context, state.errorMessage);
      }
    },
        builder: (context, state) {
      if (state is RegisterLoadingState)
        {
          return const CircularProgressIndicatorApp();
        }
      else {
      return  Scaffold(
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
                          controller: userName,
                          labelText: 'Enter your user name ',
                          suffixIcon: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'user name  is required';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                              RegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffixIcon),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(Icons.lock_outline),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: RegisterCubit.get(context).isPassword,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButtonAPP(
                            text: 'sign up ',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                    username: userName.text,
                                    email: email.text,
                                    password: password.text);
                                userName.clear();
                                email.clear();
                                password.clear();
                              }

                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('already have an account   '),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go(AppRouter.kLoginView);
                              },
                              child: const Text(
                                'Login',
                                style:
                                TextStyle(color: Colors.green, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
      }

    });
  }
}
