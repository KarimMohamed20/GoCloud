class  VerifyModel {
  String arabicName;
  String englishName;
  String insuranceStatus;
  String insuranceClass;
  String pharmacyCoinsurance;
  String startDate;
  String expireDate;
  String policyCode;

  VerifyModel({
    this.arabicName,
    this.englishName,
    this.startDate,
    this.expireDate,
    this.insuranceClass,
    this.insuranceStatus,
    this.pharmacyCoinsurance,
    this.policyCode,
});
  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return new VerifyModel(
      arabicName: json['Arabic_Name'],
      englishName: json['English_Name'],
      startDate: json['Start_Date'],
      expireDate: json['Expire_Date'],
      insuranceClass: json['Insurance_Class'],
      insuranceStatus: json['Insurance_Status'],
      pharmacyCoinsurance: json['Pharmacy_Coinsurance'],
      policyCode: json['Policy_Code'],
    );
  }
}

