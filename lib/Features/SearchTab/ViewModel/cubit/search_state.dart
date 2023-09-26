part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSussesState extends SearchState {}

final class SearchErrorState extends SearchState {}
