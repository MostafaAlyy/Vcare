import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/Core/Database/remote/DioHelper/end_points.dart';

import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(url: loginEndpoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      emit(LoginSuccess(value.data['message']));
      print(value.data['message']);
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginError(onError.toString()));

      if (onError is DioException) {
        print(onError.response);
      }
    });
  }
}
