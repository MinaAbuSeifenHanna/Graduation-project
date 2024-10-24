
import 'package:flutter/material.dart';

import 'package:graduateproject/core/utils/styles.dart';

import '../../../../../Core/utils/my_colors.dart';


class ElevatedButtonAPP extends StatelessWidget {
  const ElevatedButtonAPP({
    super.key,
    required this.text,
    required  this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style:  ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                MyColors.secondAppColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
               fixedSize:const  MaterialStatePropertyAll(
                 Size(double.infinity, 50),

               ),




            ),
            onPressed: onPressed,
            child: Text(
              text,
              /// make style
                 style: APPStyles.textStyle18
            ),
          ),
        ),
      ],
    );
  }
}
