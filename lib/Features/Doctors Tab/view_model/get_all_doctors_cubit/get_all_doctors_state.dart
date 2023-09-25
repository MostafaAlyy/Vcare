part of 'get_all_doctors_cubit.dart';

@immutable
abstract class GetAllDoctorsState {}

class GetAllDoctorsInitial extends GetAllDoctorsState {}

class GetAllDoctorsLoading extends GetAllDoctorsState {}

class GetAllDoctorsSuccess extends GetAllDoctorsState {}

class GetAllDoctorsError extends GetAllDoctorsState {}
