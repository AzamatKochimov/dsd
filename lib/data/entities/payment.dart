class Payment {
  String? message;
  bool? error;
  int? code;
  Results? results;

  Payment({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    error = json['error'] as bool?;
    code = json['code'] as int?;
    results = json['results'] != null ? Results.fromJson(json['results'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'error': error,
        'code': code,
        'results': results?.toJson(),
      };
}

class Results {
  List<PaymentType>? paymentType;

  Results({this.paymentType});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      paymentType = <PaymentType>[];
      for (final v in json['list'] as List<dynamic>) {
        paymentType?.add(PaymentType.fromJson(v as Map<String, dynamic>));
      }
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'info': <String, dynamic>{},
        'list': paymentType?.map((e) => e.toJson()).toList(growable: false),
      };
}

class PaymentType {
  String? type;
  String? title;
  String? icon;
  List<Children>? children;

  PaymentType({
    this.type,
    this.title,
    this.icon,
    this.children,
  });

  PaymentType.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    title = json['title'] as String?;
    icon = json['icon'] as String?;
    if (json['childs'] != null) {
      children = <Children>[];
      for (final v in json['childs'] as List<dynamic>) {
        children?.add(Children.fromJson(v as Map<String, dynamic>));
      }
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'title': title,
        'icon': icon,
        'childs': children?.map((v) => v.toJson()).toList() ?? [],
      };
}

class Children {
  int? id;
  String? name;
  int? serviceId;
  String? type;
  String? image;

  Children({
    this.id,
    this.name,
    this.serviceId,
    this.type,
    this.image,
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    serviceId = json['service_id'] as int?;
    type = json['type'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'service_id': serviceId,
        'type': type,
        'image': image,
      };
}
