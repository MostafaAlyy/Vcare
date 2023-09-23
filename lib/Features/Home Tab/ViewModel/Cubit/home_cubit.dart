import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Api%20Manager/api_manager.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
   getData() async {
    emit(HomeLoading());
    try {
      var response =
          await ApiManager.getHomeData(token: LoginCubit.userData.token!);

      emit(HomeSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(HomeErrorState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(HomeErrorState('$ex'));
    }
  }
}
