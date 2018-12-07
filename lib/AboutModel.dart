class AboutModel {
 String infoAR ;
 String  infoEN ;
 String nameEn ;
 String nameAr ;
 String hotline ;
 String medicineTel ;
 String tel_one ;
 String tel_two ;
 String email ;
 String facebook ;
 String website ;


 AboutModel({this.email, this.facebook, this.hotline, this.infoAR, this.infoEN,
 this.medicineTel, this.nameAr, this.nameEn, this.tel_one, this.tel_two, this.website});
 factory AboutModel.fromJson(Map<String, dynamic> json) {
   return new AboutModel(
       infoAR: json['info_ar'],
       infoEN: json['info_en'],
       nameEn: json['name_ar'],
       nameAr: json['name_en'],
       hotline: json['hotline'],
       medicineTel: json['medicine_tel'],
       tel_one: json['first_tel'],
       tel_two: json['second_tel'],
       email: json['com_email'],
       facebook: json['com_facebook'],
       website: json['com_website']

   );
 }

}