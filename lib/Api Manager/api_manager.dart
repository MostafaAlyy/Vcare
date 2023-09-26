
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:vcare/Features/Home%20Tab/Model/HomeTabResponse.dart';

import '../Features/Account Tab/Model/ProfileResponse.dart';
import '../Features/History Tab/Model/HistoryResponse.dart';
import '../Features/details_screen/Model/BookAppointmentResponse.dart';

class ApiManager {
  static const String baseUrl = 'vcare.integration25.com';


  static Future<HomeTabResponse> getHomeData(
      {required String token}) async {
    var uri = Uri.https(baseUrl, 'api/home/index');
    var request = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader : "Bearer $token"
    },);

    var loginResponse = HomeTabResponse.fromJson(jsonDecode(request.body));
    return loginResponse;
  }
  static Future<ProfileResponse> getProfileData(
      {required String token}) async {
    var uri = Uri.https(baseUrl, 'api/user/profile');
    var request = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader : "Bearer $token"
    },);

    var profileResponse = ProfileResponse.fromJson(jsonDecode(request.body));
    return profileResponse;
  }
  static Future<HistoryResponse> getHistoryData(
      {required String token}) async {
    var uri = Uri.https(baseUrl, 'api/appointment/index');
    var request = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader : "Bearer $token"
    },);

    var historyResponse = HistoryResponse.fromJson(jsonDecode(request.body));
    return historyResponse;
  }
  static Future<BookAppointmentResponse> makeAppointment(
      {required String token,
      required int doctorid,
        required String startTime,
        String? note
      }) async {
    var uri = Uri.https(baseUrl, 'api/appointment/store');
    var request = await http.post(uri,headers: {
      HttpHeaders.authorizationHeader : "Bearer $token"
    },body: {
      'doctor_id' : "$doctorid",
      'start_time' : startTime,
      'notes' : note
    });

    var bookAppointmentResponse = BookAppointmentResponse.fromJson(jsonDecode(request.body));
    return bookAppointmentResponse;
  }
}