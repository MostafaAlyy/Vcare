import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/onboarding/View/Pages/onboarding.dart';

import '../Auth/View/Pages/register.dart';
import '../Home Screen/View/Pages/homeScreen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() {
     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    },)

    ;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorHelper.mainColor,
        child: Center(child: Text('VCare',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
