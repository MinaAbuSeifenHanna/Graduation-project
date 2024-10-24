// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduateproject/Core/utils/my_colors.dart';
// import 'package:graduateproject/Features/onboarding/manager/onboarding_cubit.dart';
// import 'package:graduateproject/Features/onboarding/views/widgets/first%20onboarding.dart';
// import 'package:graduateproject/Features/onboarding/views/widgets/secand%20onboarding.dart';
// import 'package:graduateproject/Features/onboarding/views/widgets/third%20onboarding.dart';
//
// import '../../Detects potato diseases/presentation/views/home detect screen.dart';
// import '../../news Home/presentation/views/postesveiw.dart';
// import '../../profile/presention/views/profile veiw.dart';
//
// class OnBoardingView extends StatelessWidget {
//   const OnBoardingView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OnboardingCubit, OnboardingState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: MyColors.primaryAppColor,
//             body: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: PageView(
//                 onPageChanged: (index){
//                   OnboardingCubit.get(context).changeOnBoarding(index);
//                       },
//                 controller: OnboardingCubit.get(context).pageController,
//                 children: const [
//                   FirstOnBoardingView(),
//                   ScendOnBoardingView(),
//                   ThredOnBoardingView(),
//                 ],
//               ),
//             )
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduateproject/Core/utils/my_colors.dart';
import 'package:graduateproject/Features/onboarding/manager/onboarding_cubit.dart';
import 'package:graduateproject/Features/onboarding/views/widgets/first%20onboarding.dart';
import 'package:graduateproject/Features/onboarding/views/widgets/secand%20onboarding.dart';
import 'package:graduateproject/Features/onboarding/views/widgets/third%20onboarding.dart';

import '../../../core/utils/app_router.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        // TODO: Add any listener actions if required
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.primaryAppColor,
          body: Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  OnboardingCubit.get(context).changeOnBoarding(index);
                },
                controller: OnboardingCubit.get(context).pageController,
                children: const [
                  FirstOnBoardingView(),
                  ScendOnBoardingView(),
                  ThredOnBoardingView(),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index: index, context: context)),
                ),
              ),
              if (OnboardingCubit.get(context).currentIndex == 2)
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: FloatingActionButton(
                    backgroundColor: MyColors.secondAppColor,
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
                    },
                    child: const Icon(Icons.arrow_forward,color: MyColors.myWhite,),

                  ),
                ),
              if (OnboardingCubit.get(context).currentIndex == 0 || OnboardingCubit.get(context).currentIndex == 1 )
                Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
                  },
                  child: Text('Skip'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: MyColors.secondAppColor, // Text color
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDot({required int index, required BuildContext context}) {
    var pageIndex = OnboardingCubit.get(context).currentIndex;
    return Container(
      height: 10,
      width: pageIndex == index ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: pageIndex == index ? MyColors.secondAppColor: MyColors.secondAppColor.withOpacity(0.5),
      ),
    );
  }
}
