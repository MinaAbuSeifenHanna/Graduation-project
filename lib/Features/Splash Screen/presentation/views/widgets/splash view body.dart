import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/Auth/presentation/views/login_view.dart';
import 'package:graduateproject/core/utils/assets_data.dart';

import '../../../../../core/utils/app_router.dart';



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:3),
            () => GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryAppColor,
      body: Center(
        child: Image.asset(
          AssetsData.logoAPP
          ,),
      ),

    );
  }
}
