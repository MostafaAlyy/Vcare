import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:vcare/Core/Database/remote/DioHelper/end_points.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/details_screen/Model/Doctor.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<Doctor> searchDoctorsList = [];
  searchDoctor(String searchKeyWord) {
    searchDoctorsList = [];
    DioHelper.getData(
        url: searchDoctorEndpoint,
        token: LoginCubit.userData.token,
        queryParameters: {'name': searchKeyWord}).then((value) {
      for (var element in value.data['data']) {
        searchDoctorsList.add(Doctor.fromJson(element));
      }
      emit(SearchSussesState());
    }).catchError((onError) {
      emit(SearchErrorState());
    });
  }
}
