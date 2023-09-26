/// id : 9
/// name : "fort"

class Governrate {
  Governrate({
      this.id, 
      this.name,});

  Governrate.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}