import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Api%20Manager/api_manager.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/Update%20Profile/View%20Model/update_profile_states.dart';


class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  static UpdateCubit get(BuildContext context) => BlocProvider.of(context);

  updateData({

    required String name,
    required String email,
    required String phone,
    String? password,
    String? passwordConfirmation,
    required int gender
}) async {
    emit(UpdateLoading());
    try {
      var response =
      await ApiManager.updateData(
          token: LoginCubit.userData.token!,
        phone: phone,
        email: email,
        name: name,
        gender: gender,
        password: password,
        passwordConfirmation: passwordConfirmation
      );

      emit(UpdateSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(UpdateErrorState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(UpdateErrorState('$ex'));
    }
  }
}
