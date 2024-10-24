import 'package:flutter/cupertino.dart';

class ThredOnBoardingView extends StatelessWidget {
  const ThredOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 70),
        Container(
          height: 270,
          width: 250,
          child: Image.asset('assets/images/image1-removebg-preview (1).png', fit: BoxFit.fill),
        ),
        SizedBox(height: 50),
        Text('Start Cooking!', style: TextStyle(fontSize: 22)),
        SizedBox(height: 20),
        Text(
          'Get ready to cook amazing dishes with potatoes.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
