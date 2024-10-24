import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/home%20detect%20screen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../news Home/data/comments model.dart';
import '../../../../news Home/data/models/comment model.dart';
import '../../../../news Home/data/models/model.dart';
import '../../../../news Home/presentation/views/postesveiw.dart';
import '../../../../profile/presention/views/profile veiw.dart';
import '../../../data/models/user data mode.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final ImagePicker picker = ImagePicker();
  PageController pageController = PageController(initialPage: 0);

  ///--------------------------------------end work ------------------
  List screens = const[
    PostsView(),
    HomeDetectScreen(),
    ProfileView(),
  ];
  List<String> titles = [
    'Home',
    'Detect',
    'Profile',
  ];

  void changeIndexBottomNav(int index) {



    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  ///-------------------------------------------------------------

  UserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingState());
    if (kDebugMode) {
      print('here is uid $uId');
    }
    FirebaseFirestore.instance.collection('users').doc(uId)
        .get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetUserErrorState(error.toString()));
    });
  }

  Future<void> signOutUser() async {
    emit(SignOutLoadingState());
    try {
      // Add code here to sign the user out from your authentication provider
      // For example, if you're using Firebase Authentication:
      await FirebaseAuth.instance.signOut();

      // Emit SignOutSuccessState when sign-out is successful
      emit(SignOutSuccessState());
      print('Logged out'); // Print a message indicating successful sign-out
    } catch (e) {
      // Handle different error scenarios
      emit(SignOutFailureState(errorMessage: e.toString()));
      print('Sign-out failed: $e');
    }
  }

  ///------------ post -----------------------------



  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(CreatePostLoadingState());
    PostModel? model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(CreatePostErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


  void createComment({
    required String dateTime,
    required String commentText,
    required String uID ,

  }) {
    emit(CreateCommentLoadingState());
    CommentsModel? model = CommentsModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: uID,
      dateTime: dateTime,
      comment: commentText,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(uID)
        .collection('comments')
        .add(model.toMap())
        .then((value) {
      emit(CreateCommentSuccessState());

    }).catchError((error) {
      emit(CreateCommentFeilreState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }



  File? postImage;

  Future<void> getPostImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    postImage = File(image!.path);
    emit(PostImagePickedSuccessState());
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri
        .file(postImage!.path)
        .pathSegments
        .last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(CreatePostSuccessState());
        if (kDebugMode) {
          print(value);
        }
        createPost(dateTime: dateTime, text: text, postImage: value);
      }).catchError((error) {
        emit(CreatePostErrorState());
        if (kDebugMode) {
          print(error.toString());
        }
      });
    });

    ///------------------------------------------------


    List<String> postsId = [];
    List<int> likes = [];
    List<int> nComments = [];
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /*
  void updateUserData({
    required String name,
    required String phone,
    required String bio,
  }) {
    SocialUserModel? model = SocialUserModel(
      phone: phone,
      name: name,
      image: userModel!.image,
      bio: userModel!.bio,
      cover: userModel!.cover,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void updateUserName({
    required String name,
  }) {
    emit(SocialUpdateUserNameLoadingState());
    SocialUserModel? model = SocialUserModel(
      name: name,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update({
      'name': name,
    }).then((value) {
      getUserData();
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
      emit(SocialUpdateUserNameSuccessState());
    }).catchError((error) {
      emit(SocialUpdateUserNameErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void updateUserBio({
    required String bio,
  }) {
    emit(SocialUpdateUserBioLoadingState());
    SocialUserModel? model = SocialUserModel(
      bio: bio,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update({
      'bio': bio,
    }).then((value) {
      getUserData();
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
      emit(SocialUpdateUserBioSuccessState());
    }).catchError((error) {
      emit(SocialUpdateUserBioErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void updateUserPhone({
    required String phone,
  }) {
    emit(SocialUpdateUserPhoneLoadingState());
    SocialUserModel? model = SocialUserModel(
      phone: phone,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update({
      'phone': phone,
    }).then((value) {
      getUserData();
      emit(SocialUpdateUserPhoneSuccessState());
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
    }).catchError((error) {
      emit(SocialUpdateUserPhoneErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void updateUserImage({
    required String image,
  }) {
    emit(SocialUpdateUserImageLoadingState());
    SocialUserModel? model = SocialUserModel(
      image: image,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update({
      'image': image,
    }).then((value) {
      getUserData();
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
      emit(SocialUpdateUserImageSuccessState());
    }).catchError((error) {
      emit(SocialUpdateUserImageErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void updateUserCover({
    required String cover,
  }) {
    emit(SocialUpdateUserCoverLoadingState());
    SocialUserModel? model = SocialUserModel(
      image: cover,
      isEmailVerified: false,
      uId: userModel!.uId,
      email: userModel!.email,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update({
      'cover': cover,
    }).then((value) {
      getUserData();
      emit(SocialUpdateUserCoverSuccessState());
      showToast(text: "Update Successful", state: ToastStates.SUCCESS);
    }).catchError((error) {
      emit(SocialUpdateUserCoverErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

   */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
