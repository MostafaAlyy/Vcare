import 'Governrate.dart';

/// id : 20
/// name : "Jordystad"
/// governrate : {"id":9,"name":"fort"}

class City {
  City({
      this.id, 
      this.name, 
      this.governrate,});

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    governrate = json['governrate'] != null ? Governrate.fromJson(json['governrate']) : null;
  }
  int? id;
  String? name;
  Governrate? governrate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (governrate != null) {
      map['governrate'] = governrate?.toJson();
    }
    return map;
  }

}