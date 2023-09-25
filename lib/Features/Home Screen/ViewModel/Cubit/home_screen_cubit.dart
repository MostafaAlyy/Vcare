
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Account Tab/View/Pages/account_tab.dart';
import '../../../Doctors Tab/View/Pages/doctors_tab.dart';
import '../../../History Tab/View/Pages/history_tab.dart';
import '../../../Home Tab/View/Pages/home_tab.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);
  int currentTapIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    DoctorsTab(),
    AccountTab(),
    HistoryTab()
  ];

  void changeIndex(int index) {
    currentTapIndex = index;

    emit(ChangeHomeScreenState());
  }
}