import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class CircularProgressIndicatorApp extends StatelessWidget {
  const CircularProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.primaryAppColor,
      body:  Center(
        child:  CircularProgressIndicator(
          color: MyColors.secondAppColor,

        ),
      ),
    );
  }
}