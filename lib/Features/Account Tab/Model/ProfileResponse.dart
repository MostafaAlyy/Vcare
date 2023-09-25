import 'Data.dart';

/// message : "Successful query"
/// data : [{"id":1,"name":"diaa","email":"aa@aa.com","phone":"222","gender":"male"}]
/// status : true
/// code : 200

class ProfileResponse {
  ProfileResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  ProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}