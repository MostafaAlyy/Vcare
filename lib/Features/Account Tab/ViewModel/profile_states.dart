import '../Model/ProfileResponse.dart';

abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class ProfileSuccessState extends ProfileStates{
  ProfileResponse profileResponse;
  ProfileSuccessState(this.profileResponse);
}
class ProfileFailState extends ProfileStates{
  String? message;
  ProfileFailState(this.message);
}
