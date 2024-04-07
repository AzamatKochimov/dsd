import 'dart:convert';

CheckSms checkSmsFromJson(String str) => CheckSms.fromJson(json.decode(str) as Map<String, dynamic>);

String checkSmsToJson(CheckSms data) => json.encode(data.toJson());

class CheckSms {
  CheckSms({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  Results? results;

  factory CheckSms.fromJson(Map<String, dynamic> json) => CheckSms(
        message: json["message"] as String,
        error: json["error"] as bool,
        code: json["code"] as int,
        results: Results.fromJson(json["results"] as Map<String, dynamic>) as Results,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "code": code,
        "results": results?.toJson(),
      } as Map<String, dynamic>;
}

class Results {
  Results({
    this.apiToken,
    this.user,
  });

  String? apiToken;
  User? user;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        apiToken: json["api_token"] as String,
        user: User.fromJson(json["user"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "api_token": apiToken,
        "user": user?.toJson(),
      } as Map<String, dynamic>;
}

class User {
  User({
    this.id,
    this.phone,
    this.status,
    this.avatar,
    this.fio,
    this.rating,
    this.personalAccount,
    this.limit,
    this.period,
    this.balance,
    this.zcoin,
  });

  int? id;
  String? phone;
  int? status;
  String? avatar;
  String? fio;
  int? rating;
  int? personalAccount;
  int? limit;
  int? period;
  int? balance;
  int? zcoin;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] as int,
        phone: json["phone"] as String,
        status: json["status"] as int,
        avatar: json["avatar"] as String,
        fio: json["fio"] as String,
        rating: json["rating"] as int,
        personalAccount: json["personal_account"] as int,
        limit: json["limit"] as int,
        period: json["period"] as int,
        balance: json["balance"] as int,
        zcoin: json["zcoin"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "status": status,
        "avatar": avatar,
        "fio": fio,
        "rating": rating,
        "personal_account": personalAccount,
        "limit": limit,
        "period": period,
        "balance": balance,
        "zcoin": zcoin,
      } as Map<String, dynamic>;
}
