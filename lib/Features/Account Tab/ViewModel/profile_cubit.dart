

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Features/Account%20Tab/ViewModel/profile_states.dart';

import '../../../Api Manager/api_manager.dart';
import '../../Auth/ViewModel/login_cubit/login_cubit.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  getProfile() async {
    emit(ProfileLoadingState());
    try {
      var response =
      await ApiManager.getProfileData(token: LoginCubit.userData.token!);

      emit(ProfileSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(ProfileFailState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(ProfileFailState('$ex'));
    }
  }
}
