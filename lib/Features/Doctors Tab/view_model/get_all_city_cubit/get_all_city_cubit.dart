import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/Features/History%20Tab/Model/Appointment.dart';

import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';
import '../../../../Core/Database/remote/DioHelper/end_points.dart';
import '../../../Auth/ViewModel/login_cubit/login_cubit.dart';

part 'get_all_city_state.dart';

class GetAllCityCubit extends Cubit<GetAllCityState> {
  GetAllCityCubit() : super(GetAllCityInitial());

  List<City> cities = [];

  void getAllCity() {
    emit(GetAllCityLoading());
    DioHelper.getData(
            url: getAllCityEndpoint,
            token:
            LoginCubit.userData.token!)
        .then((value) {
      for (var element in value.data['data']) {
        cities.add(City.fromJson(element));
      }
      emit(GetAllCitySuccess(cities));
    }).catchError((onError) {
      emit(GetAllCityError());
    });
  }
}
