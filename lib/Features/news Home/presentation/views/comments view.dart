import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/Text_Form_Field_Auth.dart';
import 'package:graduateproject/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/comment%20Item.dart';
import 'package:graduateproject/core/utils/constants.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20App.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20erro.dart';

import '../../../../Core/utils/my_colors.dart';
import '../../../../core/utils/app_router.dart';

class CommentView extends StatelessWidget {
  CommentView({super.key, required this.postUID});

  final String postUID;

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Comment View'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
            ),
          ),
          backgroundColor: MyColors.primaryAppColor,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('posts')
                          .doc(postUID)
                          .collection('comments')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicatorApp();
                        }
                        if (snapshot.hasError) {
                          return const CircularProgressIndicatorError();
                        }

                        final userSnapshot = snapshot.data?.docs;
                        if (userSnapshot!.isEmpty) {
                          return const Center(
                              child: Align(
                            alignment: Alignment.center,
                            child: Card(
                              color: Colors.grey,
                              child: Text(
                                'No Comments',
                                textAlign: TextAlign.center,
                                style: APPStyles.textStyle18,
                              ),
                            ),
                          ));
                        }

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            itemBuilder: (context, index) => CommentItem(
                              commentText: userSnapshot[index]['comment'],
                              profileImage: userSnapshot[index]['image'],
                              userName: userSnapshot[index]['name'],
                              dateTime: userSnapshot[index]['dateTime'],
                              postUID: userSnapshot[index]['uId'],
                            ),
                            itemCount: userSnapshot.length,
                          ),
                        );
                      }),
                ),
                TextFormFieldAuth(
                  controller: comment,
                  suffixIcon: IconButton(
                    onPressed: () {
                      HomeCubit.get(context).createComment(
                        dateTime: DateTime.now().toString(),
                        commentText: comment.text,
                        uID: postUID,
                      );
                      comment.clear();
                    },
                    icon: const Icon(Icons.subdirectory_arrow_right_sharp),
                  ),
                  labelText: 'write your comment',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
