part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class GetAllAppointmentsSuccessState extends HistoryState {}

final class GetAllAppointmentsErrorState extends HistoryState {}
