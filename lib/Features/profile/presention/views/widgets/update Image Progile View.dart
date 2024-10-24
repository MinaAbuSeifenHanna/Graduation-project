import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/select%20profile%20item.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/widgets/CustomElevatedButton.dart';
import 'package:graduateproject/Features/profile/manager/profile_cubit.dart';
import 'package:graduateproject/core/utils/constants.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20App.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/app_router.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../Home/presentation/manager/home_cubit/home_cubit.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    late bool isLoading ;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadingState) {
          isLoading = true;

        }
        else if (state is ProfileSuccessChangeProfileImageState) {
          isLoading = false;
          // CacheNetwork.insertToCache(key: 'uId', value: state.uId);
          // uId = state.uId;

          /// await BlocProvider.of<HomeCubit>(context).getUserData();

          GoRouter.of(context).go(AppRouter.kHomeView);
        }

      },

      builder: (context, state) {
        if(state is ProfileLoadingState)
        {
          return const  CircularProgressIndicatorApp();
        }

        else{
          return SafeArea(
            child: Scaffold(
              backgroundColor: MyColors.primaryAppColor,
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Text('please Select your photo profile',
                      style: APPStyles.textStyle17,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     CircleAvatar(
                     radius: 73,
                         backgroundColor: Theme
                         .of(context)
                         .scaffoldBackgroundColor,
                     child:  CircleAvatar(
                       radius: 70.0,
                       /////////////////////////////////////////////////////////////////
                       backgroundImage:  NetworkImage(
                         HomeCubit.get(context).userModel!.image!
                            ),
                     ),
                                 ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(onPressed: () {
                      ProfileCubit.get(context)
                          .updateProfileImage(uId!, context).then((value) {
                            HomeCubit.get(context).getUserData();
                      }).catchError((e){
                        print('koooooooooooooooooooooooooooos');
                        print(e.toString());
                      });

                    },
                      buttonText: 'update profile image',
                    )

                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
