import 'Data.dart';

/// message : "Updated Successfully"
/// data : {"id":215,"name":"name","email":"email@email.emaill","phone":"643563551","gender":"0","email_verified_at":null,"created_at":"2023-09-27T09:58:57.000000Z","updated_at":"2023-09-27T12:55:23.000000Z"}
/// status : true
/// code : 200

class UpdateResponse {
  UpdateResponse({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  UpdateResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  String? message;
  Data? data;
  bool? status;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }
}
