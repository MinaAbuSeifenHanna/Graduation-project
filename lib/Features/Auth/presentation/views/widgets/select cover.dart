import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/select%20cover%20item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/circular Progress Indicator App.dart';
import '../../../../Detects potato diseases/presentation/views/widgets/CustomElevatedButton.dart';
import '../../../../Home/presentation/manager/home_cubit/home_cubit.dart';
import '../../manager/register_cubit/register_cubit.dart';

class SelectCover extends StatelessWidget {
  const SelectCover({super.key});

  @override
  Widget build(BuildContext context) {
    late bool isLoading;
    return SafeArea(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is UploadCoverImageLoading) {
            isLoading = true;
          } else if (state is UploadCoverImageSuccess) {
            isLoading = false;
            // CacheNetwork.insertToCache(key: 'uId', value: state.uId);
            // uId = state.uId;
            // BlocProvider.of<HomeCubit>(context).changeBottomNavBarState(0);
            /// await BlocProvider.of<HomeCubit>(context).getUserData();
            BlocProvider.of<HomeCubit>(context).getUserData();
            GoRouter.of(context).go(AppRouter.kHomeView);
          } else if (state is UploadCoverImageFailure) {
            isLoading = false;
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is UploadCoverImageLoading) {
            return const CircularProgressIndicatorApp();
          } else {
            return Scaffold(
                backgroundColor: MyColors.primaryAppColor,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'please Select your photo cover',
                          style: APPStyles.textStyle17,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SelectCoverItem(),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            RegisterCubit.get(context).uploadCoverImage(
                                RegisterCubit.get(context).image!, uId!);
                          },
                          buttonText: 'Save change',
                        ),
                      ]),
                ));
          }
        },
      ),
    );
  }
}
