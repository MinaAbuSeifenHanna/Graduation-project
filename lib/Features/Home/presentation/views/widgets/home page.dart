import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/home%20detect%20screen.dart';
import 'package:graduateproject/Features/news%20Home/presentation/views/postesveiw.dart';
import 'package:graduateproject/Features/profile/presention/views/profile veiw.dart';
import 'package:graduateproject/core/utils/assets_data.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:graduateproject/core/widgets/circular%20Progress%20Indicator%20App.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../manager/home_cubit/home_cubit.dart';



class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

          if (state is SignOutSuccessState) {

            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          }

        },
     builder: (context, state)
     {
       if (state is SignOutLoadingState)
       {

      return const CircularProgressIndicatorApp();

       }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.secondAppColor,
          title: Text(HomeCubit.get(context).titles[HomeCubit.get(context).currentIndex],
          style: APPStyles.textStyle22,
          ),
          centerTitle: true,
          actions: [
            // IconButton(onPressed: () {
            // }, icon:  const Icon(IconBroken.Notification,)
            // ),
            // IconButton(onPressed: () {}, icon: const Icon(IconBroken.Search,)),
            // IconButton(onPressed: () {
            //   cubit.getPosts();
            // }, icon: const Icon(Icons.update,)),
          ],
        ),
        body: PageView(
          controller: HomeCubit.get(context).pageController,
          onPageChanged: (index)
          {
            HomeCubit.get(context).changeIndexBottomNav(index);
          },
          scrollDirection: Axis.horizontal,
          children: const [
            PostsView(),
            HomeDetectScreen(),
            ProfileView(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(AssetsData.profileImage),
              ),

              ListTile(
                leading: Icon(Icons.info),
                title: Text(' About App '),
                onTap: () {
               //   Navigator.of(context).pushReplacementNamed('Emergency Parents');

                },
              ),


              ListTile(
                leading: Icon(Icons.settings),
                title: Text(' Setting '),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('Emergency Parents');

                },
              ),
              ListTile(
                leading: Icon(Icons.support),
                title: Text('Help and Support'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('assistant Help');

                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('LogOut'),
                onTap: () async {
                 await HomeCubit.get(context).signOutUser();


                },
              ),

            ],
          ),
        ),
        bottomNavigationBar:
        CurvedNavigationBar(
          index: HomeCubit.get(context).currentIndex,

            onTap: (index) {
              HomeCubit.get(context).pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
              HomeCubit.get(context).changeIndexBottomNav(index);

            },
            backgroundColor: MyColors.primaryAppColor,
            color: MyColors.secondAppColor,
            items: const [
              CurvedNavigationBarItem(
                labelStyle: APPStyles.textStyle16,
                child: Icon(Icons.home_outlined,
                  color: MyColors.myWhite,
                ),
                label: 'Home',
              ),
              CurvedNavigationBarItem(
                labelStyle: APPStyles.textStyle16,
                child: Icon(Icons.search,
                  color: MyColors.myWhite,
                ),
                label: 'Detect',
              ),
              CurvedNavigationBarItem(
                labelStyle: APPStyles.textStyle16,
                child: Icon(Icons.person,
                  color: MyColors.myWhite,
                ),
                label: 'profile',
              ),
            ]),


      );
    });
  }
}
