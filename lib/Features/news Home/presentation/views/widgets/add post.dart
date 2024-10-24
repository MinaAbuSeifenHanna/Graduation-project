import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/widgets/CustomElevatedButton.dart';
import 'package:graduateproject/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/widgets/add%20post%20header.dart';
import 'package:graduateproject/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';


class AddPostView extends StatelessWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      if(state is CreatePostSuccessState)
        {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);

        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.primaryAppColor,
          appBar: AppBar(
            backgroundColor: MyColors.secondAppColor,
            title: const Text('Create Post',
              style: APPStyles.textStyle22,
            ),
            centerTitle: true,
          ),

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is CreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is CreatePostSuccessState)
                  const SizedBox(
                    height: 15,
                  ),

                const AddPostHeader(),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: MyColors.myWhite,
                    ),
                    controller: textController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        color: MyColors.myRed,
                      ),
                      labelStyle: TextStyle(
                        color: MyColors.myBlue,
                      ),
                      hintStyle: TextStyle(
                        color: MyColors.myGrey,
                      ),
                      hintText: 'What is on your mind  ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                  if (HomeCubit.get(context).postImage != null)
                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                         image: DecorationImage(
                         image: FileImage(HomeCubit.get(context).postImage! ),
                           fit: BoxFit.cover,
                      ),
                    ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            HomeCubit.get(context).removePostImage();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    var now = DateTime.now();

                    if (HomeCubit.get(context).postImage == null)
                    {

                      HomeCubit.get(context).createPost(
                        dateTime: now.toString(),
                        text: textController.text,

                      );
                      textController.clear();
                      print('Add Text /////////////');

                    }
                    else {
                      HomeCubit.get(context).uploadPostImage(
                          dateTime: now.toString(), text: textController.text);
                      HomeCubit.get(context).removePostImage();
                      print('Add post /////////////');
                    }

                    textController.clear();
                  }, buttonText: 'add post',),

                Expanded(
                  child: TextButton(
                      onPressed: () {
                           HomeCubit.get(context).getPostImage();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.image),
                          SizedBox(
                            width: 5,
                          ),
                          Text('add photo'),
                        ],
                      )),
                ),
              ],
            ),
          ),);
      },
    );
  }


}
