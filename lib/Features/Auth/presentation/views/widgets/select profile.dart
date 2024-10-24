import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/select%20profile%20item.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/widgets/CustomElevatedButton.dart';
import 'package:graduateproject/core/utils/constants.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20App.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/app_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../Home/presentation/manager/home_cubit/home_cubit.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    late bool isLoading ;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      if (state is UploadProfileImageLoading) {
        isLoading = true;

      }
      else if (state is UploadProfileImageSuccess) {
        isLoading = false;
        // CacheNetwork.insertToCache(key: 'uId', value: state.uId);
        // uId = state.uId;

        /// await BlocProvider.of<HomeCubit>(context).getUserData();

        GoRouter.of(context).go(AppRouter.kNextRegisterCoverView);
      }
      else if (state is UploadProfileImageFailure) {
        isLoading = false;
        showSnackBar(context, state.errorMessage);
      }
    },

      builder: (context, state) {
        if(state is UploadProfileImageLoading)
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
                    const SelectProfileItem(),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(onPressed: () {
                      RegisterCubit.get(context).uploadProfileImage(RegisterCubit.get(context).image!, uId!);

                    },
                      buttonText: 'Save change',
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
