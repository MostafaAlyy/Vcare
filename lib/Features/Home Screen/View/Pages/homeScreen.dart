import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Account%20Tab/View/Pages/account_tab.dart';
import 'package:vcare/Features/Doctors%20Tab/View/Pages/doctors_tab.dart';
import 'package:vcare/Features/History%20Tab/View/Pages/history_tab.dart';

import '../../../Home Tab/View/Pages/home_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = 'home-screen';
  PersistentTabController bottomNavBarController =
      PersistentTabController(initialIndex: 0);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: ColorHelper.mainColor,
          centerTitle: false,
          title: const Text(
            'VCare',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: PersistentTabView(
          context,
          controller: bottomNavBarController,
          screens: tabs,
          items: bottomNavBarItems,
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: ColorHelper.mainColor,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }

  //
  List<Widget> tabs = [
    const HomeTab(),
    const DoctorsTab(),
    const HistoryTab(),
    const AccountTab(),
    const HomeTab(),
  ];
  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      activeColorSecondary: ColorHelper.mainColor,
      title: "Home",
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      activeColorSecondary: ColorHelper.mainColor,
      icon: const Icon(
        Icons.health_and_safety_outlined,
      ),
      title: "Doctors",
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      activeColorSecondary: ColorHelper.mainColor,
      icon: const Icon(CupertinoIcons.search, color: Colors.white),
      title: "Search",
      activeColorPrimary: ColorHelper.mainColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      activeColorSecondary: ColorHelper.mainColor,
      icon: const Icon(Icons.access_time_filled),
      title: "History",
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      activeColorSecondary: ColorHelper.mainColor,
      icon: const Icon(CupertinoIcons.person),
      title: "Account",
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
