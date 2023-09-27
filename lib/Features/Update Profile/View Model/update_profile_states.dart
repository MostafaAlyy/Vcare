import 'package:vcare/Features/Home%20Tab/Model/HomeTabResponse.dart';

import '../model/UpdateResponse.dart';

sealed class UpdateState {}

class UpdateInitial extends UpdateState {}
class UpdateLoading extends UpdateState {}
class UpdateSuccessState extends UpdateState {
  UpdateResponse updateResponse;
  UpdateSuccessState(this.updateResponse);
}

class UpdateErrorState extends UpdateState {
  String? message;
  UpdateErrorState(this.message);
}