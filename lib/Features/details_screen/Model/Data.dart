import 'Doctor.dart';
import 'Patient.dart';

/// id : 89
/// doctor : {"id":5,"name":"Ebony Ratke","email":"zhettinger@example.com","phone":"+14846525329","photo":"https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae","gender":"male","address":"59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859","description":"Sed quasi.","degree":"Specialist","specialization":{"id":6,"name":"Gynecology"},"city":{"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"}
/// patient : {"id":1,"name":"diaa","email":"aa@aa.com","phone":"222","gender":"male"}
/// appointment_time : "Tuesday, October 10, 2023 2:00 PM"
/// appointment_end_time : "Tuesday, October 10, 2023 2:30 PM"
/// status : "pending"
/// notes : ""
/// appointment_price : 300

class Data {
  Data({
      this.id, 
      this.doctor, 
      this.patient, 
      this.appointmentTime, 
      this.appointmentEndTime, 
      this.status, 
      this.notes, 
      this.appointmentPrice,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    appointmentTime = json['appointment_time'];
    appointmentEndTime = json['appointment_end_time'];
    status = json['status'];
    notes = json['notes'];
    appointmentPrice = json['appointment_price'];
  }
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (doctor != null) {
      map['doctor'] = doctor?.toJson();
    }
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    map['appointment_time'] = appointmentTime;
    map['appointment_end_time'] = appointmentEndTime;
    map['status'] = status;
    map['notes'] = notes;
    map['appointment_price'] = appointmentPrice;
    return map;
  }

}