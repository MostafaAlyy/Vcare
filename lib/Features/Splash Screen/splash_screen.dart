import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, RegisterPage.routeName
      );
    },)

    ;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorHelper.mainColor,
        child: Text('VCare',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
