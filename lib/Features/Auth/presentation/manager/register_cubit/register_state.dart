part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String uId;
   RegisterSuccessState({required this.uId});
}



final class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}


final class RegisterChangePasswordVisibilityLoadingState
    extends RegisterState {}

final class RegisterChangePasswordVisibilitySuccessState
    extends RegisterState {}

final class SelectImageSuccess
    extends RegisterState {}

final class UploadProfileImageLoading
    extends RegisterState {}
final class UploadProfileImageSuccess
    extends RegisterState {}
final class UploadProfileImageFailure
    extends RegisterState {
  final String errorMessage;

  UploadProfileImageFailure({required this.errorMessage});


}
final class UploadCoverImageLoading
    extends RegisterState {}
final class UploadCoverImageSuccess
    extends RegisterState {}
final class UploadCoverImageFailure
    extends RegisterState {
  final String errorMessage;

  UploadCoverImageFailure({required this.errorMessage});


}
final class UpdateUserImageLoadingState extends RegisterState {}

final class UpdateUserImageSuccessState extends RegisterState {}
final class UpdateUserImageErrorState extends RegisterState {}