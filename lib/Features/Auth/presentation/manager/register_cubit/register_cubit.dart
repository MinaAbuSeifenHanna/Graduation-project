import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../Home/data/models/user data mode.dart';
///import 'package:equatable/equatable.dart';

import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;
  bool isPassword = true;

  ///------------------- profile image----------
  ImagePicker picker = ImagePicker();
  List? myList;
  //File? file;

  bool isLoading = true;
  XFile? image;

  /// get image from phone store
  getImage() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    emit(SelectImageSuccess());
    //setState(() {});


  }
// Method to upload image to Firebase Storage
//   Future<void> updateProfileImage(String userId) async {
//     await getImage(); // Trigger image selection
//     if (image != null) {
//       await uploadProfileImage(image!, userId); // Upload selected image
//     } else {
//       print('No image selected.');
//     }
//   }


  Future<void> uploadProfileImage(XFile? imageFile, String userId) async {
    try {
      emit(UploadProfileImageLoading());

      String url;

      if (imageFile != null) {
        final firebase_storage.Reference ref = firebase_storage.FirebaseStorage
            .instance
            .ref()
            .child('profile_images/$userId.png');

        final firebase_storage.UploadTask uploadTask = ref.putFile(
            File(imageFile.path));

        final firebase_storage.TaskSnapshot downloadUrl = await uploadTask;
        url = await downloadUrl.ref.getDownloadURL();
      } else {
        // If imageFile is null, load image from the internet (replace 'YOUR_IMAGE_URL' with the actual URL)
        url = 'YOUR_IMAGE_URL';
      }

      // Store profile image URL in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profileImage': url,
      });
      emit(UploadProfileImageSuccess());
    } catch (e) {
      emit(UploadProfileImageFailure(errorMessage: e.toString()));
      print('Error uploading profile image: $e');
      // Handle error
    }
  }
  Future<void> uploadCoverImage(XFile? imageFile, String userId) async {
    try {
      emit(UploadCoverImageLoading());

      String url;

      if (imageFile != null) {
        final firebase_storage.Reference ref = firebase_storage.FirebaseStorage
            .instance
            .ref()
            .child('cover_images/$userId.png');

        final firebase_storage.UploadTask uploadTask = ref.putFile(
            File(imageFile.path));

        final firebase_storage.TaskSnapshot downloadUrl = await uploadTask;
        url = await downloadUrl.ref.getDownloadURL();
      } else {
        // If imageFile is null, load image from the internet (replace 'YOUR_IMAGE_URL' with the actual URL)
        url = 'YOUR_IMAGE_URL';
      }

      // Store cover image URL in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'coverImage': url,
      });
      emit(UploadCoverImageSuccess());
    } catch (e) {
      emit(UploadCoverImageFailure(errorMessage: e.toString()));
      print('Error uploading cover image: $e');
      // Handle error
    }
  }





  bool isConfPassword = true;
  void changeConfPasswordVisibility() {
    emit(RegisterChangePasswordVisibilityLoadingState());
    isConfPassword = !isConfPassword;
    suffixIcon =
    isConfPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilitySuccessState());
  }

  IconData suffixIcon = Icons.visibility_outlined;
  void changePasswordVisibility() {
    emit(RegisterChangePasswordVisibilityLoadingState());
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilitySuccessState());
  }


  Future<void> userRegister({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      // Call the userRegister method from the auth repository
      String userId = await authRepo.userRegister(
        username: username,
        email: email,
        password: password,
      );

      // Emit RegisterSuccessState with the userId if registration is successful
      emit(RegisterSuccessState(uId: userId));
      print(' user add sucess');
    } catch (e)
    {
      // Emit RegisterFailureState with the error message if registration fails
      emit(RegisterFailureState(errorMessage: e.toString()));
      print('failed add user');
    }
  }





}
