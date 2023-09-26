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

  List<Doctors> filterDoctors = [];

  void getAllDoctors() {
    emit(GetAllDoctorsLoading());
    DioHelper.getData(
            url: getAllDoctorsEndpoint, token: LoginCubit.userData.token)
        .then((value) {
      for (var element in value.data['data']) {
        doctors.add(Doctors.fromJson(element));
      }
      emit(GetAllDoctorsSuccess(doctors));
    }).catchError((onError) {
      emit(GetAllDoctorsError());
    });
  }

  void filterDoctorByCityName(int cityId) {
    emit(GetAllDoctorsLoading());
    DioHelper.getData(
        url: filerDoctorByCity, token: LoginCubit.userData.token , queryParameters: {'city'  : cityId})
        .then((value) {
      filterDoctors.clear();
      for (var element in value.data['data']) {
        filterDoctors.add(Doctors.fromJson(element));
      }
      emit(GetFilterDoctorsSuccess(filterDoctors));
    }).catchError((onError) {
      emit(GetAllDoctorsError());
    });
  }
}
