
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Api Manager/api_manager.dart';
import '../../Auth/ViewModel/login_cubit/login_cubit.dart';
import 'history_states.dart';

class HistoryCubitt extends Cubit<HistoryStates> {
  HistoryCubitt() : super(HistoryInitialState());
  static HistoryCubitt get(BuildContext context) => BlocProvider.of(context);
  getHistory() async {
    emit(HistoryLoadingState());
    try {
      var response =
      await ApiManager.getHistoryData(token: LoginCubit.userData.token!);

      emit(HistorySuccessState(response));
    } on TimeoutException catch (ex) {
      emit(HistoryFailState('Please Check Your Internet\n $ex'));
    } catch (ex) {
      emit(HistoryFailState('$ex'));
    }
  }
}
