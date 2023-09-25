import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/Home%20Tab/Model/Doctors.dart';

import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';
import '../../../../Core/Database/remote/DioHelper/end_points.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit() : super(GetAllDoctorsInitial());
  static GetAllDoctorsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<Doctors> doctors = [];
  void getAllDoctors() {
    doctors = [];
    emit(GetAllDoctorsLoading());
    DioHelper.getData(
            url: getAllDoctorsEndpoint, token: LoginCubit.userData.token)
        .then((value) {
      for (var element in value.data['data']) {
        doctors.add(Doctors.fromJson(element));
      }
      emit(GetAllDoctorsSuccess());
    }).catchError((onError) {
      emit(GetAllDoctorsError());
    });
  }
}
