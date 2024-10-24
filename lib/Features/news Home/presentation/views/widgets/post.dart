import 'package:flutter/material.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/image%20post.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/likes%20and%20comments.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/post%20bottom.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/post%20header.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/styles.dart';
import 'line.dart';

class Post extends StatelessWidget {
   Post({super.key , required this.postUID , required this.textPost, required this.dateTime , required this.userName , required this.profileImage , required this.postImage});
  final String profileImage ;
  final String userName ;
  final String dateTime ;
   final String postImage ;
   final String textPost ;
   final String postUID ;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: MyColors.myManatee,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(dateTime: dateTime,profileImage: profileImage,userName: userName,),
            const Line(),
            Text(textPost, style: APPStyles.textStyle14),

            ///---------------------------------------------------------
            if (postImage != '')
            ImagePost(PostImage: postImage ,),

            const Line(),
             PostBottom(profileImage: profileImage,postUID: postUID, ),
          ],
        ),
      ),
    );
  }
}
