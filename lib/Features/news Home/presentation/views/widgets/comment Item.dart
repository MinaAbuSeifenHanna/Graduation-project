import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/post%20header.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/styles.dart';
import 'comment Header.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key ,required this.postUID, required this.commentText, required this.profileImage ,required this.userName , required this.dateTime});
  final String profileImage ;
  final String userName ;
  final String dateTime ;
  final String commentText ;
  final String postUID ;


  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          CommentHeader(
            dateTime: dateTime ,
            profileImage: profileImage ,
            userName: userName ,
          ),
          Card(
            color: MyColors.myManatee,
            child: Text(commentText,
              style: APPStyles.textStyle18,
            ),





          )
        ]);


  }
}
