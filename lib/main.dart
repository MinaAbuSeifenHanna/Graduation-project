import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:graduateproject/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:graduateproject/Features/onboarding/manager/onboarding_cubit.dart';
import 'package:graduateproject/Features/profile/manager/profile_cubit.dart';
import 'package:path/path.dart';
import 'Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';


import 'core/utils/app_router.dart';
import 'core/utils/cache_network.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');

  // Widget startWidget;
  //
  // if (uId != null)
  // {
  //   startWidget = const HomeView();
  // }
  // else
  // {
  //   startWidget = const LoginView();
  // }

  runApp(MultiBlocProvider(providers: [
    BlocProvider<RegisterCubit>(create: (_) => RegisterCubit(AuthRepoImpl())),
    BlocProvider<LoginCubit>(create: (_) => LoginCubit(AuthRepoImpl())),
    BlocProvider<HomeCubit>(create: (_) => HomeCubit()..getUserData()),

    BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),


    BlocProvider<OnboardingCubit>(create: (_) => OnboardingCubit()),
  ], child:  MyApp( )));
}

class MyApp extends StatelessWidget {
   MyApp({super.key });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
   routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),


    );
  }
}
