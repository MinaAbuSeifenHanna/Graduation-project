import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../Home/presentation/manager/home_cubit/home_cubit.dart';

class AddPostHeader extends StatelessWidget {
  const AddPostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
    return  Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(//'userModel!.image!'
              HomeCubit.get(context).userModel!.image! ,
            //  'https://www.adobe.com/express/feature/image/media_16ad2258cac6171d66942b13b8cd4839f0b6be6f3.png?width=750&format=png&optimize=medium',

            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
              HomeCubit.get(context).userModel!.name! ,
              style: APPStyles.textStyle17
          ),

        ],
      );}
    );
  }
}
