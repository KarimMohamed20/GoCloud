class Vendors{
  String id;
  String ar_name;
  String address;
  int districts_id;
  String tel_1;
  String tel_2;
  String workingHours;
  String booking_terms;
  String info;
  String website;
  int cityID;
  String city;
  int serviceID;
  String service_name;
  String district;
  String lat;
  String longt;
  String spName;
  Vendors({this.address, this.id, this.ar_name, this.districts_id, this.tel_1, this.tel_2, this.workingHours, this.booking_terms,
    this.info, this.website, this.cityID, this.city, this.serviceID, this.service_name, this.district, this.lat, this.longt, this.spName});
  factory Vendors.fromJson(Map<String, dynamic> json) {
    return new Vendors(
      id: json['id'],
      ar_name:json['id'],
      address:json['id'],
      districts_id:json['id'],
      tel_1:json['id'],
      tel_2:json['id'],
      workingHours:json['id'],
      booking_terms:json['id'],
      info:json['id'],
      website:json['id'],
      cityID:json['id'],
      city:json['id'],
      serviceID:json['id'],
      service_name:json['id'],
      district:json['id'],
      lat:json['id'],
      longt:json['id'],
      spName:json['id'],
    );
  }
}