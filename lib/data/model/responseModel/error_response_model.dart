

class ErrorResponseModel {
  List<String>? _nonFieldErrors;
  int? _statusCode;

  List<String>? get nonFieldErrors => _nonFieldErrors;
  int? get statusCode => _statusCode;

  ErrorResponseModel({
    List<String>? nonFieldErrors,
    int? statusCode}){
    _nonFieldErrors = nonFieldErrors;
    _statusCode = statusCode;
  }

  ErrorResponseModel.fromJson(dynamic json) {
    _nonFieldErrors = json["non_field_errors"] != null ? json["non_field_errors"].cast<String>() : [];
    _statusCode = json["status_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["non_field_errors"] = _nonFieldErrors;
    map["status_code"] = _statusCode;
    return map;
  }

}