import 'package:vcare/Features/Home%20Tab/Model/HomeTabResponse.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccessState extends HomeState {
 HomeTabResponse homeTabResponse;
  HomeSuccessState(this.homeTabResponse);
}

class HomeErrorState extends HomeState {
  String? message;
  HomeErrorState(this.message);
}