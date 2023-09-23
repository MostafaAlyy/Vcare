// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vcare/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:vcare/Features/onboarding/View/Pages/onboarding.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';
import 'package:vcare/Features/Home%20Screen/View/Pages/homeScreen.dart';
import 'package:vcare/Features/Splash%20Screen/splash_screen.dart';

void main() {
  DioHelper.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCare',
      theme: ThemeData(
        useMaterial3: false,
      ),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        RegisterPage.routeName : (_) => RegisterPage(),
        OnBoarding.routeName : (_) => OnBoarding(),
        HomeScreen.routeName : (_) => HomeScreen()

      },
    );
  }
}
