import 'package:vcare/Features/Home%20Tab/Model/HomeTabResponse.dart';

import '../../Model/view More/ViewMoreResponse.dart';

sealed class ViewMoreState {}

class ViewMoreInitial extends ViewMoreState {}
class ViewMoreLoading extends ViewMoreState {}
class ViewMoreSuccessState extends ViewMoreState {
  ViewMoreResponse homeTabResponse;
 ViewMoreSuccessState(this.homeTabResponse);
}

class ViewMoreErrorState extends ViewMoreState {
  String? message;
  ViewMoreErrorState(this.message);
}