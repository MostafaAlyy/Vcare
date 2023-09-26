

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Features/Account%20Tab/ViewModel/profile_states.dart';

import '../../../Api Manager/api_manager.dart';
import '../../Auth/ViewModel/login_cubit/login_cubit.dart';
import 'make_appointment_states.dart';

class MakeAppointmentCubit extends Cubit<MakeAppointmentStates> {
  MakeAppointmentCubit() : super(MakeAppointmentInitialState());
  //static MakeAppointmentCubit get(BuildContext context) => BlocProvider.of(context);
  makeAppointment({required int doctorId,
    required String startTime,
 String? note
  }) async {
    emit(MakeAppointmentLoadingState());
    try {
      var response =
      await ApiManager.makeAppointment(
          token:  LoginCubit.userData.token!,
          doctorid: doctorId,
          startTime: startTime,
        note: note
      );
      print(response.message);
      emit(MakeAppointmentSuccessState(response));
    } on TimeoutException catch (ex) {
      emit(MakeAppointmentFailState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(MakeAppointmentFailState('$ex'));
    }
  }
}
