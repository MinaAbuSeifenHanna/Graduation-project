import 'package:flutter/cupertino.dart';

class FirstOnBoardingView extends StatelessWidget {
  const FirstOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        SizedBox(height: 70),
        Container(
          height: 270,
          width: 350,
          child: Image.asset('assets/images/image6-removebg-preview.png'),
        ),
        SizedBox(height: 50),
        Text('Welcome to Potatos App', style: TextStyle(fontSize: 22)),
        SizedBox(height: 20),
        Text(
          'Discover the magic of potatos!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
