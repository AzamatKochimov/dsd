import 'dart:convert';

GetContractModel getContractModelFromJson(String str) => GetContractModel.fromJson(json.decode(str) as Map<String, dynamic>);

// String getContractModelToJson(GetContract data) => json.encode(data.toJson());

class GetContractModel {
  GetContractModel({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  String? message;
  bool? error;
  int? code;
  List<dynamic>? results;

  factory GetContractModel.fromJson(Map<String, dynamic> json) => GetContractModel(
        message: json["message"] as String,
        error: json["error"] as bool,
        code: json["code"] as int,
        results: json["results"] as List<dynamic>,
      );

// Map<String, dynamic> toJson() => {
//   "message": message,
//   "error": error,
//   "code": code,
//   "results": List<dynamic>.from(results?.map((dynamic x) => x) as List<dynamic>),
// } as Map<String,dynamic>;
}
