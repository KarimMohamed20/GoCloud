class Vendors{
  String id;
  String ar_name;
  String address;
  String districts_id;
  String tel_1;
  String tel_2;
  String workingHours;
  String booking_terms;
  String info;
  String website;
  String cityID;
  String city;
  double serviceID;
  String service_name;
  String district;
  double lat;
  double longt;
  String spName;
  Vendors({this.address, this.id, this.ar_name, this.districts_id, this.tel_1, this.tel_2, this.workingHours, this.booking_terms,
    this.info, this.website, this.cityID, this.city, this.serviceID, this.service_name, this.district, this.lat, this.longt, this.spName});
  factory Vendors.fromJson(Map<String, dynamic> json) {
    return new Vendors(
      id: json['ST_VCODE'],
      ar_name:json['name'],
      address:json['address'],
      districts_id:json['district_id'],
      tel_1:json['tel1'],
      tel_2:json['tel2'],
      workingHours:json['working_hours'],
      booking_terms:json['booking_terms'],
      info:json['extra'],
      website:json['website'],
      cityID:json['city_id'],
      city:json['city'],
      serviceID:json['service_id'],
      service_name:json['service'],
      district:json['district'],
      lat:json['lat'],
      longt:json['longt'],
      spName:json['specialty_name'],
    );
  }
}