import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
   Function getCamera ;

    CameraWidget({super.key , required this.getCamera} );

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              getCamera();
            },
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 60,
              child:
              Icon(
                Icons.camera_alt,
                color: Color(0xff733B3A),
                size: 100,
              ),
            ),
          ),
          const Text(
            'camera',
            style: TextStyle(fontSize: 17),
          ),
        ],
      );
  }
}
