class UserModel {
  String? token;
  String? username;

  UserModel({this.token, this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}
