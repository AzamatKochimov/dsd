import 'dart:convert';

AddCardConfirmModel addCardConfirmModelFromJson(String str) => AddCardConfirmModel.fromJson(json.decode(str) as Map<String, dynamic>);

String addCardConfirmModelToJson(AddCardConfirmModel data) => json.encode(data.toJson());

class AddCardConfirmModel {
  AddCardConfirmModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  Results? results;

  factory AddCardConfirmModel.fromJson(Map<String, dynamic> json) => AddCardConfirmModel(
        message: json['message'] as String?,
        error: json["error"] as bool?,
        code: json["code"] as int?,
        results: json["results"] != null ? Results.fromJson(json["results"] as Map<String, dynamic>) : null,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "message": message,
        "error": error,
        "code": code,
        "results": results?.toJson(),
      };
}

class Results {
  Results({
    this.id,
    this.publicNumber,
    this.publicCardName,
    this.type,
    this.cardValidDate,
  });

  int? id;
  String? publicNumber;
  String? publicCardName;
  String? type;
  String? cardValidDate;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"] as int?,
        publicNumber: json["public_number"] as String?,
        publicCardName: json["public_card_name"] as String?,
        type: json["type"] as String?,
        cardValidDate: json["card_valid_date"] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "public_number": publicNumber,
        "public_card_name": publicCardName,
        "type": type,
        "card_valid_date": cardValidDate,
      };
}
