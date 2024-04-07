import 'dart:convert';

GetCardsModel getCardsModelFromJson(String str) => GetCardsModel.fromJson(json.decode(str) as Map<String, dynamic>);

// String getCardsModelToJson(GetContract data) => json.encode(data.toJson());

class GetCardsModel {
  GetCardsModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  List<Result>? results;

  factory GetCardsModel.fromJson(Map<String, dynamic> json) => GetCardsModel(
        message: json['message'] as String,
        error: json['error'] as bool,
        code: json['code'] as int,
        results: List<Result>.from(json['results'].map((dynamic x) => Result.fromJson(x as Map<String, dynamic>)) as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'error': error,
        'code': code,
        'results': List<dynamic>.from(results != null ? results!.map<dynamic>((Result x) => x.toJson()) : <dynamic>[]),
      };
}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int,
        publicNumber: json['public_number'] as String,
        publicCardName: json['public_card_name'] as String,
        type: json['type'] as String,
        cardValidDate: json['card_valid_date'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'public_number': publicNumber,
        'public_card_name': publicCardName,
        'type': type,
        'card_valid_date': cardValidDate,
      };
}
