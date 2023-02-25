import 'dart:async';

import 'package:chat/screens/create_account_screen/create_account.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, CreateAccount.routeName);
    });
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(child: Image.asset('assets/images/logo.png'))
        ],
      ),
    );
  }
}
