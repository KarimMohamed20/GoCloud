
class User {
  String userName_ar;
  String userName_en;
  String userID;
  String userCode;
  String photo;
  String company;
  String gender;

  User(
      {this.userName_ar, this.userName_en, this.userID, this.userCode, this.photo, this.company, this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      userName_ar: json['name_ar'],
      userName_en: json['name_en'],
      userID: json['id'],
      userCode: json['type_code'],
      photo: json['photo'],
      company: json['company'],
      gender: json['gender'],
    );
  }
}
