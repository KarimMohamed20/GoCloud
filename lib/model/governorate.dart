
class governorate {
  final int id;
  final String name_ar;
  final String name_en;
  final int  parent;
  final List<dynamic> districts;

  governorate({this.id, this.name_ar, this.name_en, this.parent , this.districts});

  factory governorate.fromJson(Map<String, dynamic> parsedJson){
    return governorate(
        id: parsedJson['id'],
        name_ar : parsedJson['name_ar'],
        name_en : parsedJson['name_en'],
        parent : parsedJson['parent'],
        districts : parsedJson['districts']


    );
  }
}