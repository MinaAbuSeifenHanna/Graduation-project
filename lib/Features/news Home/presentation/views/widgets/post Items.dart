import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/post.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20App.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20erro.dart';

class PostItems extends StatelessWidget {
  const PostItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.primaryAppColor,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                      'Don\'t exist posts',
                      textAlign: TextAlign.center,
                      style: APPStyles.textStyle20,
                    ),
                  ),
                ));
              }
              return ListView.separated(
                itemBuilder: (context, index) =>
                    Post(
                  userName: userSnapshot[index]['name'],
                  profileImage: userSnapshot[index]['image'] ,
                  dateTime:  userSnapshot[index]['dateTime'],
                  postImage: userSnapshot[index]['postImage'] ,
                  textPost: userSnapshot[index]['text'],
                      postUID: snapshot.data!.docs[index].id  ,
                ),
                itemCount: userSnapshot.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
              );
            }));
  }
}
