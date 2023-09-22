part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final String message;
  RegisterSuccessState(this.message);
}

final class RegisterErrorState extends AuthState {}
