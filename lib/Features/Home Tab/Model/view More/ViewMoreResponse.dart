import 'Data.dart';

/// message : "Successful Query"
/// data : {"id":1,"name":"Cardiology","doctors":[{"id":2,"name":"Prof. Rafaela Gutkowski","email":"mann.ubaldo@example.net","phone":"+1 (352) 660-1282","photo":"https://via.placeholder.com/640x480.png/001177?text=doctors+quasi","gender":"female","address":"5681 Heidenreich Haven\nPort Aiyana, NC 26317","description":"Quo eum.","degree":"Specialist","specialization":{"id":1,"name":"Cardiology"},"city":{"id":33,"name":"New Idellbury","governrate":{"id":14,"name":"land"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":4,"name":"Lucious Ebert","email":"dovie18@example.org","phone":"1-779-922-5431","photo":"https://via.placeholder.com/640x480.png/009900?text=doctors+aut","gender":"male","address":"7232 Prohaska Pike\nPort Jane, MN 60366-1694","description":"Et sed.","degree":"Consultant","specialization":{"id":1,"name":"Cardiology"},"city":{"id":9,"name":"North Graycechester","governrate":{"id":18,"name":"stad"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":6,"name":"Laurie Abbott","email":"xgulgowski@example.org","phone":"+1-641-984-5861","photo":"https://via.placeholder.com/640x480.png/00bb11?text=doctors+ratione","gender":"male","address":"67903 Cullen Villages Suite 405\nHobartstad, OK 70256","description":"Quas.","degree":"Specialist","specialization":{"id":1,"name":"Cardiology"},"city":{"id":11,"name":"East Lulaview","governrate":{"id":19,"name":"borough"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":22,"name":"Jaydon Wunsch","email":"bfisher@example.com","phone":"+1.434.265.1264","photo":"https://via.placeholder.com/640x480.png/008899?text=doctors+numquam","gender":"female","address":"2248 Beaulah Gardens\nNorth Willview, MA 32667","description":"Quod.","degree":"Specialist","specialization":{"id":1,"name":"Cardiology"},"city":{"id":1,"name":"Carmeloside","governrate":{"id":11,"name":"shire"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":38,"name":"Dr. Tre Stoltenberg","email":"jaeden.gerlach@example.com","phone":"331.895.0195","photo":"https://via.placeholder.com/640x480.png/003300?text=doctors+ex","gender":"male","address":"73496 Keeling Crossing Suite 174\nNew Alenaville, MO 83473-5208","description":"Et eum.","degree":"Consultant","specialization":{"id":1,"name":"Cardiology"},"city":{"id":34,"name":"Vonmouth","governrate":{"id":18,"name":"stad"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":58,"name":"Ms. Bernita Spinka","email":"mthompson@example.org","phone":"+1-984-921-8710","photo":"https://via.placeholder.com/640x480.png/00aa66?text=doctors+dolore","gender":"male","address":"83198 Huels Avenue Apt. 280\nGreenfelderhaven, ME 27018-3362","description":"Veniam.","degree":"Specialist","specialization":{"id":1,"name":"Cardiology"},"city":{"id":15,"name":"Port Nelson","governrate":{"id":18,"name":"stad"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"}]}
/// status : true
/// code : 200

class ViewMoreResponse {
  ViewMoreResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  ViewMoreResponse.fromJson(dynamic json) {
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