/// id : 215
/// name : "name"
/// email : "email@email.emaill"
/// phone : "643563551"
/// gender : "0"
/// email_verified_at : null
/// created_at : "2023-09-27T09:58:57.000000Z"
/// updated_at : "2023-09-27T12:55:23.000000Z"

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}