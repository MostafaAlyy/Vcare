/// message : "Loggedout Successfuly"
/// data : []
/// status : true
/// code : 200

class LogoutResponse {
  LogoutResponse({
      this.message,
      this.status, 
      this.code,});

  LogoutResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }
  String? message;

  bool? status;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}