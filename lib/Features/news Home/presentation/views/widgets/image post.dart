import 'package:flutter/cupertino.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key , required this.PostImage});
final String PostImage ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5),
      child: Container(
        height: 140.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          image:  DecorationImage(
            image: NetworkImage(
                PostImage ,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
