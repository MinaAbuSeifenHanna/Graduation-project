
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  /// update profile image
  Future<void> updateProfileImage(String userId , BuildContext context) async {
    await RegisterCubit.get(context).getImage(); // Trigger image selection
    if (RegisterCubit.get(context).image != null) {
      emit(ProfileLoadingState());
      await RegisterCubit.get(context).uploadProfileImage(
          RegisterCubit.get(context).image!, userId);
      emit(ProfileSuccessChangeProfileImageState());
      // Upload selected image
    } else {
      emit(ProfileErrorChangeProfileImageState());
      print('No image selected.');
    }
  }
/// update cover image
  Future<void> updateCoverImage(String userId , BuildContext context) async {
    await RegisterCubit.get(context).getImage(); // Trigger image selection
    if (RegisterCubit.get(context).image != null) {
      emit(ProfileLoadingState());
      await RegisterCubit.get(context).uploadCoverImage(
          RegisterCubit.get(context).image!, userId);
      emit(ProfileSuccessChangeProfileImageState());
      // Upload selected image
    } else {
      emit(ProfileErrorChangeProfileImageState());
      print('No image selected.');
    }
  }

  ///
  /// under review
  ///
  /// Delete profile image
  Future<void> deleteProfileImage(String userId) async {
    try {
      emit(DeleteProfileImageLoading());

      final firebase_storage.Reference ref = firebase_storage.FirebaseStorage
          .instance
          .ref()
          .child('profile_images/$userId.png');

      await ref.delete();

      // Remove profile image URL from Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profileImage': FieldValue.delete(),
      });

      emit(DeleteProfileImageSuccess());
    } catch (e) {
      emit(DeleteProfileImageFailure(errorMessage: e.toString()));
      print('Error deleting profile image: $e');
      // Handle error
    }
  }
  /// Delete cover image
  Future<void> deleteCoverImage(String userId) async {
    try {
      emit(DeleteCoverImageLoading());

      final firebase_storage.Reference ref = firebase_storage.FirebaseStorage
          .instance
          .ref()
          .child('cover_images/$userId.png');

      await ref.delete();

      // Remove cover image URL from Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'coverImage': FieldValue.delete(),
      });

      emit(DeleteCoverImageSuccess());
    } catch (e) {
      emit(DeleteCoverImageFailure(errorMessage: e.toString()));
      print('Error deleting cover image: $e');
      // Handle error
    }
  }


/// update name




/// update pio

///  my posts
///  delete post
///  delete comment
///  sign out
///  shared pref
///  pop menu
///






}
