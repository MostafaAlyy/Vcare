// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';

import 'Features/Auth/View/Pages/login.dart';
import 'Features/Splash Screen/splash_screen.dart';
import 'Features/details_screen/view/pages/details_view.dart';
import 'Features/onboarding/View/Pages/onboarding.dart';

void main() {
  DioHelper.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VCare',
        theme: ThemeData(
            // useMaterial3: true,
            ),
        //home: const LoginPage(),
        initialRoute: OnBoarding.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          RegisterPage.routeName: (_) => const RegisterPage(),
          OnBoarding.routeName: (_) => const OnBoarding(),
          LoginPage.routeName: (_) => const LoginPage(),
          DetailsPage.routeName: (_) => const DetailsPage(),
        },
      ),
    );
  }
}
