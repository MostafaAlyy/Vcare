import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Api%20Manager/api_manager.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';

import 'home_states.dart';

class ViewMoreCubit extends Cubit<ViewMoreState> {
  ViewMoreCubit() : super(ViewMoreInitial());

  static ViewMoreCubit get(BuildContext context) => BlocProvider.of(context);

   getData(
       int id
       ) async {
    emit(ViewMoreLoading());
    try {
      var response =
          await ApiManager.getViewAllData(
              token: LoginCubit.userData.token!,
              id: id);

      emit(ViewMoreSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(ViewMoreErrorState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(ViewMoreErrorState('$ex'));
    }
  }
}
