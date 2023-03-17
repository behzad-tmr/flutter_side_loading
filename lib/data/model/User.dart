
class User {
  User({
      int? id, 
      String? bio, 
      String? mobile, 
      String? username, 
      String? lastName, 
      String? firstName, 
      String? avatar,}){
    _id = id;
    _bio = bio;
    _mobile = mobile;
    _username = username;
    _lastName = lastName;
    _firstName = firstName;
    _avatar = avatar;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _bio = json['bio'];
    _mobile = json['mobile'];
    _username = json['username'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _avatar = json['avatar'];
  }
  int? _id;
  String? _bio;
  String? _mobile;
  String? _username;
  String? _lastName;
  String? _firstName;
  String? _avatar;

  int? get id => _id;
  String? get bio => _bio;
  String? get mobile => _mobile;
  String? get username => _username;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bio'] = _bio;
    map['mobile'] = _mobile;
    map['username'] = _username;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['avatar'] = _avatar;
    return map;
  }

}