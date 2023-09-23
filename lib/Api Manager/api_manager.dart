
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:vcare/Features/Home%20Tab/Model/HomeTabResponse.dart';

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
}