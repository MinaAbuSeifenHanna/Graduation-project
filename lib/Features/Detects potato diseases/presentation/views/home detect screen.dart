import 'dart:io' show File;
import 'package:go_router/go_router.dart';
import 'package:graduateproject/core/utils/my_colors.dart';
import 'package:graduateproject/core/utils/styles.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/widgets/CameraWidget.dart';
import 'package:graduateproject/Features/Detects%20potato%20diseases/presentation/views/widgets/CustomElevatedButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../core/utils/app_router.dart';

class HomeDetectScreen extends StatefulWidget {
  const HomeDetectScreen({super.key});

  @override
  State<HomeDetectScreen> createState() => _HomeDetectScreenState();
}

class _HomeDetectScreenState extends State<HomeDetectScreen> {
  ImagePicker picker = ImagePicker();
  List? myList;
  File? file;
  XFile? image;
  bool isLoading = true;
  var result ; //=  myList?[0]['label'].toString().split(' ')[1] ;

  @override
  void initState() {
    super.initState();
    loadModel().then((_) => setState(() => isLoading = false));
  }

  getImage() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {});
    checkImage(image!.path);
    print(myList);
  }

  getCamera() async {
    image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {});
    checkImage(image!.path);
    print(myList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff733B3A),
        title: const Text(
          'upload',
          style: APPStyles.textStyle16,
        ),
        centerTitle: true,
      ),
      backgroundColor: MyColors.secondAppColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            color: Color(0xffFADBDB),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

               CameraWidget(getCamera: getCamera),

              image == null
                  ?
              Expanded(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ))
                  :
              Container(
                               height:  200,

                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8) ,
                    border: Border.all(
                        color: MyColors.secondAppColor,
                      width: 5
                    )
                ),
                child: Image.file(
                  File(image!.path),
              //    fit: BoxFit.fitWidth,
                ),
              ),

              CustomElevatedButton(
                onPressed: () {
                  getImage();
                  setState(() {
                    result =  myList?[0]['label'].toString().split(' ')[1] ;

                  });

                },
                buttonText: 'Upload Image',
              ),

              InkWell(
                onTap: (){
                  ( result == 'late')
                  ?   GoRouter.of(context).push(AppRouter.kLateBlight)
                      : ( result == 'early')
                  ?  GoRouter.of(context).push(AppRouter.kEarlyBlightView)
                      :
                  GoRouter.of(context).push(AppRouter.kHealthy) ;


                },
                child: Text(
                 result ?? ' ',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkImage(String path) async {
    myList = await Tflite.runModelOnImage(
        path: path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      print(myList);
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/models/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
    await Future.delayed(const Duration(seconds: 6), () {});
    print('Loaded .......');
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
