import 'package:flutter/material.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/profile/presention/views/widgets/profile%20body.dart';
import 'package:graduateproject/Features/profile/presention/views/widgets/profile%20header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: MyColors.primaryAppColor,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(children: [
            ProfileHeader(),
            ProfileBody(),
          ])),
        ));
  }
}
