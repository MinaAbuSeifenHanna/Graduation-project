import 'package:flutter/material.dart';
import 'package:graduateproject/Features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}
