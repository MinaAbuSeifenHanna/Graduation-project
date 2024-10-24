import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/assets_data.dart';

class SelectCoverItem extends StatelessWidget {
  const SelectCoverItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              height: 180.0,
              width: double.infinity,
              decoration:  BoxDecoration(
                border: Border.all(
                    color: MyColors.secondAppColor,
                  width: 4

                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  image:  (RegisterCubit.get(context).image != null)
                      ? FileImage(File(RegisterCubit.get(context).image!.path))as ImageProvider<Object>
                      : const AssetImage(
                    AssetsData.profileImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                right: 7,
                bottom: 7,
                child: CircleAvatar(
                  backgroundColor: MyColors.secondAppColor,
                  child: IconButton(
                    color: MyColors.myWhite,
                    onPressed: () {
                      RegisterCubit.get(context).getImage();
                    },
                    icon: const Icon(Icons.add),
                  ),
                )),
          ],
        );
      },
    );
  }
}
