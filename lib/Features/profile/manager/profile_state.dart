part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSuccessChangeProfileImageState extends ProfileState {}
final class ProfileErrorChangeProfileImageState extends ProfileState {}

final class DeleteProfileImageLoading extends ProfileState {}
final class DeleteProfileImageSuccess extends ProfileState {}
final class DeleteProfileImageFailure extends ProfileState {
  final String errorMessage ;
  DeleteProfileImageFailure({required this.errorMessage});
}


final class DeleteCoverImageLoading extends ProfileState {}
final class DeleteCoverImageSuccess extends ProfileState {}
final class DeleteCoverImageFailure extends ProfileState {
  final String errorMessage ;
  DeleteCoverImageFailure({required this.errorMessage});
}