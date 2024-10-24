import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/assets_data.dart';

class SelectProfileItem extends StatelessWidget {
  const SelectProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            CircleAvatar(
              radius: 73,
              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              child:  CircleAvatar(
                radius: 70.0,
                backgroundImage: (RegisterCubit.get(context).image != null)
                    ? FileImage(File(RegisterCubit.get(context).image!.path))as ImageProvider<Object>?
                    : const AssetImage(
                    AssetsData.profileImage,
                ),
              ),
            ),
            Positioned(
                right: 2,
                bottom: 5,
                child: CircleAvatar(
                  backgroundColor: MyColors.secondAppColor,
                  child: IconButton(
                    color: MyColors.myWhite,
                    onPressed: () {
                      RegisterCubit.get(context).getImage();
                    },
                    icon: Icon(Icons.add),
                  ),
                )),
          ],
        );
      },
    );
  }
}
