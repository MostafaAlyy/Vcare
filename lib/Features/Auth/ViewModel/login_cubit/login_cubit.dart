import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/Database/remote/DioHelper/end_points.dart';
import 'package:vcare/Features/Auth/Models/user_moudel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../Core/Database/remote/DioHelper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  static UserModel userData = UserModel();
  void login(
      {required String email,
      required String password,
      required bool keepMeLogin}) {
    emit(LoginLoading());
    DioHelper.postData(url: loginEndpoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      userData = UserModel.fromJson(value.data['data']);
      if (keepMeLogin) {
        const FlutterSecureStorage()
            .write(key: 'token', value: userData.token!);
      }
      emit(LoginSuccess(value.data['message']));
      debugPrint(value.data['message']);
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(LoginError(onError.toString()));

      if (onError is DioException) {
        debugPrint(onError.response.toString());
      }
    });
  }
}
