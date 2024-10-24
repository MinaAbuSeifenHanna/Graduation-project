
import 'package:flutter/material.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/styles.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key , required this.profileImage ,required this.userName , required this.dateTime});
  final String profileImage ;
  final String userName ;
  final String dateTime ;
  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
         CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
                profileImage ,
          ),
        ),
         const SizedBox(
          width: 15.0,
        ),
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  userName,
                  style: APPStyles.textStyle16
              ),
              Text(
                  dateTime.substring(0,16) ,
                  style: APPStyles.textStyle14
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            size: 20.0,
            color: MyColors.myWhite,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
