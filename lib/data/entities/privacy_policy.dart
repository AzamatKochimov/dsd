class PrivacyPolicy {
  String? message;
  bool? error;
  int? code;
  Results? results;

  PrivacyPolicy({this.message, this.error, this.code, this.results});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
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
  String? text;

  Results({this.text});

  Results.fromJson(Map<String, dynamic> json) {
    text = json['text'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}
