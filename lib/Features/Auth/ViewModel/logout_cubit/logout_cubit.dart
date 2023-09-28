

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Api Manager/api_manager.dart';
import '../login_cubit/login_cubit.dart';
import 'logout_states.dart';


class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutInitialState());
 // static LogoutCubit get(BuildContext context) => BlocProvider.of(context);
  logout() async {
    emit(LogoutLoadingState());
    try {
      var response =
      await ApiManager.logout(
          token:  LoginCubit.userData.token!,
      );
      print(response.message);
      emit(LogoutSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(LogoutFailState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(LogoutFailState('$ex'));
    }
  }
}
