import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/register_view_body.dart';

import '../manager/register_cubit/register_cubit.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:RegisterViewBody()


    ));

  }
}
