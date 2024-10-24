import 'package:flutter/material.dart';

class ScendOnBoardingView extends StatelessWidget {
  const ScendOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        Container(
          width: 500,
          height: 270,
          child: Image.asset('assets/images/image2-removebg-preview__2_-removebg-preview.png', fit: BoxFit.fill),
        ),
        SizedBox(height: 50),
        Text('Find Your Favorite Recipe', style: TextStyle(fontSize: 22)),
        SizedBox(height: 20),
        Text(
          'Explore a variety of delicious potato recipes.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
