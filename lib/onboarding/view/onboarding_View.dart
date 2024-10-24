// import 'package:flutter/material.dart';
//
// class OnBoardingView extends StatelessWidget {
//   OnBoardingView({super.key});
//
//   Widget dotpageview() {
//     return Builder(builder: ((context) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           for(int i = 0; i < 3; i++)
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               width: i == pagenum ? 25 : 6,
//               height: 6,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: i == pagenum ? Colors.white : Colors.grey,
//               ),
//             ),
//         ],
//       );
//     }));
//   }
//
//   PageController nextpage = PageController();
//   int pagenum =0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor:Color(0xffFADBDB),
//         body: PageView(
//           controller: nextpage,
//           onPageChanged: (value){
//             pagenum = value;
//
//           },
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Container(
//                     height: 270,
//                     width: 350,
//                     child: Image.asset('assets/images/image6-removebg-preview.png')),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text('ggghjjkmnbvgfxx bhb',style: TextStyle(fontSize: 22),),
//                 SizedBox(
//                     height: 20
//                 ),
//                 Text(textAlign: TextAlign.center,
//                   'asdfghjsdfghjksdfghjkkldfghj\nqawerfsdfghjgthsdf',
//                   style: TextStyle(fontSize: 15),),
//                 SizedBox(
//                     height: 80
//                 ),
//                 InkWell(
//                   onTap:(){
//                     nextpage.animateToPage(1,
//                         duration: Duration(microseconds: 700),
//                         curve: Curves.easeIn);
//                   } ,
//                   child: Container(
//                     width: 114,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xff733B3A),
//                     ),
//                     child: Center(
//                       child: Text('Next',style: TextStyle(fontSize: 20),),
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height: 30
//                 ),
//                 dotpageview(),
//
//               ],
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Container(
//                     width: 500,
//                     height: 270,
//
//                     child: Image.asset('assets/images/image2-removebg-preview__2_-removebg-preview.png',fit: BoxFit.fill,)),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text('ggghjjkmnbvgfxx bhb',style: TextStyle(fontSize: 22),),
//                 SizedBox(
//                     height: 20
//                 ),
//                 Text(textAlign: TextAlign.center,
//                   'asdfghjxcvbnthjkkldfghj\nqawcvbnnthmerfgthsdf',
//                   style: TextStyle(fontSize: 15),),
//                 SizedBox(
//                     height: 80
//                 ),
//                 InkWell(
//                   onTap:(){
//                     nextpage.animateToPage(2,
//                         duration: Duration(microseconds: 700),
//                         curve: Curves.easeIn);
//                   } ,
//                   child: Container(
//                     width: 114,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xff733B3A),
//                     ),
//                     child: Center(
//                       child: Text('Next',style: TextStyle(fontSize: 20),),
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height: 30
//                 ),
//                 dotpageview()
//               ],
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Container(
//                     height: 270,
//                     width: 250,
//                     child: Image.asset('assets/images/image1-removebg-preview (1).png',fit: BoxFit.fill,)),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text('ggghjjkmnbvgfxx bhb',style: TextStyle(fontSize: 22),),
//                 SizedBox(
//                     height: 20
//                 ),
//                 Text(textAlign: TextAlign.center,
//                   'asdfghjxdcfvgbhnkkldfghj\nqadcfvgbhnwerfgthsdf',
//                   style: TextStyle(fontSize: 15),),
//                 SizedBox(
//                     height: 80
//                 ),
//                 InkWell(
//                   onTap:(){
//                     nextpage.animateToPage(3,
//                         duration: Duration(microseconds: 700),
//                         curve: Curves.easeIn);
//                   } ,
//                   child: Container(
//                     width: 130,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xff733B3A),
//                     ),
//                     child: Center(
//                       child: Text('Get Started',style: TextStyle(fontSize: 20),),
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height: 30
//                 ),
//                 dotpageview()
//               ],
//             ),
//           ],
//         )
//
//     );
//   }
// }