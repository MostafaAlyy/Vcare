part of 'get_all_city_cubit.dart';

@immutable
abstract class GetAllCityState {}

class GetAllCityInitial extends GetAllCityState {}

class GetAllCityLoading extends GetAllCityState {}

class GetAllCitySuccess extends GetAllCityState {
  final List<City> cities;

  GetAllCitySuccess(this.cities);
}

class GetAllCityError extends GetAllCityState {}

class ChangeSelectedCityState extends GetAllCityState {}
