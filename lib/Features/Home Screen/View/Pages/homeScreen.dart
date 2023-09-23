import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';

import '../../../Home Tab/View/Pages/home_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = 'home-screen';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorHelper.mainColor,
        elevation: 0,
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: ColorHelper.mainColor,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: const IconThemeData(color: ColorHelper.mainColor),
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Doctors',
                icon: ImageIcon(AssetImage('assets/Icons/icon_doctor.png'))),
            BottomNavigationBarItem(
                label: 'History', icon: Icon(Icons.access_time_filled)),
            BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person)),
          ],
        ),
      ),
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
      body:tabs[selectedIndex],
    );
  }
  //
  List<Widget> tabs = [
    HomeTab()
  ];
}