
import '../../Models/logout/LogoutResponse.dart';

abstract class LogoutStates{}
class  LogoutInitialState extends LogoutStates{}
class  LogoutLoadingState extends LogoutStates{}
class  LogoutSuccessState extends LogoutStates{
  LogoutResponse logoutResponse;
  LogoutSuccessState(this.logoutResponse);
}
class  LogoutFailState extends LogoutStates{
  String? message;
   LogoutFailState(this.message);
}
