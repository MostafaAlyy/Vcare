// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:vcare/Features/Account%20Tab/View/Pages/account_tab.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/Home%20Screen/View/Pages/homeScreen.dart';
import 'package:vcare/Features/Home%20Tab/View/Pages/view_more.dart';
import 'package:vcare/Features/Splash%20Screen/splash_screen.dart';

import 'Core/Database/local_database/shared_preferences.dart';
import 'Features/Auth/View/Pages/login.dart';
import 'Features/Update Profile/View/Pages/update_profile.dart';
import 'Features/details_screen/view/pages/details_view.dart';
import 'Features/onboarding/View/Pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  await DioHelper.init();

  await const FlutterSecureStorage().read(key: 'token').then((value) {
    if (value != null) {
      LoginCubit.userData.token = value;
    }
  });
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
          colorScheme: ColorScheme.fromSeed(seedColor: ColorHelper.mainColor),

          useMaterial3: true,

          datePickerTheme: const DatePickerThemeData(
            headerForegroundColor: Colors.white,
              headerBackgroundColor: ColorHelper.mainColor,
              dividerColor: ColorHelper.mainColor,
              rangeSelectionBackgroundColor: ColorHelper.mainColor,
              surfaceTintColor: ColorHelper.mainColor,
              todayBorder: BorderSide(color: ColorHelper.mainColor)),
          timePickerTheme: const TimePickerThemeData(

              hourMinuteTextColor: Colors.white,
              dayPeriodTextColor: ColorHelper.mainColor,
              dialHandColor: ColorHelper.mainColor,
              hourMinuteColor: ColorHelper.mainColor,
              cancelButtonStyle: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorHelper.mainColor),
              )),
          primaryColor: ColorHelper.mainColor,

        ),
        //home: const LoginPage(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          RegisterPage.routeName: (_) => const RegisterPage(),
          OnBoarding.routeName: (_) => const OnBoarding(),
          LoginPage.routeName: (_) => const LoginPage(),
          DetailsPage.routeName: (_) => DetailsPage(),
          HomeScreen.routeName: (_) => HomeScreen(),
          ViewMore.routeName : (_) => const ViewMore(),
          AccountTab.routeName : (_) =>  AccountTab(),
          UpdatePage.routeName : (_) => const UpdatePage()
        },
      ),
    );
  }
}
