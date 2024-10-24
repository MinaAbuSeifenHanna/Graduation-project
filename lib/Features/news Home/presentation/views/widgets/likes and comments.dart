import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class LikesAndComments extends StatelessWidget {
  const LikesAndComments({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.heart_broken,
                    size: 16.0,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '20',
                  ),

                ],
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.chat,
                    size: 16.0,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    //'${SocialCubit.get(context).getPostCommentNumber(postsId[index])} comments',
                      'comments',
                      style: APPStyles.textStyle14
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
