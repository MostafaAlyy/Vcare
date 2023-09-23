
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Api%20Manager/api_manager.dart';

import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';
import '../../../../Core/Database/remote/DioHelper/end_points.dart';
import '../../Model/HomeTabResponse.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  //static HomeCubit get(BuildContext context) => BlocProvider.of(context);
 void getData(String token)async {
   emit(HomeLoading());
   try{
     var response = await ApiManager.getHomeData(token: token);

     emit(HomeSuccessState(response));
   }on TimeoutException catch (ex) {
     emit(HomeErrorState('Please Check Your Internet\n $ex'));
   } catch (ex){
     emit(HomeErrorState('$ex'));
   }
 }

}