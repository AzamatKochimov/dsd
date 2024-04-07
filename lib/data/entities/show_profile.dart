class ShowProfile {
  String? message;
  bool? error;
  int? code;
  Results? results;

  ShowProfile({this.message, this.error, this.code, this.results});

  ShowProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String;
    error = json['error'] as bool;
    code = json['code'] as int;
    results = json['results'] != null ? Results.fromJson(json['results'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? surname;
  String? patronymic;
  String? phone;
  Personals? personals;
  Address? address;

  Results({
    this.id,
    this.name,
    this.surname,
    this.patronymic,
    this.phone,
    this.personals,
    this.address,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    surname = json['surname'] as String;
    patronymic = json['patronymic'] as String;
    phone = json['phone'] as String;
    personals = json['personals'] != null ? Personals.fromJson(json['personals'] as Map<String, dynamic>) : null;
    address = json['address'] != null ? Address.fromJson(json['address'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['patronymic'] = patronymic;
    data['phone'] = phone;
    if (personals != null) {
      data['personals'] = personals!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Personals {
  String? passportNumber;
  String? passportIssuedBy;
  String? passportDateIssue;
  String? homePhone;
  String? birthday;
  String? pinfl;
  String? inn;
  String? workCompany;
  String? workPhone;
  String? addPhone;
  String? cityBirth;
  String? dayOfSalary;
  String? activity;
  String? socialVk;
  String? socialFacebook;
  String? socialLinkedin;
  String? socialInstagram;

  Personals({
    this.passportNumber,
    this.passportIssuedBy,
    this.passportDateIssue,
    this.homePhone,
    this.birthday,
    this.pinfl,
    this.inn,
    this.workCompany,
    this.workPhone,
    this.addPhone,
    this.cityBirth,
    this.dayOfSalary,
    this.activity,
    this.socialVk,
    this.socialFacebook,
    this.socialLinkedin,
    this.socialInstagram,
  });

  Personals.fromJson(Map<String, dynamic> json) {
    passportNumber = json['passport_number'] as String?;
    passportIssuedBy = json['passport_issued_by'] as String?;
    passportDateIssue = json['passport_date_issue'] as String?;
    homePhone = json['home_phone'] as String?;
    birthday = json['birthday'] as String?;
    pinfl = json['pinfl'] as String?;
    inn = json['inn'] as String?;
    workCompany = json['work_company'] as String?;
    workPhone = json['work_phone'] as String?;
    addPhone = json['add_phone'] as String?;
    cityBirth = json['city_birth'] as String?;
    dayOfSalary = json['day_of_salary'] as String?;
    activity = json['activity'] as String?;
    socialVk = json['social_vk'] as String?;
    socialFacebook = json['social_facebook'] as String?;
    socialLinkedin = json['social_linkedin'] as String?;
    socialInstagram = json['social_instagram'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['passport_number'] = passportNumber;
    data['passport_issued_by'] = passportIssuedBy;
    data['passport_date_issue'] = passportDateIssue;
    data['home_phone'] = homePhone;
    data['birthday'] = birthday;
    data['pinfl'] = pinfl;
    data['inn'] = inn;
    data['work_company'] = workCompany;
    data['work_phone'] = workPhone;
    data['add_phone'] = addPhone;
    data['city_birth'] = cityBirth;
    data['day_of_salary'] = dayOfSalary;
    data['activity'] = activity;
    data['social_vk'] = socialVk;
    data['social_facebook'] = socialFacebook;
    data['social_linkedin'] = socialLinkedin;
    data['social_instagram'] = socialInstagram;
    return data;
  }
}

class Address {
  String? areaList;
  String? cityList;

  Address({this.areaList, this.cityList});

  Address.fromJson(Map<String, dynamic> json) {
    areaList = json['areaList'] as String?;
    cityList = json['cityList'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['areaList'] = areaList;
    data['cityList'] = cityList;
    return data;
  }
}
