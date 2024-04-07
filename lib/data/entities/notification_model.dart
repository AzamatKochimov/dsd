import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str) as Map<String, dynamic>);

// String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  List<dynamic>? results;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        message: json["message"] as String?,
        error: json["error"] as bool?,
        code: json["code"] as int?,
        results: List<dynamic>.from(
          json["results"].map((dynamic x) => x) as Iterable<dynamic>,
        ),
      );

// Map<String, dynamic> toJson() => {
//   "message": message,
//   "error": error,
//   "code": code,
//   "results": List<dynamic>.from(results.map((dynamic x) => x).toList(growable: false) as List<dynamic>),
// } as Map<String,dynamic>;
}
