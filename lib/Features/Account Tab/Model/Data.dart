/// id : 1
/// name : "diaa"
/// email : "aa@aa.com"
/// phone : "222"
/// gender : "male"

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.gender,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    return map;
  }

}