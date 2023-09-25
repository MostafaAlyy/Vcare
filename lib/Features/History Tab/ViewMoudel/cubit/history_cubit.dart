import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:vcare/Core/Database/remote/DioHelper/end_points.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/History%20Tab/Model/Appointment.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(BuildContext context) => BlocProvider.of(context);

  List<Appointment> allAppointments = [];
  void getAllAppointments() {
    allAppointments = [];
    DioHelper.getData(
            url: getAllAppointmentEndpoint, token: LoginCubit.userData.token)
        .then((value) {
      for (var element in value.data['data']) {
        allAppointments.add(Appointment.fromJson(element));
      }
      emit(GetAllAppointmentsSuccessState());
    }).catchError((onError) {
      emit(GetAllAppointmentsErrorState());
    });
  }
}
