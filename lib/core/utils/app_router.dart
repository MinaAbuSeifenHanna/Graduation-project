

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/early%20view.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/healthy%20view.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/late%20view.dart';
import 'package:graduateproject/Features/Home/presentation/views/widgets/home%20page.dart';
import 'package:graduateproject/Features/Splash%20Screen/presentation/views/splashveiw.dart';
import 'package:graduateproject/Features/profile/presention/views/widgets/update%20cover%20profile.dart';

import '../../Features/Auth/presentation/views/login_view.dart';
import '../../Features/Auth/presentation/views/next view.dart';
import '../../Features/Auth/presentation/views/register_view.dart';
import '../../Features/Auth/presentation/views/widgets/next cover.dart';
import '../../Features/news Home/presentation/views/comments view.dart';
import '../../Features/news Home/presentation/views/widgets/add post.dart';
import '../../Features/onboarding/views/onboarding view.dart';
import '../../Features/profile/presention/views/widgets/update Image Progile View.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
   static const kAddPostView = '/addPostView';
   static const kNextRegisterProfileView = '/nextRegisterProfileView';
  static const kNextRegisterCoverView = '/nextRegisterCoverView';
   static const kCommentView = '/commentView/:id';
   static const kOnBoardingView = '/onBoardingView';
  static const kHealthy = '/healthy';
   static const kLateBlight = '/lateBlight';
   static const kEarlyBlightView = '/earlyBlightView';
   static const kUpdateProfileView = '/updateProfileView';
   static const kUpdateCoverView = '/updateCoverView';
  // static const kSavedPostsView = '/savedPostsView';

  static final router =
  GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) =>  const LoginView(),
        ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),

      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),

      ),
      GoRoute(
          path: kAddPostView,
          builder: (context, state) => const AddPostView(),

      ),
      GoRoute(
        path: kNextRegisterProfileView,
        builder: (context, state) => const NextRegisterProfileView(),

      ),
      GoRoute(
        path: kNextRegisterCoverView,
        builder: (context, state) => const NextRegisterCoverView(),

      ),

      // GoRoute(
      //   path: kCommentView,
      //   builder: (context, state) =>  CommentView( postUID: ,),
      //
      // ),

      GoRoute(
        path: kCommentView,  // 👈 Defination of params in the path is important
        name: 'commentView',
        builder: (context, state) => CommentView(
          postUID: state.pathParameters['id']!,
        ),
      ),


      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),

      ),
      GoRoute(
        path: kHealthy,
        builder: (context, state) => const Healthy(),

      ),
      GoRoute(
        path: kLateBlight,
        builder: (context, state) => const LateBlight(),

      ),
      GoRoute(
        path: kLateBlight,
        builder: (context, state) => const EarlyBlightView(),

      ),

      GoRoute(
        path: kUpdateProfileView,
        builder: (context, state) => const UpdateProfileView(),

      ),
      GoRoute(
        path: kUpdateCoverView,
        builder: (context, state) => const UpdateCoverView(),

      ),

    ],
  );
}
