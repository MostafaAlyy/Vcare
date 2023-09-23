import 'Doctors.dart';

/// id : 9
/// name : "Gastroenterology"
/// doctors : [{"id":1,"name":"Finn Orn DVM","email":"roderick51@example.net","phone":"+1.956.684.0448","photo":"https://via.placeholder.com/640x480.png/0099cc?text=doctors+ab","gender":"male","address":"258 Tiffany View Suite 262\nPort Alyceland, ND 16329-8282","description":"Velit et.","degree":"Consultant","specialization":{"id":9,"name":"Gastroenterology"},"city":{"id":36,"name":"Port Cordelialand","governrate":{"id":2,"name":"town"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},{"id":14,"name":"Sister Adams","email":"rosie26@example.org","phone":"+1-228-553-3439","photo":"https://via.placeholder.com/640x480.png/00aabb?text=doctors+voluptatibus","gender":"female","address":"2555 Hoeger Plains\nNorth Hank, CT 14568-4285","description":"Aut neque.","degree":"Consultant","specialization":{"id":9,"name":"Gastroenterology"},"city":{"id":28,"name":"Port Claude","governrate":{"id":8,"name":"mouth"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"}]

class Data {
  Data({
      this.id, 
      this.name, 
      this.doctors,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['doctors'] != null) {
      doctors = [];
      json['doctors'].forEach((v) {
        doctors?.add(Doctors.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  List<Doctors>? doctors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (doctors != null) {
      map['doctors'] = doctors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}