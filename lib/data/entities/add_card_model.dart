import 'dart:convert';

AddCardModel addCardModelFromJson(String str) => AddCardModel.fromJson(json.decode(str) as Map<String, dynamic>);

String addCardModelToJson(AddCardModel data) => json.encode(data.toJson());

class AddCardModel {
  AddCardModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  dynamic results;

  factory AddCardModel.fromJson(Map<String, dynamic> json) => AddCardModel(
        message: json["message"] as String?,
        error: json["error"] as bool?,
        code: json["code"] as int?,
        results: json["results"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "message": message,
        "error": error,
        "code": code,
        "results": results,
      };
}
