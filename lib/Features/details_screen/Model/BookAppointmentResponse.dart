import 'Data.dart';

/// message : "Created Successfuly"
/// data : {"id":89,"doctor":{"id":5,"name":"Ebony Ratke","email":"zhettinger@example.com","phone":"+14846525329","photo":"https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae","gender":"male","address":"59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859","description":"Sed quasi.","degree":"Specialist","specialization":{"id":6,"name":"Gynecology"},"city":{"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},"patient":{"id":1,"name":"diaa","email":"aa@aa.com","phone":"222","gender":"male"},"appointment_time":"Tuesday, October 10, 2023 2:00 PM","appointment_end_time":"Tuesday, October 10, 2023 2:30 PM","status":"pending","notes":"","appointment_price":300}
/// status : true
/// code : 201

class BookAppointmentResponse {
  BookAppointmentResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  BookAppointmentResponse.fromJson(dynamic json) {
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