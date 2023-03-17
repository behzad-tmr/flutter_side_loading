

class LoginWithMobileRm {
  LoginWithMobileRm({
      String? mobile,}){
    _mobile = mobile;
}

  LoginWithMobileRm.fromJson(dynamic json) {
    _mobile = json['mobile'];
  }
  String? _mobile;

  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    return map;
  }

}