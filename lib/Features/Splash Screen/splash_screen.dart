import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/onboarding/View/Pages/onboarding.dart';
import '../Home Screen/View/Pages/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
            context,
            (LoginCubit.userData.token != null)
                ? HomeScreen.routeName
                : OnBoarding.routeName);
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorHelper.mainColor,
        child: const Center(
            child: Text(
          'VCare',
          style: TextStyle(color: Colors.white, fontSize: 36),
        )),
      ),
    );
  }
}
