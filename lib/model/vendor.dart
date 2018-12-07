class Vendor {
  String _ST_VCODE;
  String _name;
  double _service_id;
  int _city_id;
  int _district_id;
  String _address;
  String _tel1;
  String _tel2;
  String _working_hours;
  String _booking_terms;
  String _extra;

  String _website;
  String _service;
  String _city;
  String _district;
  String _lat;
  String _longt;
  String _specialty_name;

  Vendor(this._ST_VCODE, this._name,this._specialty_name);

  Vendor.map(dynamic obj) {
    this._ST_VCODE = obj['ST_VCODE'];
    this._name = obj['name'];
    this._specialty_name = obj['specialty_name'];
  }

  String get ST_VCODE => _ST_VCODE;
  String get name => _name;
  String get specialty_name => _specialty_name;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_ST_VCODE != null) {
      map['ST_VCODE'] = _ST_VCODE;
    }
    map['name'] = _name;
    map['specialty_name'] = _specialty_name;

    return map;
  }

  Vendor.fromMap(Map<String, dynamic> map) {
    this._ST_VCODE = map['_ST_VCODE'];
    this._name = map['_name'];
    this._specialty_name = map['_specialty_name'];
  }
}