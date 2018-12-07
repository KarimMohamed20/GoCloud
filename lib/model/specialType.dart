

class specialType {
  final int st_gccode;
  final String name;
  final List<dynamic> speciality;
  specialType({this.st_gccode, this.name, this.speciality});

  factory specialType.fromJson(Map<String, dynamic> parsedJson){
    return specialType(
        st_gccode: parsedJson['st_gccode'],
        name : parsedJson['name'],
        speciality : parsedJson['speciality']
    );
  }
}