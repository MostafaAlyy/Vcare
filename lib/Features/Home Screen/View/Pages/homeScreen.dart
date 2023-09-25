import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Home%20Screen/ViewModel/Cubit/home_screen_cubit.dart';

import '../../../Account Tab/View/Pages/account_tab.dart';
import '../../../Doctors Tab/View/Pages/doctors_tab.dart';
import '../../../History Tab/View/Pages/history_tab.dart';
import '../../../Home Tab/View/Pages/home_tab.dart';
import '../../ViewModel/Cubit/home_screen_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit,HomeScreenStates>(
        builder: (context, state) {
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
                currentIndex: HomeScreenCubit.get(context).currentTapIndex,
                onTap: (index) {
                  HomeScreenCubit.get(context).changeIndex(index);
                },
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
            body:
            HomeScreenCubit.get(context).tabs[HomeScreenCubit.get(context)
              .currentTapIndex],
          );
        },
        listener: (context, state) {

        },

      ),
    );
  }
  //

}
