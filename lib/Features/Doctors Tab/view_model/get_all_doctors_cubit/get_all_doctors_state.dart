part of 'get_all_doctors_cubit.dart';

@immutable
abstract class GetAllDoctorsState {
  get cities => null;
}

class GetAllDoctorsInitial extends GetAllDoctorsState {}

class GetAllDoctorsLoading extends GetAllDoctorsState {}

class GetAllDoctorsSuccess extends GetAllDoctorsState {
  final List<Doctors> doctors;

  GetAllDoctorsSuccess(this.doctors);
}

class GetFilterDoctorsSuccess extends GetAllDoctorsState {
  final List<Doctors> filterDoctors;

  GetFilterDoctorsSuccess(this.filterDoctors);
}

class GetAllDoctorsError extends GetAllDoctorsState {}
