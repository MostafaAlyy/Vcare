import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/onboarding/View/Pages/onboarding.dart';
import '../../Core/Database/local_database/shared_preferences.dart';
import '../Auth/View/Pages/login.dart';
import '../Auth/View/Pages/register.dart';
import '../Home Screen/View/Pages/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (CacheData.getData(key: 'OnBoarding') == null) {
          CacheData.setData(key: 'OnBoarding', value: false);
        }
        if (CacheData.getData(key: 'OnBoarding') == false) {
          Navigator.pushReplacementNamed(context, OnBoarding.routeName);
        } else {
          Navigator.pushReplacementNamed(
            context,
            (LoginCubit.userData.token != null)
                ? HomeScreen.routeName
                : RegisterPage.routeName,
          );
        }
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
