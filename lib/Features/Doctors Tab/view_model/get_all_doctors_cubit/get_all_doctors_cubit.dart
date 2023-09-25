import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/Features/Home%20Tab/Model/Doctors.dart';

import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';
import '../../../../Core/Database/remote/DioHelper/end_points.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit() : super(GetAllDoctorsInitial());

  List<Doctors> doctors = [];
  void getAllDoctors() {
    emit(GetAllDoctorsLoading());
    DioHelper.getData(
            url: getAllDoctorsEndpoint,
            token:
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk1NjcyNDMwLCJleHAiOjE2OTU2NzYwMzAsIm5iZiI6MTY5NTY3MjQzMCwianRpIjoiQVUxVXZadnMzdkFPQnBBRyIsInN1YiI6Ijc1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Y6dPH9f1vWSRzVSF3rBpxt74JJCTkaQkEr3rCL8rufY')
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
