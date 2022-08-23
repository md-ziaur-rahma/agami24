class NewsModel {
  int? _status;
  bool? _success;
  int? _code;
  String? _message;
  String? _description;
  List<Data>? _data;
  dynamic _errors;
  Api? _api;

  int? get status => _status;
  bool? get success => _success;
  int? get code => _code;
  String? get message => _message;
  String? get description => _description;
  List<Data>? get data => _data;
  dynamic get errors => _errors;
  Api? get api => _api;


  set status(int? value) {
    _status = value;
  }

  NewsModel({
      int? status, 
      bool? success, 
      int? code, 
      String? message, 
      String? description, 
      List<Data>? data, 
      dynamic errors, 
      Api? api}){
    _status = status;
    _success = success;
    _code = code;
    _message = message;
    _description = description;
    _data = data;
    _errors = errors;
    _api = api;
}

  NewsModel.fromJson(dynamic json) {
    _status = json["status"];
    _success = json["success"];
    _code = json["code"];
    _message = json["message"];
    _description = json["description"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
    _errors = json["errors"];
    _api = json["api"] != null ? Api.fromJson(json["api"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["success"] = _success;
    map["code"] = _code;
    map["message"] = _message;
    map["description"] = _description;
    if (_data != null) {
      map["data"] = _data!.map((v) => v.toJson()).toList();
    }
    map["errors"] = _errors;
    if (_api != null) {
      map["api"] = _api!.toJson();
    }
    return map;
  }

  set success(bool? value) {
    _success = value;
  }

  set code(int? value) {
    _code = value;
  }

  set message(String? value) {
    _message = value;
  }

  set description(String? value) {
    _description = value;
  }

  set data(List<Data>? value) {
    _data = value;
  }

  set errors(dynamic value) {
    _errors = value;
  }

  set api(Api? value) {
    _api = value;
  }
}

class Api {
  String? _version;

  String? get version => _version;


  set version(String? value) {
    _version = value;
  }

  Api({
      String? version}){
    _version = version;
}

  Api.fromJson(dynamic json) {
    _version = json["version"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["version"] = _version;
    return map;
  }

}

class Data {
  String? _urlslug;
  String? _title;
  String? _featureimage;
  String? _summary;
  String? _sscreatedon;
  String? _publishdate;

  String? get urlslug => _urlslug;
  String? get title => _title;
  String? get featureimage => _featureimage;
  String? get summary => _summary;
  String? get sscreatedon => _sscreatedon;
  String? get publishdate => _publishdate;


  set urlslug(String? value) {
    _urlslug = value;
  }

  Data({
      String? urlslug, 
      String? title, 
      String? featureimage, 
      String? summary, 
      String? sscreatedon, 
      String? publishdate}){
    _urlslug = urlslug;
    _title = title;
    _featureimage = featureimage;
    _summary = summary;
    _sscreatedon = sscreatedon;
    _publishdate = publishdate;
}

  Data.fromJson(dynamic json) {
    _urlslug = json["URL_SLUG"];
    _title = json["TITLE"];
    _featureimage = json["FEATURE_IMAGE"];
    _summary = json["SUMMARY"];
    _sscreatedon = json["SS_CREATED_ON"];
    _publishdate = json["PUBLISH_DATE"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["URL_SLUG"] = _urlslug;
    map["TITLE"] = _title;
    map["FEATURE_IMAGE"] = _featureimage;
    map["SUMMARY"] = _summary;
    map["SS_CREATED_ON"] = _sscreatedon;
    map["PUBLISH_DATE"] = _publishdate;
    return map;
  }

  set title(String? value) {
    _title = value;
  }

  set featureimage(String? value) {
    _featureimage = value;
  }

  set summary(String? value) {
    _summary = value;
  }

  set sscreatedon(String? value) {
    _sscreatedon = value;
  }

  set publishdate(String? value) {
    _publishdate = value;
  }
}