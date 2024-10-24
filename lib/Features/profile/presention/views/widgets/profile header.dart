import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../../core/utils/app_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 240,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: InkWell(
                  onDoubleTap: (){
                    GoRouter.of(context).go(AppRouter.kUpdateCoverView);

                  },
                  child: Container(
                    height: 180.0,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                         HomeCubit.get(context).userModel!.cover!
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onDoubleTap: (){
                  GoRouter.of(context).pushReplacement(AppRouter.kUpdateProfileView);
                },
                child: CircleAvatar(
                  radius: 73,
                  backgroundColor: MyColors.secondAppColor,
                  child:  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        HomeCubit.get(context).userModel!.image!
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
