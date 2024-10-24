part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class ChangeBottomNavState  extends HomeState {}
class GetUserLoadingState  extends HomeState {}

class GetUserSuccessState  extends HomeState {}

class GetUserErrorState  extends HomeState {

  String error;
  GetUserErrorState(this.error);
}

class CreatePostLoadingState  extends HomeState {}

class CreatePostSuccessState  extends HomeState {}
class CreatePostErrorState  extends HomeState {}
class PostImagePickedSuccessState  extends HomeState {}
class RemovePostImageState  extends HomeState {}
class GetPostsLoadingState  extends HomeState {}
class GetPostsSuccessState  extends HomeState {}
class GetPostsErrorState  extends HomeState {
  String error ;
  GetPostsErrorState(this.error);
}

final class CreateCommentLoadingState extends HomeState {}

final class CreateCommentSuccessState extends HomeState {}
final class CreateCommentFeilreState extends HomeState {}

final class SignOutLoadingState extends HomeState {}

final class SignOutSuccessState extends HomeState {}
final class SignOutFailureState extends HomeState {
  final String errorMessage ;
  SignOutFailureState({required this.errorMessage});

}
