import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class PostBottom extends StatelessWidget {
  const PostBottom({super.key , required this.profileImage , required this.postUID});
final String profileImage ;
  final String postUID ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
          //    GoRouter.of(context).go('kCommentView/$postUID');

              context.goNamed("commentView", pathParameters: {'id': postUID, });

            },
            child:  Row(children: [
              CircleAvatar(
                radius: 18.0,
                backgroundImage: NetworkImage(
                    profileImage                  // '  SocialCubit

                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text('write a comment ...', style: APPStyles.textStyle14),
            ]),
          ),
        ),

      ],
    );
  }
}
