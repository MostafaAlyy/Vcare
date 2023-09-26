import '../Model/BookAppointmentResponse.dart';

abstract class MakeAppointmentStates{}
class MakeAppointmentInitialState extends MakeAppointmentStates{}
class MakeAppointmentLoadingState extends MakeAppointmentStates{}
class MakeAppointmentSuccessState extends MakeAppointmentStates{
  BookAppointmentResponse bookAppointmentResponse;
  MakeAppointmentSuccessState(this.bookAppointmentResponse);
}
class MakeAppointmentFailState extends MakeAppointmentStates{
  String? message;
  MakeAppointmentFailState(this.message);
}
