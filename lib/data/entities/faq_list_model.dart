import 'dart:convert';

FaqListModel faqListModelFromJson(String str) => FaqListModel.fromJson(json.decode(str) as Map<String, dynamic>);

String faqListModelToJson(FaqListModel data) => json.encode(data.toJson());

class FaqListModel {
  FaqListModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  List<Result>? results;

  factory FaqListModel.fromJson(Map<String, dynamic> json) => FaqListModel(
        message: json["message"] as String?,
        error: json["error"] as bool?,
        code: json["code"] as int?,
        results: List<Result>.from(json["results"].map((dynamic x) => Result.fromJson(x as Map<String, dynamic>)) as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "code": code,
        "results": List<Result>.from(results?.map((x) => x.toJson()) as Iterable<dynamic>),
      } as Map<String, dynamic>;
}

class Result {
  Result({
    this.id,
    this.title,
    this.text,
  });

  int? id;
  String? title;
  String? text;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as int?,
        title: json["title"] as String?,
        text: json["text"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
      } as Map<String, dynamic>;
}
