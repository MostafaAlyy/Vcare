import 'Specialization.dart';
import 'City.dart';

/// id : 5
/// name : "Ebony Ratke"
/// email : "zhettinger@example.com"
/// phone : "+14846525329"
/// photo : "https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae"
/// gender : "male"
/// address : "59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859"
/// description : "Sed quasi."
/// degree : "Specialist"
/// specialization : {"id":6,"name":"Gynecology"}
/// city : {"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}}
/// appoint_price : 300
/// start_time : "14:00:00 PM"
/// end_time : "20:00:00 PM"

class Doctor {
  Doctor({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.photo, 
      this.gender, 
      this.address, 
      this.description, 
      this.degree, 
      this.specialization, 
      this.city, 
      this.appointPrice, 
      this.startTime, 
      this.endTime,});

  Doctor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    gender = json['gender'];
    address = json['address'];
    description = json['description'];
    degree = json['degree'];
    specialization = json['specialization'] != null ? Specialization.fromJson(json['specialization']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    appointPrice = json['appoint_price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['photo'] = photo;
    map['gender'] = gender;
    map['address'] = address;
    map['description'] = description;
    map['degree'] = degree;
    if (specialization != null) {
      map['specialization'] = specialization?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['appoint_price'] = appointPrice;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    return map;
  }

}