import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void changeOnBoarding(int index) {

    currentIndex = index;
    emit(ChangeOnBoardingState());
  }
}
