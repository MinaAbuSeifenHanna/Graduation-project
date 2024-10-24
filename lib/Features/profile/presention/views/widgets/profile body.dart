import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../Detects potato diseases/presentation/views/widgets/CustomElevatedButton.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
             Text(
              HomeCubit.get(context).userModel!.name!,
              style: APPStyles.textStyle17,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
                'flutter developer',
                style: APPStyles.textStyle15
            ),
            const SizedBox(
              height: 50,
            ),
            CustomElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kAddPostView);
              },
              buttonText: 'Add Post',
            ),
          ],
        );
      },
    );
  }
}
